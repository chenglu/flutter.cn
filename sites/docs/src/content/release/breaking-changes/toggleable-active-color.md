---
# title: ThemeData's toggleableActiveColor property has been deprecated
title: ThemeData 的 toggleableActiveColor 属性已弃用
# description: >
#   Material Widgets that use toggleableActiveColor property
#   are migrated to use Material ColorScheme.
description: >
  使用 toggleableActiveColor 属性的 Material Widget 已迁移为使用 Material ColorScheme。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The Material widgets `Switch`, `SwitchListTile`, `Checkbox`,
`CheckboxListTile`, `Radio`, `RadioListTile` now use
`ColorScheme.secondary` color for their toggleable widget.
`ThemeData.toggleableActiveColor` is deprecated and will eventually be removed.

Material widget `Switch`、`SwitchListTile`、`Checkbox`、`CheckboxListTile`、`Radio`、`RadioListTile` 现在使用 `ColorScheme.secondary` 颜色作为其可切换 widget 的颜色。`ThemeData.toggleableActiveColor` 已弃用，最终将移除。

## Context

## 背景

The migration of widgets that depend on `ThemeData.toggleableActiveColor`
to `ColorScheme.secondary` caused  the `toggleableActiveColor` property
to be unnecessary. This property will eventually be removed, as per Flutter's
[deprecation policy](/release/compatibility-policy#deprecation-policy).

依赖 `ThemeData.toggleableActiveColor` 的 widget 迁移到 `ColorScheme.secondary` 后，`toggleableActiveColor` 属性变得不再必要。根据 Flutter 的[弃用政策](/release/compatibility-policy#deprecation-policy)，此属性最终将移除。

## Description of change

## 变更说明

The widgets using `ThemeData.toggleableActiveColor` color for the
active/selected state now use `ColorScheme.secondary`.

使用 `ThemeData.toggleableActiveColor` 颜色作为激活/选中状态的 widget 现在使用 `ColorScheme.secondary`。

## Migration guide

## 迁移指南

Toggleable widgets' active/selected color can generally be customized in 3 ways:

可切换 widget 的激活/选中颜色通常可以通过 3 种方式自定义：

1. Using ThemeData's `ColorScheme.secondary`.

   使用 ThemeData 的 `ColorScheme.secondary`。

2. Using components themes `SwitchThemeData`, `ListTileThemeData`,
   `CheckboxThemeData`, and `RadioThemeData`.

   使用组件主题 `SwitchThemeData`、`ListTileThemeData`、`CheckboxThemeData` 和 `RadioThemeData`。

3. By customizing the widget's color properties.

   通过自定义 widget 的颜色属性。

Code before migration:

迁移前的代码：

```dart
MaterialApp(
  theme: ThemeData(toggleableActiveColor: myColor),
  // ...
);
```

Code after migration:

迁移后的代码：

```dart
final ThemeData theme = ThemeData();
MaterialApp(
  theme: theme.copyWith(
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return myColor;
        }
        return null;
      }),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return myColor;
        }
        return null;
      }),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return myColor;
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return null;
        }
        if (states.contains(MaterialState.selected)) {
          return myColor;
        }
        return null;
      }),
    ),
  ),
  //...
)
```

## Timeline

## 时间线

In stable release: 3.7

稳定版发布：3.7

## References

## 参考资料

API documentation:

API 文档：

* [`ThemeData.toggleableActiveColor`][]
* [`ColorScheme.secondary`][]

Relevant issues:

相关问题：

* [`Switch` widget color doesn't use `ColorScheme`][]

  [`Switch` widget 颜色未使用 `ColorScheme`][`Switch` widget color doesn't use `ColorScheme`]

Relevant PRs:

相关 PR：

* [Deprecate `toggleableActiveColor`][].

  [弃用 `toggleableActiveColor`][Deprecate `toggleableActiveColor`]。

[`ThemeData.toggleableActiveColor`]: {{site.api}}/flutter/material/ThemeData/toggleableActiveColor.html
[`ColorScheme.secondary`]: {{site.api}}/flutter/material/ColorScheme/secondary.html
[`Switch` widget color doesn't use `ColorScheme`]: {{site.repo.flutter}}/issues/93709
[Deprecate `toggleableActiveColor`]: {{site.repo.flutter}}/pull/97972
