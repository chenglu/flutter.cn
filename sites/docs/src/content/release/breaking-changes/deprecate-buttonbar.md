---
# title: Deprecate `ButtonBar` in favor of `OverflowBar`
title: 弃用 `ButtonBar` 以支持 `OverflowBar`
# description: >-
#   The ButtonBar widget has been replaced by
#   a more efficient widget, OverflowBar.
description: >-
  ButtonBar widget 已被更高效的 widget OverflowBar 取代。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `ButtonBar` widget was deprecated in favor of
the more efficient `OverflowBar` widget.
As a result, `ThemeData.buttonBarTheme` and
`ButtonBarTheme` were also deprecated.

`ButtonBar` widget 已被弃用，取而代之的是更高效的 `OverflowBar` widget。因此，`ThemeData.buttonBarTheme` 和 `ButtonBarTheme` 也被弃用。


## Context

## 背景


The `ButtonBar` widget lays out its children in a row and
in a column if there is not enough horizontal space.
The `OverflowBar` widget does the same, but it's
not tied to the Material library and is part of the core `widgets.dart` library.

如果没有足够的水平空间，`ButtonBar` widget 会将其子项布置在行和列中。 `OverflowBar` widget 具有相同的功能，但它不依赖于材质库，而是核心 `widgets.dart` 库的一部分。


## Description of change

## 变更说明


- Replace `ButtonBar` widget with `OverflowBar` widget.

  将 `ButtonBar` widget 替换为 `OverflowBar` widget。

- By default, `ButtonBar` aligns its children to the end of the layout, while

  默认情况下， `ButtonBar` 将其子级对齐到布局的末尾，而

  `OverflowBar` aligns its children to the start.
  To align the `OverflowBar` children to the end, set
  the `OverflowBar.alignment` property to `MainAxisAlignment.end`.

`OverflowBar` 将其子项对齐到开头。要将 `OverflowBar` 子项对齐到末尾，请将 `OverflowBar.alignment` 属性设置为 `MainAxisAlignment.end`。

- `ButtonBar.buttonPadding` provides spacing

  `ButtonBar.buttonPadding` 提供间距

  between buttons and padding around buttons.
  Replace it with `OverflowBar.spacing`, which provides spacing between buttons.
  Wrap the `OverflowBar` widget with `Padding` widget to
  provide padding around the buttons.

按钮之间以及按钮周围的填充。将其替换为 `OverflowBar.spacing`，它提供按钮之间的间距。用 `Padding` widget 包裹 `OverflowBar` widget 以在按钮周围提供填充。

- Replace `ButtonBar.overflowButtonSpacing` with `OverflowBar.overflowSpacing`,

  将 `ButtonBar.overflowButtonSpacing` 替换为 `OverflowBar.overflowSpacing`，

  which provides spacing between buttons when the buttons are laid in a column
  when there is not enough horizontal space.

当按钮放置在列中且水平空间不足时，它会提供按钮之间的间距。

- If it is specified, remove `ButtonBarThemeData` from `ThemeData`.

  如果已指定，请从 `ThemeData` 中删除 `ButtonBarThemeData`。


## Migration guide

## 迁移指南


Replace `ButtonBar` with `OverflowBar`, override the default alignment if
necessary, replace `ButtonBar.buttonPadding` with `Padding` widget and
`OverflowBar.spacing` for spacing between and around buttons, and replace
`ButtonBar.overflowButtonSpacing` with `OverflowBar.overflowSpacing` for
spacing between buttons when the buttons are laid in a column when there is not
enough horizontal space.

将 `ButtonBar` 替换为 `OverflowBar`，如有必要，覆盖默认对齐方式，将 `ButtonBar.buttonPadding` 替换为 `Padding` widget 和 `OverflowBar.spacing` 用于按钮之间和周围的间距，并将 `ButtonBar.overflowButtonSpacing` 替换为`OverflowBar.overflowSpacing` 用于当按钮放置在列中且水平空间不足时按钮之间的间距。


Before:

前：


```dart
ButtonBar(
  buttonPadding: const EdgeInsets.all(8.0),
  overflowButtonSpacing: 8.0,
  children: <Widget>[
    TextButton(child: const Text('Button 1'), onPressed: () {}),
    TextButton(child: const Text('Button 2'), onPressed: () {}),
    TextButton(child: const Text('Button 3'), onPressed: () {}),
  ],
),
```

After:

后：


```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: OverflowBar(
    alignment: MainAxisAlignment.end,
    spacing: 8.0,
    overflowSpacing: 8.0,
    children: <Widget>[
      TextButton(child: const Text('Button 1'), onPressed: () {}),
      TextButton(child: const Text('Button 2'), onPressed: () {}),
      TextButton(child: const Text('Button 3'), onPressed: () {}),
    ],
  ),
),
```

If you specify a `ThemeData.buttonBarTheme`, remove it and
use the `OverflowBar` widget properties to customize the `OverflowBar` widget.

如果指定 `ThemeData.buttonBarTheme`，请将其删除并使用 `OverflowBar` widget 属性自定义 `OverflowBar` widget。


Before:

前：


```dart
ThemeData(
  buttonBarTheme: ButtonBarThemeData(
    alignment: MainAxisAlignment.center,
  ),
),
```

After:

后：


```dart
ThemeData(
  // ...
),
```

If you use the `ButtonBarTheme` widget, remove it and
use the `OverflowBar` widget properties to customize the `OverflowBar` widget.

如果你使用 `ButtonBarTheme` widget，请将其删除并使用 `OverflowBar` widget 属性自定义 `OverflowBar` widget。


Before:

前：


```dart
ButtonBarTheme(
  data: ButtonBarThemeData(
    alignment: MainAxisAlignment.center,
  ),
  child: ButtonBar(
    children: <Widget>[
      // ...
    ],
  ),
),
```

After:

后：


```dart
OverflowBar(
  alignment: MainAxisAlignment.center,
  children: <Widget>[
    // ...
  ],
),
```

## Timeline

## 时间线


Landed in version: 3.22.0-2.0.pre<br>
登陆版本：3.22.0-2.0.pre
In stable release: 3.24.0
稳定版本：3.24.0

## References

## 参考资料


API documentation:

API 文档：


- [`OverflowBar`][]
- [`ButtonBar`][]

Relevant issues:

相关 issue：


- [Issue #127955][]

  [问题#127955][Issue #127955]


Relevant PRs:

相关 PR：


- [Deprecate `ButtonBar`, `ButtonBarThemeData`, and `ThemeData.buttonBarTheme`][]

  [弃用 `ButtonBar`、`ButtonBarThemeData` 和 `ThemeData.buttonBarTheme`][Deprecate `ButtonBar`, `ButtonBarThemeData`, and `ThemeData.buttonBarTheme`]


[`OverflowBar`]: {{site.api}}/flutter/widgets/OverflowBar-class.html
[`ButtonBar`]: {{site.api}}/flutter/material/ButtonBar-class.html
[Issue #127955]: {{site.repo.flutter}}/issues/127955
[Deprecate `ButtonBar`, `ButtonBarThemeData`, and `ThemeData.buttonBarTheme`]: {{site.repo.flutter}}/pull/145523
