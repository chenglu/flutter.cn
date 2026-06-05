---
# title: Web-specific golden comparisons are no longer supported
title: 不再支持 Web 特定的黄金比较
# description: >-
#   The `WebGoldenComparator` class and `webGoldenComparator` top-level instance
#   are deprecated, pending removal, and the web rendering backends (including
#   both CanvasKit and skWasm) now use `GoldenFileComparator` and
#   `goldenFileComparator` directly.
description: >-
  `WebGoldenComparator` 类和 `webGoldenComparator` 顶级实例已弃用，待删除，并且 Web 渲染后端（包括 CanvasKit 和 skwasm）现在直接使用 `GoldenFileComparator` 和 `goldenFileComparator` 。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The `flutter_test` package and `flutter` tool will no longer use the
[`webGoldenComparator`][] top-level variable, and instead use the original
[`goldenFileComparator`][] top-level variable (like the non-web platforms).

`flutter_test` 包和 `flutter` 工具将不再使用[`webGoldenComparator`][]顶级变量，而是使用原始变量[`goldenFileComparator`][]顶级变量（如非网络平台）。


For _users_ of `flutter_test`, these changes will be made automatically.

对于 `flutter_test` 的_用户_，这些更改将自动进行。


## Background

## 背景


Originally, [`WebGoldenComparator`][class-WebGoldenComparator] was added for
the HTML-backend of Flutter web, as it was not possible to create an encoded
PNG (byte buffer), and a new API was needed. As [the HTML backend is being
deprecated and removed][Issue 145954], this separate API is no longer necessary.

最初，[`WebGoldenComparator`][class-WebGoldenComparator] 是为 Flutter web 的 HTML 后端添加的，因为无法创建编码的 PNG（字节缓冲区），并且需要一个新的 API。由于 HTML 后端已被弃用并删除，因此不再需要这个单独的 API。


## Migration guide

## 迁移指南


For most users, no changes are required (other than migrating off the HTML
backend, which is not covered here), the `flutter` tool will automatically
configure [`goldenFileComparator`][] and use it (when using a non-HTML web
backend).

对于大多数用户来说，不需要进行任何更改（除了迁移 HTML 后端，此处未介绍），`flutter` 工具将自动配置[`goldenFileComparator`][]并使用它（当使用非 HTML Web 后端时）。


For users that implement a custom [`WebGoldenComparator`][], you will
migrate the implementation to [`GoldenFileComparator`][]. Fortunately the
Canvas Kit and SkWasm backends already required similar methods (`compareButes`
and `updateBytes`).

对于实施自定义的用户[`WebGoldenComparator`][]，你将把实现迁移到[`GoldenFileComparator`][]。幸运的是，Canvas Kit 和 Skwasm 后端已经需要类似的方法（`compareButes` 和 `updateBytes`）。


For example:

例如：


```dart
// Before
class MyWebGoldenComparator extends WebGoldenComparator {
  @override
  Future<bool> compare(double width, double height, Uri golden) {
    // will be removed in the migration
  }

  @override
  Future<bool> update(double width, double height, Uri golden) {
    // will be removed in the migration
  }

  @override
  Future<bool> compareBytes(Uint8List bytes, Uri golden) {
    // will be renamed "compare"
  }

  @override
  Future<bool> updateBytes(Uint8List bytes, Uri golden) {
    // will be renamed "update" and the parameter orders swapped
  }
}

// After
class MyGenericGoldenComparator extends GoldenFileComparator {
  @override
  Future<bool> compare(Uint8List bytes, Uri golden) {
    // used to be "compareBytes"
  }

  @override
  Future<bool> update(Uri golden, Uint8List bytes) {
    // used to be "updateBytes"
  }
}
```

## Timeline

## 时间线


Landed in version: 3.29.0-0.0.pre<br>
登陆版本：3.29.0-0.0.pre
In stable release: 3.29
稳定版本：3.29

## References

## 参考资料


Relevant Issues:

相关 issue：


- [Issue 145954][], where the HTML renderer was deprecated.

  [Issue 145954][]，其中 HTML 呈现器已被弃用。

- [Issue 160261][], where it was proposed to consolidate `GoldenFileComparator` and `WebGoldenComparator`.

  [Issue 160261][]，其中建议合并 `GoldenFileComparator` 和 `WebGoldenComparator`。


Relevant PRs:

相关 PR：


- [PR 161196][], where `WebGoldenComparator` was deprecated and the `flutter` CLI started using `goldenFileComparator`.

  [PR 161196][]，其中 `WebGoldenComparator` 已弃用，`flutter` CLI 开始使用 `goldenFileComparator`。


[Issue 145954]: {{site.github}}/flutter/flutter/issues/145954
[Issue 160261]: {{site.github}}/flutter/flutter/issues/160261
[PR 161196]: https://github.com/flutter/flutter/pull/161196
[class-WebGoldenComparator]: {{site.api}}/flutter/flutter_test/WebGoldenComparator-class.html
[`webGoldenComparator`]: {{site.api}}/flutter/flutter_test/webGoldenComparator.html
[`goldenFileComparator`]: {{site.api}}/flutter/flutter_test/goldenFileComparator.html
