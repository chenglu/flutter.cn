---
# title: "Deprecate ThemeData.dialogBackgroundColor in favor of DialogThemeData.backgroundColor"
title: "弃用 ThemeData.dialogBackgroundColor，改用 DialogThemeData.backgroundColor"
# description: "The ThemeData.dialogBackgroundColor parameter has been replaced by DialogThemeData.backgroundColor."
description: "ThemeData.dialogBackgroundColor 参数已被 DialogThemeData.backgroundColor 取代。"
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The [`ThemeData.dialogBackgroundColor`][] parameter was deprecated in favor of
the [`DialogThemeData.backgroundColor`][] parameter.

[`ThemeData.dialogBackgroundColor`][] 参数已被弃用，
请改用 [`DialogThemeData.backgroundColor`][] 参数。

## Context

## 背景

The defaults for the [`Dialog`][] and [`AlertDialog`][] widgets can be
overridden with a component-specific theme like [`DialogThemeData`][].
Previously, the `ThemeData.dialogBackgroundColor` parameter was used to
override the default dialog background color,
which was made redundant by [`DialogThemeData`][].

[`Dialog`][] 和 [`AlertDialog`][] widget 的默认值
可通过 [`DialogThemeData`][] 等组件专属主题进行覆盖。
此前，`ThemeData.dialogBackgroundColor` 参数用于
覆盖默认对话框背景色，
而 [`DialogThemeData`][] 已使该参数变得多余。

## Description of change

## 变更说明

The [`ThemeData.dialogBackgroundColor`][] is deprecated in
favor of a component-specific theme.
Use [`DialogThemeData`][] to override the default background color.

[`ThemeData.dialogBackgroundColor`][] 已被弃用，
请改用组件专属主题。
使用 [`DialogThemeData`][] 覆盖默认背景色。

## Migration guide

## 迁移指南

Replace [`ThemeData.dialogBackgroundColor`][] with
[`DialogThemeData.backgroundColor`][] to override the
default dialog background color.

将 [`ThemeData.dialogBackgroundColor`][] 替换为
[`DialogThemeData.backgroundColor`][]，以覆盖默认对话框背景色。

Code before migration:

迁移前的代码：

```dart
theme: ThemeData(
  dialogBackgroundColor: Colors.orange,
),
```

Code after migration:

迁移后的代码：

```dart
theme: ThemeData(
  dialogTheme: const DialogThemeData(backgroundColor: Colors.orange),
),
```

## Timeline

## 时间线

Landed in version: 3.28.0-0.1.pre<br>
In stable release: 3.29

合入版本：3.28.0-0.1.pre<br>
稳定版发布：3.29

## References

## 参考资料

API documentation:

API 文档：

- [`ThemeData.dialogBackgroundColor`][]
- [`DialogThemeData.backgroundColor`][]
- [`DialogThemeData`][]
- [`Dialog`][]
- [`AlertDialog`][]

Relevant issues:

相关 issue：

- [Issue #91772][]

Relevant PRs:

相关 PR：

- [Deprecate `ThemeData.dialogBackgroundColor` in favor of `DialogTheme.backgroundColor`][]

  [弃用 `ThemeData.dialogBackgroundColor`，改用 `DialogTheme.backgroundColor`][Deprecate `ThemeData.dialogBackgroundColor` in favor of `DialogTheme.backgroundColor`]

[`ThemeData.dialogBackgroundColor`]: {{site.api}}/flutter/material/ThemeData/dialogBackgroundColor.html
[`DialogThemeData.backgroundColor`]: {{site.api}}/flutter/material/DialogThemeData/backgroundColor.html
[`DialogThemeData`]: {{site.api}}/flutter/material/DialogThemeData-class.html
[`Dialog`]: {{site.api}}/flutter/material/Dialog-class.html
[`AlertDialog`]: {{site.api}}/flutter/material/AlertDialog-class.html
[Issue #91772]: {{site.repo.flutter}}/issues/91772
[Deprecate `ThemeData.dialogBackgroundColor` in favor of `DialogTheme.backgroundColor`]: {{site.repo.flutter}}/pull/155072
