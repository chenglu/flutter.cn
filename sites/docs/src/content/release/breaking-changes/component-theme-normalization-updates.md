---
# title: Component theme normalization updates
title: 组件主题规范化更新
# description: >-
#   `AppBarTheme`, `BottomAppBarTheme` and `InputDecorationTheme` have been
#   normalized to follow Flutter's convention for component themes in the
#   Material library.
description: >-
  `AppBarTheme`、`BottomAppBarTheme` 和 `InputDecorationTheme` 已标准化，以遵循 Flutter 材质库中组件主题的约定。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`AppBarTheme`, `BottomAppBarTheme` and `InputDecorationTheme` were refactored
to conform to Flutter's conventions for component themes.
`AppBarThemeData`, `BottomAppBarThemeData` and `InputDecorationThemeData` were
added to define overrides for the defaults of the component visual properties.
Releases of Flutter continue to normalize component themes like these for
a more consistent theming experience in the material library.

`AppBarTheme`、`BottomAppBarTheme` 和 `InputDecorationTheme` 进行了重构，以符合 Flutter 的组件主题约定。添加了 `AppBarThemeData`、`BottomAppBarThemeData` 和 `InputDecorationThemeData` 来定义组件视觉属性默认值的覆盖。 Flutter 的版本继续规范此类组件主题，以在材质库中提供更一致的主题体验。


## Migration guide

## 迁移指南


In `ThemeData`:

在 `ThemeData` 中：

- The type of the `appBarTheme` property has been

  `appBarTheme` 属性的类型已

  changed from `AppBarTheme` to `AppBarThemeData`.

从 __PH_14e1ddd​​8__ 更改为 `AppBarThemeData`。

- The type of `bottomAppBarTheme` property has been

  `bottomAppBarTheme` 属性的类型已

  changed from `BottomAppBarTheme` to `BottomAppBarThemeData`.

从 `BottomAppBarTheme` 更改为 `BottomAppBarThemeData`。

- The type of `inputDecorationTheme` property has been

  `inputDecorationTheme` 属性的类型已

  changed from `InputDecorationTheme` to `InputDecorationThemeData`.

从 `InputDecorationTheme` 更改为 `InputDecorationThemeData`。


The return type of the component theme `xTheme.of()` methods and
`Theme.of().xTheme` have also changed to `xThemeData`.

组件主题`xTheme.of()`方法和`Theme.of().xTheme`的返回类型也更改为`xThemeData`。


In `DatePickerThemeData` and `TimePickerThemeData`, the type of the
`inputDecorationTheme` property has been changed from `InputDecorationTheme`
to `InputDecorationThemeData`.

在 `DatePickerThemeData` 和 `TimePickerThemeData` 中，`inputDecorationTheme` 属性的类型已从 `InputDecorationTheme` 更改为 `InputDecorationThemeData`。


Code before migration:

迁移前的代码：


```dart
final AppBarTheme appBarTheme = Theme.of(context).appBarTheme;
final AppBarTheme appBarTheme = AppBarTheme.of(context);

final BottomAppBarTheme bottomAppBarTheme = Theme.of(context).bottomAppBarTheme;
final BottomAppBarTheme bottomAppBarTheme = BottomAppBarTheme.of(context);

final InputDecorationTheme inputDecorationTheme = Theme.of(context).inputDecorationTheme;
final InputDecorationTheme inputDecorationTheme = InputDecorationTheme.of(context);
final InputDecorationTheme inputDecorationTheme = Theme.of(context).datePickerTheme.inputDecorationTheme;
final InputDecorationTheme inputDecorationTheme = Theme.of(context).timePickerTheme.inputDecorationTheme;
```

