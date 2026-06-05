---
# title: Deprecate `OverlayPortal.targetsRootOverlay` and enforce `LookupBoundary` in `Overlay.of`
title: 弃用 `OverlayPortal.targetsRootOverlay` 并在 `Overlay.of` 中强制使用 `LookupBoundary`
# description: >-
#   Learn about changes to the OverlayPortal and Overlay in Flutter.
description: >-
  了解 Flutter 中 OverlayPortal 和 Overlay 的变更。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `OverlayPortal.targetsRootOverlay` property was deprecated and
replaced with `overlayLocation`.

`OverlayPortal.targetsRootOverlay` 属性已被弃用，
由 `overlayLocation` 取代。

The `Overlay.of` and `Overlay.maybeOf` now respect `LookupBoundary`.

`Overlay.of` 和 `Overlay.maybeOf` 现在会遵守 `LookupBoundary`。

## Context

## 背景

A `overlayLocation` parameter was added to
the `OverlayPortal` default constructor to
control where the overlay child renders.
As a result, the `OverlayPortal.targetsRootOverlay` constructor is
no longer useful.

`OverlayPortal` 默认构造函数新增了 `overlayLocation` 参数，
用于控制 overlay 子组件的渲染位置。
因此，`OverlayPortal.targetsRootOverlay` 构造函数已不再需要。

To prevent an `OverlayEntry` from being inserted across multi-view boundaries
by mistake, `Overlay.of` now respects `LookupBoundary`.

为防止 `OverlayEntry` 被误插入到跨多视图边界的位置，
`Overlay.of` 现在会遵守 `LookupBoundary`。

## Description of change

## 变更说明

The `OverlayPortal.targetsRootOverlay` constructor is deprecated.

`OverlayPortal.targetsRootOverlay` 构造函数已被弃用。

The `Overlay.of` and `Overlay.maybeOf` will not lookup past `LookupBoundary`.

`Overlay.of` 和 `Overlay.maybeOf` 不会越过 `LookupBoundary` 进行查找。

## Migration guide

## 迁移指南

If you are using `OverlayPortal.targetsRootOverlay`,
use `OverlayPortal` with `overlayLocation` instead.

如果你正在使用 `OverlayPortal.targetsRootOverlay`，
请改用带 `overlayLocation` 的 `OverlayPortal`。

### Case 1: trivial case

### 情况 1：简单场景

Code before migration:

迁移前的代码：

```dart
Widget build(BuildContext context) {
  return OverlayPortal.targetsRootOverlay(
    controller: myController,
    overlayChildBuilder: _myBuilder,
    child: myChild,
  );
}
```

Code after migration:

迁移后的代码：

```dart highlightLines=3
Widget build(BuildContext context) {
  return OverlayPortal(
    overlayLocation: OverlayChildLocation.rootOverlay,
    controller: myController,
    overlayChildBuilder: _myBuilder,
    child: myChild,
  );
}
```

If you expect `Overlay.of` and `Overlay.maybeOf` to lookup past `LookupBoundary`,
use `findAncestorStateOfType` instead.

如果你希望 `Overlay.of` 和 `Overlay.maybeOf` 能越过 `LookupBoundary` 查找，
请改用 `findAncestorStateOfType`。

Code before migration:

迁移前的代码：

```dart
Widget build(BuildContext context) {
  Overlay.of(context);
  // ...
}
```

Code after migration:

迁移后的代码：

```dart
Widget build(BuildContext context) {
  context.findAncestorStateOfType<OverlayState>();
  // ...
}
```

## Timeline

## 时间线

Landed in version: 3.38.0-0.1.pre<br>
In stable release: 3.38

合入版本：3.38.0-0.1.pre<br>
稳定版发布：3.38

## References

## 参考资料

API documentation:

API 文档：

* [`OverlayPortal`][]
* [`Overlay.of`][]
* [`Overlay.maybeOf`][]
* [`LookupBoundary`][]

Relevant issue:

相关 issue：

* [Issue 168785][]

Relevant PR:

相关 PR：

* [PR 174239][]

[`OverlayPortal`]: {{site.api}}/flutter/widgets/OverlayPortal-class.html
[`Overlay.of`]: {{site.api}}/flutter/widgets/Overlay/of.html
[`Overlay.maybeOf`]: {{site.api}}/flutter/widgets/Overlay/maybeOf.html
[`LookupBoundary`]: {{site.api}}/flutter/widgets/LookupBoundary-class.html
[Issue 168785]: {{site.repo.flutter}}/issues/168785
[PR 174239]: {{site.repo.flutter}}/pull/174239
