---
# title: Updated Material 3 progress indicators
title: 更新了 Material 3 进度指示器
# description: >-
#   The `LinearProgressIndicator` and `CircularProgressIndicator` widgets
#   have been updated to match the Material 3 Design specifications.
description: >-
  `LinearProgressIndicator` 和 `CircularProgressIndicator` widget 已更新，以匹配 Material 3 设计规范。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


The `LinearProgressIndicator` and `CircularProgressIndicator` have
been updated to match the Material 3 Design specifications.

`LinearProgressIndicator` 和 `CircularProgressIndicator` 已更新，以匹配 Material 3 设计规范。


The `LinearProgressIndicator`changes include a gap between
the active and inactive tracks, a stop indicator, and rounded corners.
The `CircularProgressIndicator` changes include a gap between
the active and inactive tracks, and rounded stroke cap.

`LinearProgressIndicator` 更改包括活动轨道和非活动轨道之间的间隙、停止指示器和圆角。 `CircularProgressIndicator` 更改包括活动轨道和非活动轨道之间的间隙以及圆形笔划上限。


## Context

## 背景


The Material 3 Design specifications for the `LinearProgressIndicator` and
`CircularProgressIndicator` were updated in December 2023.

`LinearProgressIndicator` 和 `CircularProgressIndicator` 的 Material 3 设计规范已于 2023 年 12 月更新。


To opt into the 2024 design specifications,
set the `LinearProgressIndicator.year2023` and
`CircularProgressIndicator.year2023` flags to `false`.
This is done to ensure that existing apps aren't affected by
the updated design spec.

要选择 2024 年设计规范，请将 `LinearProgressIndicator.year2023` 和 `CircularProgressIndicator.year2023` 标志设置为 `false`。这样做是为了确保现有应用程序不会受到更新的设计规范的影响。


## Description of change

## 变更说明


The `LinearProgressIndicator` and `CircularProgressIndicator` widgets each
have a `year2023` flag that can be set to `false` to
opt in to the updated design specification.
The default value for the `year2023` flag is `true`, which means that
the progress indicators use the 2023 design spec.

`LinearProgressIndicator` 和 `CircularProgressIndicator` widget 各自都有一个 `year2023` 标志，可以将其设置为 `false` 以选择加入更新的设计规范。 `year2023` 标志的默认值为 `true`，这意味着进度指示器使用 2023 设计规范。


When [`LinearProgressIndicator.year2023`][] is set to `false`,
the progress indicator have gaps between active and inactive tracks,
a stop indicator, and rounded corners.
If the `LinearProgressIndicator` is indeterminate,
the stop indicator isn't shown.

什么时候[`LinearProgressIndicator.year2023`][]设置为 `false` 时，进度指示器在活动轨道和非活动轨道之间有间隙、停止指示器和圆角。如果 `LinearProgressIndicator` 不确定，则不会显示停止指示器。


When [`CircularProgressIndicator.year2023`][] is set to `false`,
the progress indicator has a track gap and rounded stroke cap.

什么时候[`CircularProgressIndicator.year2023`][]设置为 `false`，进度指示器具有轨道间隙和圆形行程帽。


## Migration guide

## 迁移指南


To opt into the updated design spec for the `LinearProgressIndicator`,
set the `year2023` flag to `false`:

要选择 `LinearProgressIndicator` 的更新设计规范，请将 `year2023` 标志设置为 `false`：


```dart highlightLines=2
LinearProgressIndicator(
  year2023: false,
  value: 0.5,
),
```

To update your entire app to use the updated `LinearProgressIndicator` design,
set the `ProgressIndicatorThemeData.year2023` property to `false` in your
`MaterialApp`:

要更新整个应用程序以使用更新后的 `LinearProgressIndicator` 设计，请将 `MaterialApp` 中的 `ProgressIndicatorThemeData.year2023` 属性设置为 `false` ：


```dart highlightLines=2
return MaterialApp(
  theme: ThemeData(progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false)),
        // ...
        LinearProgressIndicator(
          year2023: false,
          value: 0.5,
        ),
        // ...
```

To opt into the updated design spec for the `CircularProgressIndicator`,
set the `year2023` flag to `false`:

要选择 `CircularProgressIndicator` 的更新设计规范，请将 `year2023` 标志设置为 `false`：


```dart highlightLines=2
CircularProgressIndicator(
  year2023: false,
  value: 0.5,
),
```

To update your entire app to use the updated `CircularProgressIndicator` design,
set the `ProgressIndicatorThemeData.year2023` property to `false` in your
`MaterialApp`:

要更新整个应用程序以使用更新后的 `CircularProgressIndicator` 设计，请将 `MaterialApp` 中的 `ProgressIndicatorThemeData.year2023` 属性设置为 `false`：


```dart highlightLines=2
return MaterialApp(
  theme: ThemeData(progressIndicatorTheme: const ProgressIndicatorThemeData(year2023: false)),
        // ...
        CircularProgressIndicator(
          year2023: false,
          value: 0.5,
        ),
        // ...
```

## Timeline

## 时间线


Landed in version: 3.28.0-0.1.pre<br>
登陆版本：3.28.0-0.1.pre
In stable release: 3.29
稳定版本：3.29

## References

## 参考资料


API documentation:

API 文档：


- [`LinearProgressIndicator`][]
- [`CircularProgressIndicator`][]
- [`LinearProgressIndicator.year2023`][]
- [`CircularProgressIndicator.year2023`][]

Relevant issues:

相关 issue：


- [Update both `ProgressIndicator` for Material 3 redesign][]

  [更新 `ProgressIndicator` 以进行 Material 3 重新设计][Update both `ProgressIndicator` for Material 3 redesign]


Relevant PRs:

相关 PR：


- [Update Material 3 `LinearProgressIndicator` for new visual style][]

  [更新 Material 3 `LinearProgressIndicator` 以获取新的视觉样式][Update Material 3 `LinearProgressIndicator` for new visual style]

- [Update Material 3 `CircularProgressIndicator` for new visual style][]

  [更新 Material 3 `CircularProgressIndicator` 以获取新的视觉样式][Update Material 3 `CircularProgressIndicator` for new visual style]


[`LinearProgressIndicator`]: {{site.main-api}}/flutter/material/LinearProgressIndicator-class.html
[`CircularProgressIndicator`]: {{site.main-api}}/flutter/material/CircularProgressIndicator-class.html
[`LinearProgressIndicator.year2023`]: {{site.main-api}}/flutter/material/LinearProgressIndicator/year2023.html
[`CircularProgressIndicator.year2023`]: {{site.main-api}}/flutter/material/CircularProgressIndicator/year2023.html
[Update both `ProgressIndicator` for Material 3 redesign]: {{site.repo.flutter}}/issues/141340
[Update Material 3 `LinearProgressIndicator` for new visual style]: {{site.repo.flutter}}/pull/154817
[Update Material 3 `CircularProgressIndicator` for new visual style]: {{site.repo.flutter}}/pull/158104
