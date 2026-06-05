---
# title: "Deprecate ThemeData.indicatorColor in favor of TabBarThemeData.indicatorColor"
title: "弃用 ThemeData.indicatorColor，改用 TabBarThemeData.indicatorColor"
# description: "The ThemeData.indicatorColor parameter has been replaced by TabBarThemeData.indicatorColor."
description: "ThemeData.indicatorColor 参数已被 TabBarThemeData.indicatorColor 取代。"
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The [`ThemeData.indicatorColor`][] parameter was deprecated in favor of
the [`TabBarThemeData.indicatorColor`][] parameter.

[`ThemeData.indicatorColor`][] 参数已被弃用，
请改用 [`TabBarThemeData.indicatorColor`][] 参数。

## Context

## 背景

The defaults for the [`TabBar`][] widget can be overridden with a
component-specific theme like [`TabBarThemeData`][].
Previously, the `ThemeData.indicatorColor` parameter was used to
override the default tab bar indicator color in Material Design 2,
which was made redundant by [`TabBarThemeData`][].

[`TabBar`][] widget 的默认值
可通过 [`TabBarThemeData`][] 等组件专属主题进行覆盖。
此前，在 Material Design 2 中，
`ThemeData.indicatorColor` 参数用于覆盖默认 TabBar 指示器颜色，
而 [`TabBarThemeData`][] 已使该参数变得多余。

## Description of change

## 变更说明

The [`ThemeData.indicatorColor`][] is deprecated in
favor of a component-specific theme.
Use [`TabBarThemeData`][] to override the default indicator color.

[`ThemeData.indicatorColor`][] 已被弃用，
请改用组件专属主题。
使用 [`TabBarThemeData`][] 覆盖默认指示器颜色。

## Migration guide

## 迁移指南

Replace [`ThemeData.indicatorColor`][] with
[`TabBarThemeData.indicatorColor`][] to override the default tab bar
indicator color when [`ThemeData.useMaterial3`][] flag is set to `false`.

当 [`ThemeData.useMaterial3`][] 标志设为 `false` 时，
将 [`ThemeData.indicatorColor`][] 替换为
[`TabBarThemeData.indicatorColor`][]，以覆盖默认 TabBar 指示器颜色。

Code before migration:

迁移前的代码：

```dart
theme: ThemeData(
  indicatorColor: Colors.red,
  useMaterial3: false,
),
```

Code after migration:

迁移后的代码：

```dart
theme: ThemeData(
  tabBarTheme: const TabBarThemeData(indicatorColor: Colors.red),
  useMaterial3: false,
),
```

## Timeline

## 时间线

Landed in version: 3.30.0-0.0.pre<br>
In stable release: 3.32

合入版本：3.30.0-0.0.pre<br>
稳定版发布：3.32

## References

## 参考资料

API documentation:

API 文档：

- [`ThemeData.indicatorColor`][]
- [`ThemeData.useMaterial3`][]
- [`TabBarThemeData.indicatorColor`][]
- [`TabBarThemeData`][]
- [`TabBar`][]

Relevant issues:

相关 issue：

- [Issue #91772][]

Relevant PRs:

相关 PR：

- [Deprecate `ThemeData.indicatorColor` in favor of `TabBarThemeData.indicatorColor`][]

  [弃用 `ThemeData.indicatorColor`，改用 `TabBarThemeData.indicatorColor`][Deprecate `ThemeData.indicatorColor` in favor of `TabBarThemeData.indicatorColor`]

[`ThemeData.indicatorColor`]: {{site.api}}/flutter/material/ThemeData/indicatorColor.html
[`ThemeData.useMaterial3`]: {{site.api}}/flutter/material/ThemeData/useMaterial3.html
[`TabBarThemeData.indicatorColor`]: {{site.api}}/flutter/material/TabBarThemeData/indicatorColor.html
[`TabBarThemeData`]: {{site.api}}/flutter/material/TabBarThemeData-class.html
[`TabBar`]: {{site.api}}/flutter/material/TabBar-class.html
[Issue #91772]: {{site.repo.flutter}}/issues/91772
[Deprecate `ThemeData.indicatorColor` in favor of `TabBarThemeData.indicatorColor`]: {{site.repo.flutter}}/pull/160024
