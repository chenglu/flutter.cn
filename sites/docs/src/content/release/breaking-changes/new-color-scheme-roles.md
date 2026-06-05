---
# title: Introduce new ColorScheme roles for Material 3
title: 为 Material 3 引入新的 ColorScheme 角色
# description: >-
#   'ColorScheme' introduces new color roles to
#   better align with Material Design 3.
#   The 'ColorScheme.fromSeed' method is also updated to
#   support the newly added colors.
description: >
  “ColorScheme”引入了新的颜色角色，以更好地与 Material Design 3 保持一致。“ColorScheme.fromSeed”方法也进行了更新以支持新添加的颜色。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


New color roles in `ColorScheme` include
seven tone-based surfaces and containers, and twelve accent colors for
primary, secondary, and tertiary groups.
This update deprecates three existing color roles:
`background`, `onBackground`, and `surfaceVariant`.
The `ColorScheme` constructed by the updated `ColorScheme.fromSeed` method now
generates different values compared to the previous version,
adapting to the Material Design 3 guidelines.

“ColorScheme”中的新颜色角色包括七种基于色调的表面和容器，以及用于主要、次要和第三组的十二种强调色。此更新弃用了三个现有颜色角色：“background”、“onBackground”和“surfaceVariant”。由更新后的“ColorScheme.fromSeed”方法构造的“ColorScheme”现在与之前的版本相比会生成不同的值，以适应 Material Design 3 指南。


## Background

## 背景


The tone-based surface colors include:

基于色调的表面颜色包括：


- `surfaceBright`

  `surfaceBright`

- `surfaceDim`

  `surfaceDim`

- `surfaceContainer`

  `surfaceContainer`

- `surfaceContainerLow`

  `surfaceContainerLow`

- `surfaceContainerLowest`

  `surfaceContainerLowest`

- `surfaceContainerHigh`

  `surfaceContainerHigh`

- `surfaceContainerHighest`

  `surfaceContainerHighest`


These changes help eliminate the use of widgets' `surfaceTintColor`, and
replaces the old opacity-based model that applied a tinted overlay
on top of surfaces based on their elevation.

这些更改有助于消除 widget“surfaceTintColor”的使用，并取代旧的基于不透明度的模型，该模型根据表面的高度在表面顶部应用着色覆盖层。


The default `surfaceTintColor` for all widgets is now `null` and
their default background color is now
based on the new tone-based surface colors.

所有 widget 的默认“surfaceTintColor”现在为“null”，并且它们的默认背景颜色现在基于新的基于色调的表面颜色。


`ColorScheme.fromSeed` has also been updated to use the latest algorithm
from the [Material color utilities][] package.
This change prevents the constructed `ColorScheme` from being too bright,
even if the source color looks bright and
had a high chroma (contained little black, white, and shades of grey).

`ColorScheme.fromSeed` 也已更新为使用 材质颜色实用程序 包中的最新算法。此更改可防止构造的“ColorScheme”太亮，即使源颜色看起来明亮且具有高色度（包含少量黑色、白色和灰色阴影）。


[Material color utilities]: {{site.pub-pkg}}/material_color_utilities

## Migration guide

## 迁移指南


The differences caused by the updated `ColorScheme.fromSeed` and
the new color roles should be small and acceptable.
However, when providing a brighter seed color to `ColorScheme.fromSeed`,
it might construct a relatively darker version of `ColorScheme`.
To force the output to still be bright,
set `dynamicSchemeVariant: DynamicSchemeVariant.fidelity` in
`ColorScheme.fromSeed`. For example:

由更新的“ColorScheme.fromSeed”和新的颜色角色引起的差异应该很小并且可以接受。然而，当向“ColorScheme.fromSeed”提供更亮的种子颜色时，它可能会构造一个相对较暗的“ColorScheme”版本。要强制输出仍然明亮，请在“ColorScheme.fromSeed”中设置“dynamicSchemeVariant: DynamicSchemeVariant.fidelity”。例如：


Code before migration:

迁移前的代码：


