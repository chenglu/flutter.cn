---
# title: ImageCache large images
title: ImageCache 大图像
# description: >
#   Stop increasing the ImageCache maxByteSize to accommodate large images.
description: >
  停止增大 ImageCache maxByteSize 以容纳大图像。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `maxByteSize` of the `ImageCache` is no longer
automatically made larger to accommodate large images.

`ImageCache` 的 `maxByteSize` 不再自动增大以容纳大图像。

## Context

## 背景

Previously, when loading images into the `ImageCache`
that had larger byte sizes than the `ImageCache`'s `maxByteSize`,
Flutter permanently increased the `maxByteSize` value
to accommodate those images.
This logic sometimes led to bloated `maxByteSize` values that
made working in memory-limited systems more difficult.

此前，当向 `ImageCache` 加载的字节大小超过
`ImageCache` 的 `maxByteSize` 的图像时，
Flutter 会永久增大 `maxByteSize` 值以容纳这些图像。
这一逻辑有时会导致 `maxByteSize` 值膨胀，
使在内存受限的系统上工作更加困难。

## Description of change

## 变更说明

The following "before" and "after" pseudocode demonstrates
the changes made to the `ImageCache` algorithm:

以下「变更前」和「变更后」伪代码展示了
对 `ImageCache` 算法所做的更改：

```dart
// Old logic pseudocode
void onLoadImage(Image image) {
  if (image.byteSize > _cache.maxByteSize) {
    _cache.maxByteSize = image.byteSize + 1000;
  }
  _cache.add(image);
  while (_cache.count > _cache.maxCount
      || _cache.byteSize > _cache.maxByteSize) {
    _cache.discardOldestImage();
  }
}
```

```dart
// New logic pseudocode
void onLoadImage(Image image) {
  if (image.byteSize < _cache.maxByteSize) {
    _cache.add(image);
    while (_cache.count > _cache.maxCount
        || _cache.byteSize > cache.maxByteSize) {
      cache.discardOldestImage();
    }
  }
}
```

## Migration guide

## 迁移指南

There might be situations where the `ImageCache`
is thrashing with the new logic where it wasn't previously,
specifically if you load images that are larger than your
`cache.maxByteSize` value.
This can be remedied by one of the following approaches:

在新逻辑下，`ImageCache` 可能出现先前不会发生的抖动，
特别是当你加载大于 `cache.maxByteSize` 值的图像时。
可通过以下方式之一解决：

1. Increase the `ImageCache.maxByteSize` value
   to accommodate larger images.

   增大 `ImageCache.maxByteSize` 值以容纳更大的图像。

1. Adjust your image loading logic to guarantee that
   the images fit nicely into the `ImageCache.maxByteSize`
   value of your choosing.

   调整图像加载逻辑，确保图像能很好地适配
   你选择的 `ImageCache.maxByteSize` 值。

1. Subclass `ImageCache`, implement your desired logic,
   and create a new binding that serves up your subclass
   of `ImageCache` (see the [`image_cache.dart`][] source).

   子类化 `ImageCache`，实现你所需的逻辑，
   并创建提供 `ImageCache` 子类的新 binding
   （参见 [`image_cache.dart`][] 源码）。

## Timeline

## 时间线

The old algorithm is no longer supported.

旧算法不再受支持。

Landed in version: 1.16.3<br>
In stable release: 1.17

合入版本：1.16.3<br>
稳定版发布：1.17

## References

## 参考资料

API documentation:

API 文档：

* [`ImageCache`][]

Relevant issue:

相关 issue：

* [Issue 45643][]

Relevant PR:

相关 PR：

* [Stopped increasing the cache size to accommodate large images][]

  [停止增大缓存大小以容纳大图像][Stopped increasing the cache size to accommodate large images]

Other:

其他：

* [`ImageCache` source][]


[Stopped increasing the cache size to accommodate large images]: {{site.repo.flutter}}/pull/47387
[`ImageCache`]: {{site.api}}/flutter/painting/ImageCache-class.html
[`image_cache.dart`]: {{site.repo.flutter}}/blob/72a3d914ee5db0033332711224e728b8a5281d89/packages/flutter/lib/src/painting/image_cache.dart#L34
[`ImageCache` source]: {{site.repo.flutter}}/blob/main/packages/flutter/lib/src/painting/image_cache.dart
[Issue 45643]: {{site.repo.flutter}}/issues/45643