```dart
final ThemeData theme = ThemeData(
  appBarTheme: AppBarTheme(),
  bottomAppBarTheme: BottomAppBarTheme(),
  inputDecorationTheme: InputDecorationTheme(),
);

final ThemeData theme = ThemeData().copyWith(
  appBarTheme: AppBarTheme(),
  bottomAppBarTheme: BottomAppBarTheme(),
  inputDecorationTheme: InputDecorationTheme(),
);

const DatePickerThemeData datePickerTheme = DatePickerThemeData(inputDecorationTheme: InputDecorationTheme());
const TimePickerThemeData timePickerTheme = TimePickerThemeData(inputDecorationTheme: InputDecorationTheme());
```

Code after migration:

迁移后的代码：


```dart
final AppBarThemeData appBarTheme = Theme.of(context).appBarTheme;
final AppBarThemeData appBarTheme = AppBarTheme.of(context);

final BottomAppBarThemeData bottomAppBarTheme = Theme.of(context).bottomAppBarTheme;
final BottomAppBarThemeData bottomAppBarTheme = BottomAppBarTheme.of(context);

final InputDecorationThemeData inputDecorationTheme = Theme.of(context).inputDecorationTheme;
final InputDecorationThemeData inputDecorationTheme = InputDecorationTheme.of(context);
final InputDecorationThemeData inputDecorationTheme = Theme.of(context).datePickerTheme.inputDecorationTheme;
final InputDecorationThemeData inputDecorationTheme = Theme.of(context).timePickerTheme.inputDecorationTheme;
```

```dart
final ThemeData theme = ThemeData(
  appBarTheme: AppBarThemeData(),
  bottomAppBarTheme: BottomAppBarThemeData(),
  inputDecorationTheme: InputDecorationThemeData(),
);

final ThemeData theme = ThemeData().copyWith(
  appBarTheme: AppBarThemeData(),
  bottomAppBarTheme: BottomAppBarThemeData(),
  inputDecorationTheme: InputDecorationThemeData(),
);

const DatePickerThemeData datePickerTheme = DatePickerThemeData(inputDecorationTheme: InputDecorationThemeData());
const TimePickerThemeData timePickerTheme = TimePickerThemeData(inputDecorationTheme: InputDecorationThemeData());
```

## Timeline

## 时间线


Landed in version: 3.33.0-1.0.pre through 3.35.0-0.0.pre<br>
登陆版本：3.33.0-1.0.pre<br>至<br>3.35.0-0.0.pre
Stable release: 3.35
稳定版本：3.35

## References

## 参考资料


API documentation:

API 文档：


* [`AppBarTheme`][]
* [`BottomAppBarTheme`][]
* [`InputDecorationTheme`][]

Relevant PRs:

相关 PR：


* [Normalize ThemeData.appBarTheme][]

  [规范化 ThemeData.appBarTheme][Normalize ThemeData.appBarTheme]

* [Normalize ThemeData.bottomAppBarTheme][]

  [规范化 ThemeData.bottomAppBarTheme][Normalize ThemeData.bottomAppBarTheme]

* [Normalize InputDecorationTheme][]

  [标准化输入装饰主题][Normalize InputDecorationTheme]

* [Apply normalization to TimePickerThemeData.inputDecorationTheme][]

  [将标准化应用于 TimePickerThemeData.inputDecorationTheme][Apply normalization to TimePickerThemeData.inputDecorationTheme]


[`AppBarTheme`]: {{site.api}}/flutter/material/AppBarTheme-class.html
[Normalize ThemeData.appBarTheme]: {{site.repo.flutter}}/pull/169130
[`BottomAppBarTheme`]: {{site.api}}/flutter/material/BottomAppBarTheme-class.html
[Normalize ThemeData.bottomAppBarTheme]: {{site.repo.flutter}}/pull/168586
[`InputDecorationTheme`]: {{site.api}}/flutter/material/InputDecorationTheme-class.html
[Normalize InputDecorationTheme]: {{site.repo.flutter}}/pull/168981
[Apply normalization to TimePickerThemeData.inputDecorationTheme]: {{site.repo.flutter}}/pull/171584