```dart
ColorScheme.fromSeed(
    seedColor: Color(0xFF0000FF), // Bright blue
)
```

Code after migration:

迁移后的代码：


```dart
ColorScheme.fromSeed(
    seedColor: Color(0xFF0000FF), // Bright blue
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
)
```

Material Design 3 removes 3 colors.

Material Design 3 删除了 3 种颜色。


To configure the appearance of the material components,
`background` should be replaced with `surface`,
`onBackground` should be replaced with `onSurface`, and
`surfaceVariant` should be migrated to `surfaceContainerHighest`.

要配置材质组件的外观，应将“background”替换为“surface”，将“onBackground”替换为“onSurface”，并将“surfaceVariant”迁移到“surfaceContainerHighest”。


Code before migration:

迁移前的代码：


```dart
final ColorScheme colorScheme = ColorScheme();
MaterialApp(
  theme: ThemeData(
    //...
    colorScheme: colorScheme.copyWith(
      background: myColor1,
      onBackground: myColor2,
      surfaceVariant: myColor3,
    ),
  ),
  //...
)
```

Code after migration:

迁移后的代码：


```dart
final ColorScheme colorScheme = ColorScheme();
MaterialApp(
  theme: ThemeData(
    //...
    colorScheme: colorScheme.copyWith(
      surface: myColor1,
      onSurface: myColor2,
      surfaceContainerHighest: myColor3,
    ),
  ),
  //...
)
```

Custom components that used to look up `ColorScheme.background`,
`ColorScheme.onBackground`, and `ColorScheme.surfaceVariant` can look up
`ColorScheme.surface`, `ColorScheme.onSurface` and
`ColorScheme.surfaceContainerHighest` instead.

用于查找“ColorScheme.background”、“ColorScheme.onBackground”和“ColorScheme.surfaceVariant”的自定义组件可以改为查找“ColorScheme.surface”、“ColorScheme.onSurface”和“ColorScheme.surfaceContainerHighest”。


Code before migration:

迁移前的代码：


```dart
Color myColor1 = Theme.of(context).colorScheme.background;
Color myColor2 = Theme.of(context).colorScheme.onBackground;
Color myColor3 = Theme.of(context).colorScheme.surfaceVariant;
```

Code after migration:

迁移后的代码：


```dart
Color myColor1 = Theme.of(context).colorScheme.surface;
Color myColor2 = Theme.of(context).colorScheme.onSurface;
Color myColor3 = Theme.of(context).colorScheme.surfaceContainerHighest;
```

## Timeline

## 时间轴


Landed in version: 3.21.0-4.0.pre<br>
In stable release: 3.22.0

登陆版本：3.21.0-4.0.pre<br> 稳定版本：3.22.0


## References

## 参考


Relevant issues:

相关问题：


* [Support tone-based surface and surface container ColorScheme roles][]

  [支持基于色调的表面和表面容器 ColorScheme 角色][Support fidelity variant for ColorScheme.fromSeed]

* [Support fidelity variant for ColorScheme.fromSeed][]

  [支持 ColorScheme.fromSeed 的保真度变体][Support fidelity variant for ColorScheme.fromSeed]


Relevant PRs:

相关 PR：


* [Introduce tone-based surfaces and accent color add-ons - Part 1][]


* [Introduce tone-based surfaces and accent color add-ons - Part 2][]


* [Enhance ColorScheme.fromSeed with a new variant parameter][]

  [使用新的变体参数增强 ColorScheme.fromSeed][Support fidelity variant for ColorScheme.fromSeed]


[Support tone-based surface and surface container ColorScheme roles]: {{site.repo.flutter}}/issues/115912
[Support fidelity variant for ColorScheme.fromSeed]: {{site.repo.flutter}}/issues/144649
[Introduce tone-based surfaces and accent color add-ons - Part 1]: {{site.repo.flutter}}/pull/142654
[Introduce tone-based surfaces and accent color add-ons - Part 2]: {{site.repo.flutter}}/pull/144273
[Enhance ColorScheme.fromSeed with a new variant parameter]: {{site.repo.flutter}}/pull/144805
