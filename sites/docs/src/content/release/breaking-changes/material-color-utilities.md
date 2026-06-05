---
# title: Material Color Utilities update in Flutter
title: Flutter 中 Material Color Utilities 更新
# description: >-
#   The latest Material Color Utilities have been
#   applied to the Flutter Material library.
description: >-
  最新的 Material Color Utilities 已
  应用于 Flutter Material 库。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

This release updates `package:material_color_utilities` from
`v0.11.1` to `0.13.0`.
This updated package includes algorithm changes that
align with the [Material 3 tokens update][].

本版本将 `package:material_color_utilities` 从
`v0.11.1` 更新到 `0.13.0`。
更新后的 package 包含与 [Material 3 token 更新][Material 3 tokens update] 一致的算法变更。

The algorithm changes affect the same properties:

算法变更影响相同的属性：

* `onPrimaryContainer`
* `onSecondaryContainer`
* `onTertiaryContainer`
* `onErrorContainer`

The changes will be reflected when generating a scheme using

使用以下方式生成方案时会反映这些变更：

* `ColorScheme.fromSeed`
* `ColorScheme.fromImageProvider`
* `ThemeData(colorScheme:..)`

[Material 3 tokens update]: /release/breaking-changes/material-design-3-token-update

## Migration guide

## 迁移指南

In general, we believe the colors generated will be more legible and visually
appealing, but if you want to maintain the previous colors when upgrading,
you will have to manually set those properties to their desired color after
generating.

总体而言，我们认为生成的颜色将更易读且更具视觉吸引力，
但如果你希望在升级时保持先前的颜色，
需要在生成后手动将这些属性设置为所需颜色。

## Timeline

## 时间线

Landed in version: 3.39.0-1.0.pre-250<br>
In stable release: 3.41

合入版本：3.39.0-1.0.pre-250<br>
稳定版发布：3.41

## References

## 参考资料

* [Manually roll material_color_utilities][]

  [手动升级 material_color_utilities][Manually roll material_color_utilities]

[Manually roll material_color_utilities]: {{site.repo.flutter}}/pull/170000
