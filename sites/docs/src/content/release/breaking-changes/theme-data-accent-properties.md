---
# title: ThemeData's accent properties have been deprecated
title: ThemeData 的重音属性已被弃用
# description: >
#   The ThemeData accentColor, accentColorBrightness, accentIconTheme, and
#   accentTextTheme properties have been deprecated.
description: >
  ThemeDataaccentColor、accentColorBrightness、accentIconTheme 和 accentTextTheme 属性已被弃用。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The ThemeData [accentColor][], [accentColorBrightness][], [accentIconTheme][]
and [accentTextTheme][] properties have been deprecated.

ThemeData [accentColor][]、[accentColorBrightness][]、[accentIconTheme][] 和 [accentTextTheme][] 属性已被弃用。


The [Material Design spec][] no longer specifies or uses an `accent`
color for the Material components. The default values for component
colors are derived from the overall theme's [color scheme][color-scheme-prop].
The `ColorScheme`'s [secondary color][] is now typically used instead of
`accentColor` and the [onSecondary color][] is used when a contrasting
color is needed.

[Material Design 规范][Material Design spec] 不再为 Material 组件指定或使用“强调色”。组件颜色的默认值源自整个主题的[配色方案][color-scheme-prop]。现在通常使用“ColorScheme”的辅助颜色代替“accentColor”，并且在需要对比色时使用[onSecondary color][]。


## Context

## 背景


This was a small part of the [Material Theme System Updates][] project.

这是[Material Theme System Updates][]项目的一小部分。


As of Flutter 1.17, the ThemeData accent properties - accentColor,
accentColorBrightness, accentIconTheme, and accentTextTheme - were no
longer used by the Material library. They had been replaced by
dependencies on the theme's [`colorScheme`][color-scheme-prop] and
[`textTheme`][text-scheme-prop] properties as part of the long-term goal of
making the default configurations of the material components depend
almost exclusively on these two properties.

从 Flutter 1.17 开始，Material 库不再使用 ThemeData 强调属性（accentColor、accentColorBrightness、accentIconTheme 和 accentTextTheme）。它们已被主题的 [`colorScheme`][color-scheme-prop] 和 [`textTheme`][text-scheme-prop] 属性的依赖项所取代，作为使材质组件的默认配置几乎完全依赖于这两个属性的长期目标的一部分。


The motivation for these changes is to make the theme system easier to
understand and use. The default colors for all components are to be
defined by the components themselves and based on the color
scheme. The defaults for specific component types can be overridden
with component-specific themes like [`FloatingActionButtonThemeData`][] or
[`CheckBoxTheme`][]. Previously, properties like accentColor were used by a
handful of component types and only in some situations, which made it
difficult to understand the implications of overriding them.

这些更改的动机是使主题系统更易于理解和使用。所有组件的默认颜色均由组件本身并基于配色方案定义。特定组件类型的默认设置可以用特定于组件的主题覆盖，例如 [`FloatingActionButtonThemeData`][] 或 [`CheckBoxTheme`][]。以前，像 accentColor 这样的属性被少数组件类型使用，并且仅在某些情况下使用，这使得很难理解覆盖它们的含义。


## Description of change

## 变更说明


The ThemeData accentColor, accentColorBrightness, accentIconTheme and
accentTextTheme properties have been deprecated because the Material
library no longer uses them.

ThemeData 的 accentColor、accentColorBrightness、accentIconTheme 和 accentTextTheme 属性已被弃用，因为 Material 库不再使用它们。


## Migration guide

## 迁移指南


### Application theme

### 应用主题


[`ThemeData`][] values no longer need to specify accentColor,
accentColorBrightness, accentIconTheme, or accentTextTheme.

[`ThemeData`][]值不再需要指定 accentColor、accentColorBrightness、accentIconTheme 或 accentTextTheme。


To configure the appearance of the material components in about the
same way as before, specify the color scheme's secondary color
instead of accentColor.

要以与以前大致相同的方式配置材质组件的外观，请指定配色方案的辅助颜色而不是 accentColor。


Code before migration:

迁移前的代码：


```dart
MaterialApp(
  theme: ThemeData(accentColor: myColor),
  // ...
);
```

Code after migration:

迁移后的代码：


```dart
final ThemeData theme = ThemeData();
MaterialApp(
  theme: theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(secondary: myColor),
  ),
  //...
)
```

### `accentColor`

### `accentColor`


The closest backwards compatible [`ColorScheme`][] color is
[`ColorScheme.secondary`][]. To hew most closely to the latest Material
Design guidelines one can substitute `ColorScheme.primary` instead.
If a contrasting color is needed then use [`ColorScheme.onSecondary`][].

最向后兼容的 [`ColorScheme`][] 颜色是 [`ColorScheme.secondary`][]。为了最严格地遵守最新的材料设计指南，我们可以用“ColorScheme.primary”代替。如果需要对比色，则使用 [`ColorScheme.onSecondary`][]。


Custom components that used to look up the theme's accentColor, can look up
the `ColorScheme.secondary` instead.

用于查找主题的 accentColor 的自定义组件可以改为查找“ColorScheme.secondary”。


Code before migration:

迁移前的代码：


