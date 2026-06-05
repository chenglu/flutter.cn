---
# title: Adding ImageProvider.loadBuffer
title: 添加 ImageProvider.loadBuffer
# description: >
#   ImageProviders must now be implemented using the
#   new loadBuffer API instead of the existing load API.
description: >
  ImageProvider 现在必须使用新的 loadBuffer API 实现，
  而非现有的 load API。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

* `ImageProvider` now has a method called `loadBuffer` that functions
   similarly to `load`, except that it decodes from an `ui.ImmutableBuffer`.
* `ui.ImmutableBuffer` can now be created directly from an asset key.
* The `AssetBundle` classes can now load an `ui.ImmutableBuffer`.
* The `PaintingBinding` now has a method called
  `instantiateImageCodecFromBuffer`, which functions similarly to
  `instantiateImageCodec`.
* `ImageProvider.load` is now deprecated, it will be removed in a future
   release.
* `PaintingBinding.instantiateImageCodec` is now deprecated, it will be removed
   in a future release.

* `ImageProvider` 现在有一个名为 `loadBuffer` 的方法，
   功能类似于 `load`，但从 `ui.ImmutableBuffer` 解码。
* `ui.ImmutableBuffer` 现在可以直接从 asset key 创建。
* `AssetBundle` 类现在可以加载 `ui.ImmutableBuffer`。
* `PaintingBinding` 现在有一个名为 `instantiateImageCodecFromBuffer` 的方法，
  功能类似于 `instantiateImageCodec`。
* `ImageProvider.load` 现已弃用，将在未来版本中移除。
* `PaintingBinding.instantiateImageCodec` 现已弃用，将在未来版本中移除。

## Context

## 背景

`ImageProvider.loadBuffer` is a new method that must be implemented in order to
load images. This API allows asset-based image loading to be performed faster
and with less memory impact on application.

`ImageProvider.loadBuffer` 是必须实现的新方法才能加载图像。
此 API 让基于 asset 的图像加载更快，
对应用的内存影响更小。

## Description of change

## 变更说明

When loading asset images, previously the image provider API required multiple
copies of the compressed data. First, when opening the asset the data was
copied into the external heap and exposed to Dart as a typed data array. Then
that typed data array was eventually converted into an `ui.ImmutableBuffer`,
which internally copies the data into a second structure for decoding.

加载 asset 图像时，此前 image provider API 需要多份压缩数据副本。
首先，打开 asset 时数据被复制到外部堆并以 typed data 数组形式暴露给 Dart。
然后该 typed data 数组最终被转换为 `ui.ImmutableBuffer`，
内部将数据复制到第二个结构以供解码。

With the addition of `ui.ImmutableBuffer.fromAsset`, compressed image bytes can
be loaded directly into the structure used for decoding. Using this approach
requires changes to the byte loading pipeline of `ImageProvider`. This process
is also faster, because it bypasses some additional scheduling overhead of the
previous method channel based loader.

随着 `ui.ImmutableBuffer.fromAsset` 的添加，
压缩图像字节可以直接加载到用于解码的结构中。
使用此方法需要更改 `ImageProvider` 的字节加载管道。
此过程也更快，因为它绕过了先前基于 method channel 的加载器的额外调度开销。

`ImageProvider.loadBuffer` otherwise has the same contract as
`ImageProvider.load`, except it provides a new decoding callback that expects
an `ui.ImmutableBuffer` instead of a `Uint8List`. For `ImageProvider` classes
that acquire bytes from places other than assets, the convenience method
`ui.ImmutableBuffer.fromUint8List` can be used for compatibility.

除此之外，`ImageProvider.loadBuffer` 与 `ImageProvider.load` 具有相同的契约，
只是它提供了期望 `ui.ImmutableBuffer` 而非 `Uint8List` 的新解码回调。
对于从 asset 以外位置获取字节的 `ImageProvider` 类，
可使用便捷方法 `ui.ImmutableBuffer.fromUint8List` 实现兼容。

## Migration guide

## 迁移指南

Classes that subclass `ImageProvider` must implement the `loadBuffer` method for
loading assets. Classes that delegate to or call the methods of an
`ImageProvider` directly must use `loadBuffer` instead of `load`.

子类化 `ImageProvider` 的类必须实现 `loadBuffer` 方法以加载 asset。
直接委托或调用 `ImageProvider` 方法的类必须使用 `loadBuffer` 而非 `load`。

Code before migration:

迁移前的代码：

```dart
class MyImageProvider extends ImageProvider<MyImageProvider> {
  @override
  ImageStreamCompleter load(MyImageProvider key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
        codec: _loadData(key, decode),
    );
  }

  Future<ui.Codec> _loadData(MyImageProvider key, DecoderCallback decode) async {
    final Uint8List bytes = await bytesFromSomeApi();
    return decode(bytes);
  }
}

class MyDelegatingProvider extends ImageProvider<MyDelegatingProvider> {
  MyDelegatingProvider(this.provider);

  final ImageProvider provider;

  @override
  ImageStreamCompleter load(MyDelegatingProvider key, DecoderCallback decode) {
    return provider.load(key, decode);
  }
}
```

Code after migration:

迁移后的代码：

```dart
class MyImageProvider extends ImageProvider<MyImageProvider> {
  @override
  ImageStreamCompleter loadBuffer(MyImageProvider key, DecoderBufferCallback decode) {
    return MultiFrameImageStreamCompleter(
        codec: _loadData(key, decode),
    );
  }

  Future<ui.Codec> _loadData(MyImageProvider key, DecoderBufferCallback decode) async {
    final Uint8List bytes = await bytesFromSomeApi();
    final ui.ImmutableBuffer buffer = await ui.ImmutableBuffer.fromUint8List(bytes);
    return decode(buffer);
  }
}

class MyDelegatingProvider extends ImageProvider<MyDelegatingProvider> {
  MyDelegatingProvider(this.provider);

  final ImageProvider provider;

  @override
  ImageStreamCompleter loadBuffer(MyDelegatingProvider key, DecoderCallback decode) {
    return provider.loadBuffer(key, decode);
  }
}
```

In both cases you might choose to keep the
previous implementation of `ImageProvider.load`
to give users of your code time to migrate as well.

在这两种情况下，你可以选择保留
`ImageProvider.load` 的先前实现，
以便你的代码用户也有时间迁移。

## Timeline

## 时间线

Landed in version: 3.1.0-0.0.pre.976<br>
In stable release: 3.3.0

合入版本：3.1.0-0.0.pre.976<br>
稳定版发布：3.3.0

## References

## 参考资料

API documentation:

API 文档：

* [`ImmutableBuffer`]({{site.api}}/flutter/dart-ui/ImmutableBuffer-class.html)
* [`ImageProvider`]({{site.api}}/flutter/painting/ImageProvider-class.html)

Relevant PR:

相关 PR：

* [Use immutable buffer for loading asset images]({{site.repo.flutter}}/pull/103496)

  [使用不可变 buffer 加载 asset 图像]({{site.repo.flutter}}/pull/103496)
