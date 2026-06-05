---
# title: Updated default text styles for menus
title: 更新了菜单的默认文本样式
# description: >-
#   The default text styles for menus are updated to
#   match the Material 3 specification.
description: >
  菜单的默认文本样式已更新以匹配 Material 3 规范。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The default text styles used for menus are updated
to match the Material 3 specification.

用于菜单的默认文本样式已更新，以匹配 Material 3 规范。


## Context

## 背景


The default text style for `MenuItemButton` (a widget used
in a `MenuBar`, and in a menu created with `MenuAnchor`),
and `DropdownMenuEntry` (in the `DropdownMenu`) is
updated to match the Material 3 specification.

“MenuItemButton”（在“MenuBar”和使用“MenuAnchor”创建的菜单中使用的 widget）和“DropdownMenuEntry”（在“DropdownMenu”中）的默认文本样式已更新，以匹配 Material 3 规范。


Likewise, the default text style for the `DropdownMenu`s `TextField` is updated
to match the Material 3 specification.

同样，“DropdownMenu”的“TextField”的默认文本样式也已更新以匹配 Material 3 规范。


## Description of change

## 变更说明


The default text style for `MenuItemButton` (a widget used
in a `MenuBar`, and in a menu created with `MenuAnchor`),
and `DropdownMenuEntry` (in the `DropdownMenu`) is updated from
`TextTheme.bodyLarge` to `TextTheme.labelLarge` for Material 3.

对于 Material 3，“MenuItemButton”（在“MenuBar”中使用的 widget，以及在使用“MenuAnchor”创建的菜单中使用的 widget）和“DropdownMenuEntry”（在“DropdownMenu”中）的默认文本样式从“TextTheme.bodyLarge”更新为“TextTheme.labelLarge”。


The default text style for the `DropdownMenu`s `TextField` is updated from
`TextTheme.labelLarge` to `TextTheme.bodyLarge` for Material 3.

对于 Material 3，“DropdownMenu”的“TextField”的默认文本样式从“TextTheme.labelLarge”更新为“TextTheme.bodyLarge”。


## Migration guide

## 迁移指南


A `MenuItemButton` for Material 3 uses
`TextTheme.labelLarge` as the default text style.
To use the previous default text style, set the `TextTheme.bodyLarge` text style
in the `MenuItemButton.style` or `MenuButtonThemeData.style` properties.

Material 3 的“MenuItemButton”使用“TextTheme.labelLarge”作为默认文本样式。要使用以前的默认文本样式，请在“MenuItemButton.style”或“MenuButtonThemeData.style”属性中设置“TextTheme.bodyLarge”文本样式。


Code before migration:

迁移前的代码：


```dart
MenuItemButton(
  child: Text(MenuEntry.about.label),
  onPressed: () => _activate(MenuEntry.about),
),
```

```dart
menuButtonTheme: MenuButtonThemeData(
  style: MenuItemButton.styleFrom(
    /// ...
  ),
),
```

Code after migration:

迁移后的代码：


```dart
MenuItemButton(
  style: MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyLarge,
  ),
  child: Text(MenuEntry.about.label),
  onPressed: () => _activate(MenuEntry.about),
),
```

```dart
menuButtonTheme: MenuButtonThemeData(
  style: MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyLarge,
  ),
),
```

A `DropdownMenu`'s `TextField` for Material 3
uses `TextTheme.bodyLarge` as the default text style.
To use the previous default text style,
set the `TextTheme.labelLarge` text style in
the `DropdownMenu.textStyle` or `DropdownMenuThemeData.textStyle` properties.

Material 3 的“DropdownMenu”的“TextField”使用“TextTheme.bodyLarge”作为默认文本样式。要使用以前的默认文本样式，请在“DropdownMenu.textStyle”或“DropdownMenuThemeData.textStyle”属性中设置“TextTheme.labelLarge”文本样式。


Code before migration:

迁移前的代码：


```dart
DropdownMenu<ColorLabel>(
  initialSelection: ColorLabel.green,
  controller: colorController,
  label: const Text('Color'),
  dropdownMenuEntries: colorEntries,
  onSelected: (ColorLabel? color) {
    setState(() {
      selectedColor = color;
    });
  },
),
```

```dart
dropdownMenuTheme: DropdownMenuThemeData(
  /// ...
),
```

Code after migration:

迁移后的代码：


```dart
DropdownMenu<ColorLabel>(
  textStyle: Theme.of(context).textTheme.labelLarge,
  initialSelection: ColorLabel.green,
  controller: colorController,
  label: const Text('Color'),
  dropdownMenuEntries: colorEntries,
  onSelected: (ColorLabel? color) {
    setState(() {
      selectedColor = color;
    });
  },
),
```

```dart
dropdownMenuTheme: DropdownMenuThemeData(
  textStyle: TextStyle(
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
  ),
),
```

A `DropdownMenu`'s `DropdownMenuEntry` for Material 3
uses `TextTheme.labelLarge` as the default text style.
To use the previous default text style, set the
`TextTheme.bodyLarge` text style in
the `DropdownMenuEntry.style` or `MenuButtonThemeData.style` properties.

Material 3 的“DropdownMenu”的“DropdownMenuEntry”使用“TextTheme.labelLarge”作为默认文本样式。要使用以前的默认文本样式，请在“DropdownMenuEntry.style”或“MenuButtonThemeData.style”属性中设置“TextTheme.bodyLarge”文本样式。


Code before migration:

迁移前的代码：


```dart
DropdownMenuEntry<ColorLabel>(
  value: color,
  label: color.label,
),
```

```dart
menuButtonTheme: MenuButtonThemeData(
  style: MenuItemButton.styleFrom(
    /// ...
  ),
),
```

Code after migration:

迁移后的代码：


```dart
DropdownMenuEntry<ColorLabel>(
  style: MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyLarge,
  ),
  value: color,
  label: color.label,
),
```

```dart
menuButtonTheme: MenuButtonThemeData(
  style: MenuItemButton.styleFrom(
    textStyle: Theme.of(context).textTheme.bodyLarge,
  ),
),
```

## Timeline

## 时间轴


Landed in version: 3.14.0-11.0.pre<br>
In stable release: 3.16

登陆版本：3.14.0-11.0.pre<br> 稳定版本：3.16


## References

## 参考


API documentation:

API 文档：


* [`MenuBar`][]


* [`MenuAnchor`][]


* [`MenuItemButton`][]


* [`MenuButtonTheme`][]


* [`DropdownMenu`][]


* [`DropdownMenuEntry`][]


* [`DropdownMenuTheme`][]


* [`TextTheme`][]


Relevant PRs:

相关 PR：


* [Update default menu text styles for Material 3][]


[`MenuBar`]: {{site.api}}/flutter/material/MenuBar-class.html
[`MenuAnchor`]: {{site.api}}/flutter/material/MenuAnchor-class.html
[`MenuItemButton`]: {{site.api}}/flutter/material/MenuItemButton-class.html
[`MenuButtonTheme`]: {{site.api}}/flutter/material/MenuButtonTheme-class.html
[`DropdownMenu`]: {{site.api}}/flutter/material/DropdownMenu-class.html
[`DropdownMenuEntry`]: {{site.api}}/flutter/material/DropdownMenuEntry-class.html
[`DropdownMenuTheme`]: {{site.api}}/flutter/material/DropdownMenuTheme-class.html
[`TextTheme`]: {{site.api}}/flutter/material/TextTheme-class.html

[Update default menu text styles for Material 3]: {{site.repo.flutter}}/pull/131930
