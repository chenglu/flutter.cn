---
# title: AppBar theme color parameter deprecation
title: AppBar 主题颜色参数弃用
# description: >-
#   The color parameter in AppBarTheme and AppBarThemeData has been
#   deprecated in favor of backgroundColor for better API consistency.
description: >-
  AppBarTheme 和 AppBarThemeData 中的颜色参数已被弃用，取而代之的是 backgroundColor，以实现更好的 API 一致性。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `color` parameter in `AppBarTheme` and `AppBarThemeData` constructors
and their `copyWith` methods have been deprecated. Use `backgroundColor`
instead. This change affects how AppBar themes are configured and might
cause deprecation warnings in existing code.

`AppBarTheme` 和 `AppBarThemeData` 构造函数中的 `color` 参数及其 `copyWith` 方法已被弃用。请改用 `backgroundColor` 。此更改会影响 AppBar 主题的配置方式，并可能导致现有代码中出现弃用警告。


## Background

## 背景


The AppBar theming system had two parameters that controlled the same
property: `color` and `backgroundColor`. This duplication created confusion
and inconsistency in the API. To improve clarity and consistency, the
`color` parameter has been deprecated in favor of `backgroundColor`.

AppBar 主题系统有两个控制相同属性的参数：`color` 和 `backgroundColor`。这种重复在 API 中造成了混乱和不一致。为了提高清晰度和一致性，`color` 参数已被弃用，取而代之的是 `backgroundColor`。


The deprecation affects the following classes and methods:

弃用会影响以下类和方法：


- `AppBarTheme` constructor

  `AppBarTheme` 构造函数

- `AppBarTheme.copyWith` method

  `AppBarTheme.copyWith` 方法

- `AppBarThemeData` constructor

  `AppBarThemeData` 构造函数

- `AppBarThemeData.copyWith` method

  `AppBarThemeData.copyWith` 方法


When using the deprecated `color` parameter, you'll see warnings like:

当使用已弃用的 `color` 参数时，你会看到如下警告：


```txt
'color' is deprecated and shouldn't be used. Use backgroundColor instead.
This feature was deprecated after v3.33.0-0.2.pre.
```

The classes also include assertion checks to prevent using both parameters
simultaneously:

这些类还包括断言检查，以防止同时使用两个参数：


```txt
The color and backgroundColor parameters mean the same thing. Only specify one.
```

## Migration guide

## 迁移指南


Replace all uses of the `color` parameter with `backgroundColor` in
`AppBarTheme` and `AppBarThemeData` constructors and `copyWith` methods.

将 `AppBarTheme` 和 `AppBarThemeData` 构造函数以及 `copyWith` 方法中对 `color` 参数的所有使用替换为 `backgroundColor`。


Code before migration:

迁移前的代码：


```dart
// AppBarTheme constructor
AppBarTheme(
  color: Colors.blue,
  elevation: 4.0,
)

// AppBarTheme copyWith
theme.copyWith(
  color: Colors.red,
  elevation: 2.0,
)

// AppBarThemeData constructor
AppBarThemeData(
  color: Colors.green,
  elevation: 4.0,
)

// AppBarThemeData copyWith
themeData.copyWith(
  color: Colors.purple,
  elevation: 2.0,
)
```

Code after migration:

迁移后的代码：


```dart
// AppBarTheme constructor
AppBarTheme(
  backgroundColor: Colors.blue,
  elevation: 4.0,
)

// AppBarTheme copyWith
theme.copyWith(
  backgroundColor: Colors.red,
  elevation: 2.0,
)

// AppBarThemeData constructor
AppBarThemeData(
  backgroundColor: Colors.green,
  elevation: 4.0,
)

// AppBarThemeData copyWith
themeData.copyWith(
  backgroundColor: Colors.purple,
  elevation: 2.0,
)
```

## Timeline

## 时间线


Landed in version: 3.33.0-0.2.pre<br>
登陆版本：3.33.0-0.2.pre
In stable release: 3.35.4
稳定版本：3.35.4

## References

## 参考资料


API documentation:

API 文档：


- [`AppBarTheme`](https://main-api.flutter.dev/flutter/material/AppBarTheme-class.html)
- [`AppBarThemeData`](https://main-api.flutter.dev/flutter/material/AppBarThemeData-class.html)

Relevant PRs:

相关 PR：


- [AppBar theme color parameter deprecation #170624]({{site.github}}/flutter/flutter/pull/170624)
