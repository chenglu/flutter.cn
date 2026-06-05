---
# title: FloatingActionButton and ThemeData's accent properties
title: FloatingActionButton 和 ThemeData 的 accent 属性
# description: >
#   Remove FloatingActionButton's undocumented use of
#   the ThemeData accentTextTheme property, and
#   its unnecessary use of accentIconTheme.
description: >
  移除 FloatingActionButton 对 ThemeData accentTextTheme 属性的未文档化使用，
  及其对 accentIconTheme 的不必要使用。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Removed Flutter's `FloatingActionButton` (FAB) dependency on
`ThemeData` accent properties.

已移除 Flutter `FloatingActionButton`（FAB）对
`ThemeData` accent 属性的依赖。

## Context

## 背景

This was a small part of the [Material Theme System Updates][] project.

这是 [Material 主题系统更新][Material Theme System Updates] 项目的一小部分。

Previously, the `ThemeData` [`accentIconTheme`] property was only
used by [`FloatingActionButton`][] to determine the default
color of the text or icons that appeared within the button.

此前，`ThemeData` [`accentIconTheme`] 属性仅被
[`FloatingActionButton`][] 用于确定按钮内
文本或图标的默认颜色。

`FloatingActionButton` also used the
`ThemeData accentTextTheme` property,
however this dependency was undocumented and unnecessary.

`FloatingActionButton` 还使用了
`ThemeData accentTextTheme` 属性，
然而此依赖未文档化且不必要。

Both of these dependencies were confusing.
For example if one configured the `Theme`'s `accentIconTheme`
to change the appearance of all floating action buttons,
it was difficult to know what other components would be affected,
or might be affected in the future.

这两个依赖都令人困惑。
例如，如果配置 `Theme` 的 `accentIconTheme`
以更改所有浮动操作按钮的外观，
很难知道还有哪些组件会受影响，
或将来可能受影响。

The [Material Design spec][] no longer includes an "accent" color.
The `ColorScheme`'s [secondary color][] is now used instead.

[Material Design 规范][Material Design spec] 不再包含 "accent" 颜色。
现在改用 `ColorScheme` 的[次要颜色][secondary color]。

Previously, applications could configure the color of text and icons
within `FloatingActionButtons` with the widget's `foregroundColor`
property, or with the `FloatingActionButtonTheme`'s `foregroundColor`.
If neither `foregroundColor` property was specified, the foreground
color defaulted to the `accentIconTheme`'s color.

此前，应用可通过 widget 的 `foregroundColor` 属性
或 `FloatingActionButtonTheme` 的 `foregroundColor`
配置 `FloatingActionButton` 内文本和图标的颜色。
如果都未指定 `foregroundColor` 属性，前景色
默认为 `accentIconTheme` 的颜色。

With this change, the default behavior uses the color scheme's
`onSecondary` color instead.

随着此变更，默认行为改用 color scheme 的
`onSecondary` 颜色。

## Description of change

## 变更说明

Previously, the `accentIconTheme` provided a default for the
`FloatingActionButton`'s `foregroundColor` property:

此前，`accentIconTheme` 为
`FloatingActionButton` 的 `foregroundColor` 属性提供默认值：

```dart
    final Color foregroundColor = this.foregroundColor
      ?? floatingActionButtonTheme.foregroundColor
      ?? theme.accentIconTheme.color // To be removed.
      ?? theme.colorScheme.onSecondary;
```

Apps that configure their theme's `accentIconTheme`
to effectively configure the `foregroundColor` of all
floating action buttons, can get the same effect by
configuring the `foregroundColor` of their theme's
`floatingActionButtonTheme`.

将主题的 `accentIconTheme` 配置为
有效配置所有浮动操作按钮 `foregroundColor` 的应用，
可通过配置主题 `floatingActionButtonTheme` 的 `foregroundColor`
获得相同效果。

The `FloatingActionButton`'s `foregroundColor` is now used
to configure the `textStyle` of the `RawMaterialButton`
created by `FloatingActionButton`. Previously,
this text style was based on the button style of
`ThemeData.accentTextTheme`:

