---
# title: Raw images on Web uses correct origin and colors
title: 网络上的原始图像使用正确的来源和颜色
# description: >
#   Raw images directly decoded by calling the Web engine functions now
#   uses the correct pixel format and starts from the top left corner.
description: >
  通过调用 Web 引擎函数直接解码的原始图像现在使用正确的像素格式并从左上角开始。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


How raw images are rendered on Web has been corrected
and is now consistent with that on other platforms.
This breaks legacy apps that had to feed incorrect data
to `ui.ImageDescriptor.raw` or `ui.decodeImageFromPixels`,
causing the resulting images to be upside-down
and incorrectly colored
(whose red and blue channels are swapped.)

原始图像在 Web 上的渲染方式已得到纠正，现在与其他平台上的一致。这会破坏必须向“ui.ImageDescriptor.raw”或“ui.decodeImageFromPixels”提供不正确数据的旧版应用程序，导致生成的图像上下颠倒且颜色不正确（其红色和蓝色通道被交换）。


## Context

## 背景


The "pixel stream" that Flutter uses internally
has always been defined as the same format:
for each pixel, four 8-bit channels are packed in the order defined
by a `format` argument, then grouped in a row,
from left to right, then rows from top to bottom.

Flutter 内部使用的“像素流”始终被定义为相同的格式：对于每个像素，四个 8 位通道按照“format”参数定义的顺序打包，然后从左到右、从上到下分组为一行。


However, Flutter for Web, or more specifically, the HTML renderer,
used to implement it in a wrong way
due to incorrect understanding of the BMP format specification.
As a result, if the app or library uses
`ui.ImageDescriptor.raw` or `ui.decodeImageFromPixels`,
it had to feed pixels from bottom to top and swap their red and blue channels
(for example, with the `ui.PixelFormat.rgba8888` format,
the first 4 bytes of the data were considered the blue, green,
red, and alpha channels of the first pixel instead.)

然而，Flutter for Web，或者更具体地说，HTML 渲染器，由于对 BMP 格式规范的理解不正确，导致以错误的方式实现它。因此，如果应用程序或库使用“ui.ImageDescriptor.raw”或“ui.decodeImageFromPixels”，它必须从下到上馈送像素并交换其红色和蓝色通道（例如，使用“ui.PixelFormat.rgba8888”格式，数据的前 4 个字节被视为第一个像素的蓝色、绿色、红色和 Alpha 通道。）


