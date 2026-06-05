---
# title: Replace AnimationSheetBuilder.display with collate
title: 将 AnimationSheetBuilder.display 替换为 collat​​e
# description: >
#   AnimationSheetBuilder.display and sheetSize
#   are deprecated in favor of collate.
description: >-
  AnimationSheetBuilder.display 和sheetSize 已弃用，以支持整理。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `AnimationSheetBuilder.display` and `sheetSize`
methods are deprecated, and should be replaced with
`AnimationSheetBuilder.collate`.

`AnimationSheetBuilder.display` 和 `sheetSize` 方法已弃用，应替换为 `AnimationSheetBuilder.collate`。


## Context

## 背景


[`AnimationSheetBuilder`][] is a testing utility
class that records frames of an animating widget,
and later composes the frames into a single
animation sheet for [golden testing][]. The old way
of composing involves `display` to list the images
into a table-like widget, adjusting the testing
surface with `sheetSize`, and capturing the table
widget for comparison. A new way, `collate`, has
been added that directly puts the frames together
into an image for comparison, which requires less
boilerplate code and outputs a smaller image without
compromise in quality. APIs for the old way are thus
deprecated.

The reason why `collate` outputs a smaller image,
is because the old way captures on a testing surface
with pixel ratio 3.0, which means it uses a 3x3 pixel
block of the exactly same color to represent 1 actual
pixel, making the image 9 times as large as necessary
(before PNG compression).

`collate` 输出较小图像的原因是因为旧方法在像素比 3.0 的测试表面上捕获，这意味着它使用完全相同颜色的 3x3 像素块来表示 1 个实际像素，使图像达到所需大小的 9 倍（PNG 压缩之前）。


## Description of change

## 变更说明


The following changes have been made to the
[`AnimationSheetBuilder`][] class:

进行了以下更改[`AnimationSheetBuilder`][]班级：


* 'display' is deprecated and shouldn't be used

  “display”已被弃用，不应使用

* 'sheetSize' is deprecated and shouldn't be used

  “sheetSize”已弃用，不应使用


## Migration guide

## 迁移指南


To migrate to the new API, change the process of setting
surface size and displaying the widget into
[`AnimationSheetBuilder.collate`][].

要迁移到新 API，请将设置表面尺寸和显示 widget 的过程更改为[`AnimationSheetBuilder.collate`][].


### Derive cells per row

### 导出每行的单元格


The `collate` requires an explicit `cellsPerRow`
argument, which is the number of frames per
row in the output image. It can be manually counted,
or calculated as follows:

`collate` 需要显式 `cellsPerRow` 参数，它是输出图像中每行的帧数。可以手动统计，也可以按如下方式计算：


* Find the width of frame, specified when constructing

  查找框架的宽度，在构造时指定

  `AnimationSheetBuilder`. For example, in the following
  snippet it's 80:

`AnimationSheetBuilder`。例如，在下面的代码片段中，它是 80：


```dart
final AnimationSheetBuilder animationSheet = AnimationSheetBuilder(frameSize: const Size(80, 30));
```

* Find the width of surface size, specified when

  求表面尺寸的宽度，指定时

  setting the surface size; the default is 800.
  For example, in the following snippet it's 600:

设置表面尺寸；默认值为 800。例如，在以下代码片段中为 600：


```dart
tester.binding.setSurfaceSize(animationSheet.sheetSize(600));
```

* The frames per row should be the result of the two

  每行的帧数应该是两者的结果

  numbers divided, rounded down. For example,
  600 / 80 = 7 (rounded down), therefore

数字除以，向下舍入。例如，600 / 80 = 7（向下舍入），因此


```dart
animationSheet.collate(7)
```

### Migrate code

### 迁移代码


Code before migration:

迁移前的代码：


```dart
  testWidgets('Indeterminate CircularProgressIndicator', (WidgetTester tester) async {
    final AnimationSheetBuilder animationSheet = AnimationSheetBuilder(frameSize: const Size(40, 40));

    await tester.pumpFrames(animationSheet.record(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: CircularProgressIndicator(),
        ),
      ),
    ), const Duration(seconds: 2));

    // The code starting here needs migration.

    tester.binding.setSurfaceSize(animationSheet.sheetSize());

    final Widget display = await animationSheet.display();
    await tester.pumpWidget(display);

    await expectLater(
      find.byWidget(display),
      matchesGoldenFile('material.circular_progress_indicator.indeterminate.png'),
    );
  }, skip: isBrowser); // https://github.com/flutter/flutter/issues/42767
```

Code after migration (`cellsPerRow` is 20, derived from 800 / 40):

迁移后的代码（`cellsPerRow` 为 20，源自 800 / 40）：


```dart
  testWidgets('Indeterminate CircularProgressIndicator', (WidgetTester tester) async {
    final AnimationSheetBuilder animationSheet = AnimationSheetBuilder(frameSize: const Size(40, 40));

    await tester.pumpFrames(animationSheet.record(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: Padding(
          padding: EdgeInsets.all(4),
          child: CircularProgressIndicator(),
        ),
      ),
    ), const Duration(seconds: 2));

    await expectLater(
      animationSheet.collate(20),
      matchesGoldenFile('material.circular_progress_indicator.indeterminate.png'),
    );
  }, skip: isBrowser); // https://github.com/flutter/flutter/issues/42767
```

It's expected that related golden test reference images
are invalidated, which should all be updated. The new
images should be identical to the old ones except
1/3 in scale.

预计相关黄金测试参考图片已失效，应全部更新。新图像应与旧图像相同，只是比例为 1/3。


## Timeline

## 时间线


Landed in version: v2.3.0-13.0.pre<br>
登陆版本：v2.3.0-13.0.pre
In stable release: 2.5
稳定版本：2.5

## References

## 参考资料


API documentation:

API 文档：


* [`AnimationSheetBuilder`][]
* [`AnimationSheetBuilder.collate`][]

Relevant PR:

相关 PR：


* [Test WidgetTester handling test pointers][]

  [测试Widget测试器处理测试指针][Test WidgetTester handling test pointers]


[`AnimationSheetBuilder`]: {{site.api}}/flutter/flutter_test/AnimationSheetBuilder-class.html
[`AnimationSheetBuilder.collate`]: {{site.api}}/flutter/flutter_test/AnimationSheetBuilder/collate.html
[golden testing]: {{site.api}}/flutter/flutter_test/matchesGoldenFile.html
[Test WidgetTester handling test pointers]: {{site.repo.flutter}}/pull/83337
