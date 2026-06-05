---
# title: Component theme normalization
title: 组件主题规范化
# description: >-
#   `CardTheme`, `DialogTheme`, and `TabBarTheme` have been normalized to follow
#   Flutter's convention for component themes in the Material library.
description: >-
  `CardTheme`、`DialogTheme` 和 `TabBarTheme` 已标准化，以遵循 Flutter 材质库中组件主题的约定。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`CardTheme`, `DialogTheme` and `TabBarTheme` were refactored to
conform to Flutter's conventions for component themes.
`CardThemeData`, `DialogThemeData`, and `TabBarThemeData` were added to
define overrides for the defaults of the component visual properties.
Releases of Flutter continue to normalize component themes like these for
a more consistent theming experience in the material library.

`CardTheme`、`DialogTheme` 和 `TabBarTheme` 进行了重构，以符合 Flutter 的组件主题约定。添加了 `CardThemeData`、`DialogThemeData` 和 `TabBarThemeData` 来定义组件视觉属性默认值的覆盖。 Flutter 的版本继续规范此类组件主题，以在材质库中提供更一致的主题体验。


## Migration guide

## 迁移指南


In `ThemeData`:

在 `ThemeData` 中：


- The type of the `cardTheme` property has been

  `cardTheme` 属性的类型已

  changed from `CardTheme` to `CardThemeData`.

从 `CardTheme` 更改为 `CardThemeData`。

- The type of the `dialogTheme` property has been

  `dialogTheme` 属性的类型已

  changed from the `DialogTheme` to `DialogThemeData`.

从 `DialogTheme` 更改为 `DialogThemeData`。

- The type of `tabBarTheme` property has been

  `tabBarTheme` 属性的类型已

  changed from `TabBarTheme` to `TabBarThemeData`.

从 `TabBarTheme` 更改为 `TabBarThemeData`。


The return type of the component theme `xTheme.of()` methods and
`Theme.of().xTheme` have also changed to `xThemeData` accordingly.

组件主题`xTheme.of()`方法和`Theme.of().xTheme`的返回类型也相应更改为`xThemeData`。


Code before migration:

迁移前的代码：


```dart
final CardTheme cardTheme = Theme.of(context).cardTheme;
final CardTheme cardTheme = CardTheme.of(context);

final DialogTheme dialogTheme = Theme.of(context).dialogTheme;
final DialogTheme dialogTheme = DialogTheme.of(context);

final TabBarTheme tabBarTheme = Theme.of(context).tabBarTheme;
final TabBarTheme tabBarTheme = TabBarTheme.of(context);
```

Code after migration:

迁移后的代码：


```dart
final CardThemeData cardTheme = Theme.of(context).cardTheme;
final CardThemeData cardTheme = CardTheme.of(context);

final DialogThemeData dialogTheme = Theme.of(context).dialogTheme;
final DialogThemeData dialogTheme = DialogTheme.of(context);

final TabBarThemeData tabBarTheme = Theme.of(context).tabBarTheme;
final TabBarThemeData tabBarTheme = TabBarTheme.of(context);
```

## Timeline

## 时间线


Landed in version: 3.27.0-0.0.pre<br>
登陆版本：3.27.0-0.0.pre
Stable release: 3.27
稳定版本：3.27

## References

## 参考资料


API documentation:

API 文档：


* [`ThemeData`][]
* [`CardTheme`][]
* [`DialogTheme`][]
* [`TabBarTheme`][]

Relevant PRs:

相关 PR：


* [Normalize ThemeData.cardTheme][]

  [标准化 ThemeData.cardTheme][Normalize ThemeData.cardTheme]

* [Normalize ThemeData.dialogTheme][]

  [标准化 ThemeData.dialogTheme][Normalize ThemeData.dialogTheme]

* [Normalize ThemeData.tabBarTheme][]

  [标准化 ThemeData.tabBarTheme][Normalize ThemeData.tabBarTheme]


[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html
[`CardTheme`]: {{site.api}}/flutter/material/CardTheme-class.html
[`DialogTheme`]: {{site.api}}/flutter/material/DialogTheme-class.html
[`TabBarTheme`]: {{site.api}}/flutter/material/TabBarTheme-class.html
[Normalize ThemeData.cardTheme]: {{site.repo.flutter}}/pull/153254
[Normalize ThemeData.dialogTheme]: {{site.repo.flutter}}/pull/155129
[Normalize ThemeData.tabBarTheme]: {{site.repo.flutter}}/pull/156253