This bug has been fixed by [engine#29593][],
but apps and libraries have to correct how their data are generated.

[engine#29593][] 已修复此错误，但应用程序和库必须更正其数据的生成方式。


## Description of change

## 变更说明


The `pixels` argument of `ui.ImageDescriptor.raw` or `ui.decodeImageFromPixels`
now uses the correct pixel order described by `format`,
and originates from the top left corner.

“ui.ImageDescriptor.raw”或“ui.decodeImageFromPixels”的“pixels”参数现在使用“format”描述的正确像素顺序，并且源自左上角。


Images rendered by directly calling these two functions
Legacy code that invokes these functions directly might
find their images upside down and colored incorrectly.

通过直接调用这两个函数渲染的图像直接调用这些函数的旧代码可能会发现它们的图像颠倒且颜色不正确。


## Migration guide

## 迁移指南


If the app uses the latest version of Flutter and experiences this situation,
the most direct solution is to manually flip the image, and use the alternate
pixel format. However, this is unlikely the most optimized solution,
since such pixel data are usually constructed from other sources,
allowing flipping during the construction process.

如果应用程序使用最新版本的 Flutter 并遇到这种情况，最直接的解决方案是手动翻转图像，并使用备用像素格式。然而，这不太可能是最优化的解决方案，因为此类像素数据通常是从其他来源构建的，允许在构建过程中翻转。


Code before migration:

迁移前的代码：


```dart
import 'dart:typed_data';
import 'dart:ui' as ui;

// Parse `image` as a displayable image.
//
// Each byte in `image` is a pixel channel, in the order of blue, green, red,
// and alpha, starting from the bottom left corner and going row first.
Future<ui.Image> parseMyImage(Uint8List image, int width, int height) async {
  final ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
    await ui.ImmutableBuffer.fromUint8List(image),
    width: width,
    height: height,
    pixelFormat: ui.PixelFormat.rgba8888,
  );
  return (await (await descriptor.instantiateCodec()).getNextFrame()).image;
}
```

Code after migration:

迁移后的代码：


```dart
import 'dart:typed_data';
import 'dart:ui' as ui;

Uint8List verticallyFlipImage(Uint8List sourceBytes, int width, int height) {
  final Uint32List source = Uint32List.sublistView(ByteData.sublistView(sourceBytes));
  final Uint32List result = Uint32List(source.length);
  int sourceOffset = 0;
  int resultOffset = 0;
  for (final int row = height - 1; row >= 0; row -= 1) {
    sourceOffset = width * row;
    for (final int col = 0; col < width; col += 1) {
      result[resultOffset] = source[sourceOffset];
      resultOffset += 1;
      sourceOffset += 1;
    }
  }
  return Uint8List.sublistView(ByteData.sublistView(sourceBytes))
}

Future<ui.Image> parseMyImage(Uint8List image, int width, int height) async {
  final Uint8List correctedImage = verticallyFlipImage(image, width, height);
  final ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
    await ui.ImmutableBuffer.fromUint8List(correctedImage),
    width: width,
    height: height,
    pixelFormat: ui.PixelFormat.rgba8888,
  );
  return (await (await descriptor.instantiateCodec()).getNextFrame()).image;
}
```

A trickier situation is when you're writing a library,
and you want this library to work on both the most recent Flutter
and a pre-patch one.
In that case, you can decide whether the behavior has been changed
by letting it decode a single pixel first.

一种更棘手的情况是，当你编写一个库时，你希望该库能够在最新的 Flutter 和补丁前的 Flutter 上运行。在这种情况下，你可以通过首先解码单个像素来确定行为是否已更改。


Code after migration:

迁移后的代码：


```dart
Uint8List verticallyFlipImage(Uint8List sourceBytes, int width, int height) {
  // Same as the example above.
}

late Future<bool> imageRawUsesCorrectBehavior = (() async {
  final ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
    await ui.ImmutableBuffer.fromUint8List(Uint8List.fromList(<int>[0xED, 0, 0, 0xFF])),
    width: 1, height: 1, pixelFormat: ui.PixelFormat.rgba8888);
  final ui.Image image = (await (await descriptor.instantiateCodec()).getNextFrame()).image;
  final Uint8List resultPixels = Uint8List.sublistView(
    (await image.toByteData(format: ui.ImageByteFormat.rawStraightRgba))!);
  return resultPixels[0] == 0xED;
})();

Future<ui.Image> parseMyImage(Uint8List image, int width, int height) async {
  final Uint8List correctedImage = (await imageRawUsesCorrectBehavior) ?
    verticallyFlipImage(image, width, height) : image;
  final ui.ImageDescriptor descriptor = ui.ImageDescriptor.raw(
    await ui.ImmutableBuffer.fromUint8List(correctedImage), // Use the corrected image
    width: width,
    height: height,
    pixelFormat: ui.PixelFormat.bgra8888, // Use the alternate format
  );
  return (await (await descriptor.instantiateCodec()).getNextFrame()).image;
}
```

## Timeline

## 时间轴


Landed in version: 2.9.0-0.0.pre<br>
In stable release: 2.10

登陆版本：2.9.0-0.0.pre<br> 稳定版本：2.10


## References

## 参考


API documentation:

API 文档：


* [`decodeImageFromPixels`][]


* [`ImageDescriptor.raw`][]

  [`ImageDescriptor.raw`][]


Relevant issues:

相关问题：


* [Web: Regression in Master - PDF display distorted due to change in BMP Encoder][]


* [Web: ImageDescriptor.raw flips and inverts images (partial reason included)][]

  [Web：ImageDescriptor.raw 翻转和反转图像（包括部分原因）][`ImageDescriptor.raw`]


Relevant PRs:

相关 PR：


* [Web: Reland: Fix BMP encoder][]

  [Web：Reland：修复 BMP 编码器][Web: Reland: Fix BMP encoder]

* [Clarify ImageDescriptor.raw pixel order and add version detector][]

  [澄清 ImageDescriptor.raw 像素顺序并添加版本检测器][`ImageDescriptor.raw`]


[`decodeImageFromPixels`]: {{site.api}}/flutter/dart-ui/decodeImageFromPixels.html
[`ImageDescriptor.raw`]: {{site.api}}/flutter/dart-ui/ImageDescriptor/ImageDescriptor.raw.html

[Web: Regression in Master - PDF display distorted due to change in BMP Encoder]: {{site.repo.flutter}}/issues/93615
[Web: ImageDescriptor.raw flips and inverts images (partial reason included)]: {{site.repo.flutter}}/issues/89610

[engine#29593]: {{site.repo.engine}}/pull/29593
[Web: Reland: Fix BMP encoder]: {{site.repo.engine}}/pull/29593
[Clarify ImageDescriptor.raw pixel order and add version detector]: {{site.repo.engine}}/pull/30343
