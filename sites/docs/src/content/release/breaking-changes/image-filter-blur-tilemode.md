---
# title: ImageFilter.blur default tile mode automatic selection.
title: ImageFilter.blur 默认 tile mode 自动选择。
# description: >-
#   If a tile mode wasn't specified in the constructor, ImageFilter.blur will
#   select one based on the rendering context.
description: >-
  如果构造函数中未指定 tile mode，ImageFilter.blur 将
  根据渲染上下文自动选择。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `ui.ImageFilter.blur`'s default tile mode is
now automatically selected by the backend.
Previously `TileMode.clamp` was used unless a different tile mode was specified.
Now, the default is `null` and specifies automatic selection unless
a specific tile mode is specified.

`ui.ImageFilter.blur` 的默认 tile mode 现在由后端自动选择。
此前除非指定其他 tile mode，否则使用 `TileMode.clamp`。
现在默认值为 `null`，表示自动选择，
除非指定了特定的 tile mode。

## Background

## 背景

`ImageFilter.blur`'s _tile mode_ specifies what happens to
edge pixels for the applied filter.
There are four options:

`ImageFilter.blur` 的 _tile mode_ 指定应用滤镜时边缘像素的处理方式。
共有四种选项：

- `TileMode.clamp` (the previous default)

  `TileMode.clamp`（先前的默认值）

- `Tilemode.repeated`

  `Tilemode.repeated`

- `TileMode.mirror`

  `TileMode.mirror`

- `TileMode.decal`

  `TileMode.decal`

Previously, if the behavior wasn't specified,
`ImageFilter` defaulted to `clamp` mode.
This sometimes surprised developers as it didn't always match expectations.

此前，如果未指定行为，`ImageFilter` 默认为 `clamp` 模式。
这有时会让开发者感到意外，因为它并不总是符合预期。

As of this change, the filter automatically selects the
following tile modes based on context:

自此变更起，滤镜会根据上下文自动选择以下 tile mode：

* `decal` with save layers and when applied to individual shape draws
          (such as with `drawRect` and `drawPath`).

  在 save layer 以及应用于单个形状绘制（如 `drawRect` 和 `drawPath`）时使用 `decal`。

* `mirror` with backdrop filters.

  在 backdrop filter 中使用 `mirror`。

* `clamp` for `drawImage`.

  在 `drawImage` 中使用 `clamp`。

## Migration guide

## 迁移指南

Only blur image filters that don't specify an explicit tile mode are
impacted by this change.

仅未指定显式 tile mode 的模糊图像滤镜会受此变更影响。

We believe that the new defaults are generally
better and would recommend removing any specified blur tile modes.

我们认为新默认值通常更好，建议移除任何已指定的模糊 tile mode。

Code before migration:

迁移前的代码：

```dart
final filter = ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4, tileMode: TileMode.decal);
```

Code after migration:

迁移后的代码：

```dart
final filter = ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4);
```

## Timeline

## 时间线

Landed in version: 3.28.0-0.1.pre<br>
In stable release: 3.29

合入版本：3.28.0-0.1.pre<br>
稳定版发布：3.29

## References

## 参考资料

API documentation:

API 文档：

* [`ImageFilter`][]
* [`TileMode`][]

Relevant issues:

相关 issue：

* [Issue #154935][]
* [Issue #110318][]
* [Issue #157693][]

Relevant PRs:

相关 PR：

* [Change default TileMode for blur ImageFilter objects to null][]

  [将模糊 ImageFilter 对象的默认 TileMode 更改为 null][Change default TileMode for blur ImageFilter objects to null]

[`ImageFilter`]: {{site.api}}/flutter/dart-ui/ImageFilter-class.html
[`ImageFilter.blur`]: {{site.api}}/flutter/dart-ui/ImageFilter/ImageFilter.blur.html
[`TileMode`]: {{site.api}}/flutter/dart-ui/TileMode.html
[Issue #154935]: {{site.repo.flutter}}/issues/154935
[Issue #110318]: {{site.repo.flutter}}/issues/110318
[Issue #157693]: {{site.repo.flutter}}/issues/157693
[Change default TileMode for blur ImageFilter objects to null]: {{site.repo.engine}}/pull/55552