```dart
Color myColor = Theme.of(context).accentColor;
```

Code after migration:

迁移后的代码：


```dart
Color myColor = Theme.of(context).colorScheme.secondary;
```

### `accentColorBrightness`

### `accentColorBrightness`


The static [`ThemeData.estimateBrightnessForColor()`][] method can be used
to compute the brightness of any color.

静态 [`ThemeData.estimateBrightnessForColor()`][] 方法可用于计算任何颜色的亮度。


### `accentTextTheme`

### `accentTextTheme`


This was white [`TextStyle`]s for dark themes, black
TextStyles for light themes. In most cases textTheme can be used
instead. A common idiom was to refer to one TextStyle from
accentTextTheme, since the text style's color was guaranteed to contrast
well with the accent color (now `ColorScheme.secondaryColor`).
To get the same result now, specify the text style's color as
`ColorScheme.onSecondary`:

这是用于深色主题的白色 [`TextStyle`]，用于浅色主题的黑色 TextStyle。大多数情况下可以使用 textTheme 代替。一种常见的习惯用法是引用 accentTextTheme 中的一个 TextStyle，因为文本样式的颜色保证与强调色（现在为“ColorScheme.secondaryColor”）形成良好的对比。现在要获得相同的结果，请将文本样式的颜色指定为“ColorScheme.onSecondary”：


Code before migration:

迁移前的代码：


```dart
TextStyle style = Theme.of(context).accentTextTheme.headline1;
```

Code after migration:

迁移后的代码：


```dart
final ThemeData theme = Theme.of(context);
TextStyle style = theme.textTheme.headline1.copyWith(
  color: theme.colorScheme.onSecondary,
)
```

### `accentIconTheme`

### `accentIconTheme`


This property had only been used to configure the color of icons
within a [`FloatingActionButton`][]. It's now possible to configure the icon
color directly or with the [`FloatingActionButtonThemeData`][]. See
[FloatingActionButton and ThemeData's accent properties][].

此属性仅用于配置 [`FloatingActionButton`][] 内的图标颜色。现在可以直接或使用 [`FloatingActionButtonThemeData`][] 配置图标颜色。请参阅[FloatingActionButton 和 ThemeData 的重音属性][`FloatingActionButtonThemeData`]。


## Timeline

## 时间轴


Landed in version: 2.3.0-0.1.pre<br>
In stable release: 2.5

登陆版本：2.3.0-0.1.pre<br> 稳定版本：2.5


## References

## 参考


API documentation:

API 文档：


* [`ColorScheme`][]


* [`FloatingActionButton`][]


* [`FloatingActionButtonThemeData`][]


* [`TextStyle`][]


* [`TextTheme`][]


* [`Theme`][]

  [` 主题 `][`Theme`]

* [`ThemeData`][]


Relevant issues:

相关问题：


* [Issue #56918][]

  [问题#56918][Issue #56918]


Relevant PRs:

相关 PR：


* [PR #81336][]

  [公关#81336][PR #81336]


Other:

其他：


* [Material Theme System Updates][]


[accentColor]: {{site.api}}/flutter/material/ThemeData/accentColor.html
[accentColorBrightness]: {{site.api}}/flutter/material/ThemeData/accentColorBrightness.html
[accentIconTheme]: {{site.api}}/flutter/material/ThemeData/accentIconTheme.html
[accentTextTheme]: {{site.api}}/flutter/material/ThemeData/accentTextTheme.html
[`CheckboxTheme`]: {{site.api}}/flutter/material/CheckboxTheme-class.html
[color-scheme-prop]: {{site.api}}/flutter/material/ThemeData/colorScheme.html
[`colorScheme.onSecondary`]: {{site.api}}/flutter/material/ColorScheme/onSecondary.html
[`colorScheme.secondary`]: {{site.api}}/flutter/material/ColorScheme/secondary.html
[`ColorScheme`]: {{site.api}}/flutter/material/ColorScheme-class.html
[Issue #56918]: {{site.repo.flutter}}/issues/56918
[FloatingActionButton and ThemeData's accent properties]: /release/breaking-changes/fab-theme-data-accent-properties
[`FloatingActionButton`]: {{site.api}}/flutter/material/FloatingActionButton-class.html
[`FloatingActionButtonThemeData`]: {{site.api}}/flutter/material/FloatingActionButtonThemeData-class.html
[Material Design spec]: {{site.material}}/styles/color
[Material Theme System Updates]: /go/material-theme-system-updates
[secondary color]: {{site.api}}/flutter/material/ColorScheme/secondary.html
[onSecondary color]: {{site.api}}/flutter/material/ColorScheme/onSecondary.html
[PR #81336]: {{site.repo.flutter}}/pull/81336
[`TextStyle`]: {{site.api}}/flutter/painting/TextStyle-class.html
[text-scheme-prop]: {{site.api}}/flutter/material/ThemeData/textTheme.html
[`TextTheme`]: {{site.api}}/flutter/material/TextTheme-class.html
[`Theme`]: {{site.api}}/flutter/material/Theme-class.html
[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html
[`ThemeData.estimateBrightnessForColor()`]: {{site.api}}/flutter/material/ThemeData/estimateBrightnessForColor.html