`FloatingActionButton` 的 `foregroundColor` 现在用于
配置 `FloatingActionButton` 创建的 `RawMaterialButton` 的 `textStyle`。
此前，此文本样式基于
`ThemeData.accentTextTheme` 的按钮样式：

```dart
// theme.accentTextTheme becomes theme.textTheme
final TextStyle textStyle = theme.accentTextTheme.button.copyWith(
  color: foregroundColor,
  letterSpacing: 1.2,
);

```

Except in a case where an app has explicitly configured the
`accentTextTheme` to take advantage of this undocumented dependency,
this use of `accentTextTheme` is unnecessary.
This change replaces this use of `accentTextTheme` with `textTheme`.

除非应用显式配置了 `accentTextTheme` 以利用此未文档化的依赖，
否则此 `accentTextTheme` 用法是不必要的。
此变更将此 `accentTextTheme` 用法替换为 `textTheme`。

## Migration guide

## 迁移指南

This change occurred in two steps:

此变更分两步进行：

1. If the foreground of a `FloatingActionButton` is set
   to a non-default color, a warning is now printed.
2. The `accentIconTheme` dependency was removed.
   If you haven't already done so, migrate your apps
   per the pattern below.

1. 如果 `FloatingActionButton` 的前景设为
   非默认颜色，现在会打印警告。
2. `accentIconTheme` 依赖已移除。
   如果尚未这样做，请按以下模式迁移应用。

To configure the `FloatingActionButton`'s `foregroundColor`
for all FABs, you can configure the theme's
`floatingActionButtonTheme` instead of its `accentIconTheme`.

要为所有 FAB 配置 `FloatingActionButton` 的 `foregroundColor`，
可配置主题的 `floatingActionButtonTheme` 而非 `accentIconTheme`。

Code before migration:

迁移前的代码：

```dart
MaterialApp(
  theme: ThemeData(
    accentIconTheme: IconThemeData(color: Colors.red),
  ),
)
```

Code after migration:

迁移后的代码：

```dart
MaterialApp(
  theme: ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      foregroundColor: Colors.red,
    ),
  ),
)
```

## Timeline

## 时间线

Landed in version: 1.16.3<br>
In stable release: 1.17

合入版本：1.16.3<br>
稳定版发布：1.17

## References

## 参考资料

Design doc:

设计文档：

* [Remove FAB Accent Theme Dependency][]

  [移除 FAB Accent 主题依赖][Remove FAB Accent Theme Dependency]

API documentation:

API 文档：

* [`FloatingActionButton`][]
* [`ThemeData`][]
* [`FloatingActionButtonThemeData`][]

Relevant PRs:

相关 PR：

* [Step 1 of 2][] Warn about Flutter's
  FloatingActionButton dependency on ThemeData accent properties
* [第 1 步（共 2 步）][Step 1 of 2] 警告 Flutter FloatingActionButton 对 ThemeData accent 属性的依赖
* [Step 2 of 2][] Remove Flutter's FloatingActionButton dependency
  on ThemeData accent properties
* [第 2 步（共 2 步）][Step 2 of 2] 移除 Flutter FloatingActionButton 对 ThemeData accent 属性的依赖

Other:

其他：

* [Material Theme System Updates][]

  [Material 主题系统更新][Material Theme System Updates]


[`accentIconTheme`]: {{site.api}}/flutter/material/ThemeData/accentIconTheme.html
[`FloatingActionButton`]: {{site.api}}/flutter/material/FloatingActionButton/foregroundColor.html
[`FloatingActionButtonThemeData`]: {{site.api}}/flutter/material/FloatingActionButtonThemeData-class.html
[Material Design spec]: {{site.material}}/styles/color
[Material Theme System Updates]: /go/material-theme-system-updates
[Remove FAB Accent Theme Dependency]: /go/remove-fab-accent-theme-dependency
[secondary color]: {{site.material}}/styles/color/the-color-system/color-roles#904230ec-ae73-4f0f-8bff-4024a036ca66
[Step 1 of 2]: {{site.repo.flutter}}/pull/48435
[Step 2 of 2]: {{site.repo.flutter}}/pull/46923
[`ThemeData`]: {{site.api}}/flutter/material/ThemeData/floatingActionButtonTheme.html
