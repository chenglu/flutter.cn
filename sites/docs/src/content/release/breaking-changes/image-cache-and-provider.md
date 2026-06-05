---
# title: ImageCache and ImageProvider changes
title: ImageCache 和 ImageProvider 变更
# description: >
#   ImageCache requires implementers to override containsKey, and
#   ImageProvider has marked resolve as @nonVirtual.
description: >
  ImageCache 要求实现者重写 containsKey，
  ImageProvider 已将 resolve 标记为 @nonVirtual。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`ImageCache` now has a method called `containsKey`.
`ImageProvider` subclasses should not override `resolve`,
but instead should implement new methods on `ImageProvider`.
These changes were submitted as a single commit to the framework.

`ImageCache` 现在有一个名为 `containsKey` 的方法。
`ImageProvider` 子类不应重写 `resolve`，
而应实现 `ImageProvider` 上的新方法。
这些变更作为单个提交提交到框架。

## Description of change

## 变更说明

The sections below describe the changes to `containsKey`
and `ImageProvider`.

以下部分描述了 `containsKey` 和 `ImageProvider` 的变更。

### containsKey change

### containsKey 变更

Clients of the `ImageCache`, such as a custom `ImageProvider`,
may want to know if the cache is already tracking an image.
Adding the `containsKey` method allows callers to discover
this without calling a method like `putIfAbsent`,
which can trigger an undesired call to `ImageProvider.load`.

`ImageCache` 的客户端（如自定义 `ImageProvider`）
可能想知道缓存是否已在跟踪某张图像。
添加 `containsKey` 方法让调用者可以发现这一点，
而无需调用 `putIfAbsent` 等方法，
后者可能触发对 `ImageProvider.load` 的不必要调用。

The default implementation checks both pending and cached
image buckets.

默认实现会检查待处理和已缓存的图像桶。

```dart
  bool containsKey(Object key) {
    return _pendingImages[key] != null || _cache[key] != null;
  }
```

### ImageProvider changes

### ImageProvider 变更

The `ImageProvider.resolve` method does some complicated
error handling work that should not normally be overridden.
It also previously did work to load the image into the
image cache, by way of `ImageProvider.obtainKey` and
`ImageProvider.load`. Subclasses had no opportunity to
override this behavior without overriding `resolve`,
and the ability to compose `ImageProvider`s is limited
if multiple `ImageProvider`s expect to override `resolve`.

`ImageProvider.resolve` 方法执行一些复杂的错误处理工作，
通常不应被重写。它此前还通过 `ImageProvider.obtainKey` 和
`ImageProvider.load` 将图像加载到图像缓存中。
子类没有机会在不重写 `resolve` 的情况下覆盖此行为，
如果多个 `ImageProvider` 期望重写 `resolve`，
组合 `ImageProvider` 的能力也会受限。

To solve this issue, `resolve` is now marked as non-virtual,
and two new protected methods have been added: `createStream()`
and `resolveStreamForKey()`.
These methods allow subclasses to control most of the behavior
of `resolve`, without having to duplicate all the error handling work.
It also allows subclasses that compose `ImageProvider`s
to be more confident that there is only one public entrypoint
to the various chained providers.

为解决此问题，`resolve` 现在标记为非虚方法，
并添加了两个新的受保护方法：`createStream()`
和 `resolveStreamForKey()`。
这些方法让子类可以控制 `resolve` 的大部分行为，
而无需复制所有错误处理工作。
它还让组合 `ImageProvider` 的子类更有信心，
各种链式 provider 只有一个公共入口点。

## Migration guide

## 迁移指南

### ImageCache change

### ImageCache 变更

Before migration, the code would not have an override of `containsKey`.

迁移前，代码不会有 `containsKey` 的重写。

Code after migration:

迁移后的代码：

```dart
class MyImageCache implements ImageCache {
  @override
  bool containsKey(Object key) {
    // Check if your custom cache is tracking this key.
  }

  ...
}
```

### ImageProvider change

### ImageProvider 变更

Code before the migration:

迁移前的代码：

```dart
class MyImageProvider extends ImageProvider<Object> {
  @override
  ImageStream resolve(ImageConfiguration configuration) {
    // create stream
    // set up error handling
    // interact with ImageCache
    // call obtainKey/load, etc.
  }
  ...
}
```

Code after the migration:

迁移后的代码：

```dart
class MyImageProvider extends ImageProvider<Object> {
  @override
  ImageStream createStream(ImageConfiguration configuration) {
    // Return stream, or use super.createStream(),
    // which returns a new ImageStream.
  }

  @override
  void resolveStreamForKey(
    ImageConfiguration configuration,
    ImageStream stream,
    Object key,
    ImageErrorListener handleError,
  ) {
    // Interact with the cache, use the key, potentially call `load`,
    // and report any errors back through `handleError`.
  }
  ...
}

```

## Timeline

## 时间线

Landed in version: 1.16.3<br>
In stable release: 1.17

合入版本：1.16.3<br>
稳定版发布：1.17

## References

## 参考资料

API documentation:

API 文档：

* [`ImageCache`][]
* [`ImageProvider`][]
* [`ScrollAwareImageProvider`][]

Relevant issues:

相关 issue：

* [Issue #32143][]
* [Issue #44510][]
* [Issue #48305][]
* [Issue #48775][]

Relevant PRs:

相关 PR：

* [Defer image decoding when scrolling fast #49389][]

  [快速滚动时延迟图像解码 #49389][Defer image decoding when scrolling fast #49389]

[`ImageCache`]: {{site.api}}/flutter/painting/ImageCache-class.html
[`ImageProvider`]: {{site.api}}/flutter/painting/ImageProvider-class.html
[`ScrollAwareImageProvider`]: {{site.api}}/flutter/widgets/ScrollAwareImageProvider-class.html
[Issue #32143]: {{site.repo.flutter}}/issues/32143
[Issue #44510]: {{site.repo.flutter}}/issues/44510
[Issue #48305]: {{site.repo.flutter}}/issues/48305
[Issue #48775]: {{site.repo.flutter}}/issues/48775
[Defer image decoding when scrolling fast #49389]: {{site.repo.flutter}}/pull/49389
