---
# title: ListTile reports an error in debug when wrapped in a colored widget
title: ListTile 被有色 widget 包裹时在 debug 模式下报告错误
# description: >-
#   ListTile now reports an error in debug mode when it is wrapped in
#   an intermediate widget with a non-transparent background color.
description: >-
  当 ListTile 被具有非透明背景色的中间 widget 包裹时，
  现在会在 debug 模式下报告错误。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

When a widget with a non-transparent background color,
such as a `Container` or `ColoredBox` that sets `color`,
sits between a `ListTile` and its nearest `Material` ancestor,
the framework now reports an error.

当具有非透明背景色的 widget（例如设置了 `color` 的 `Container` 或 `ColoredBox`）
位于 `ListTile` 与其最近的 `Material` 祖先之间时，
框架现在会报告错误。

## Background

## 背景

`ListTile` paints its background color and ink splashes
on the nearest `Material` ancestor.
When a widget with an opaque background color is
placed between the `ListTile` and its `Material` ancestor,
it obscures these visual effects,
making them invisible to the user.

`ListTile` 在其最近的 `Material` 祖先上绘制背景色和墨水飞溅效果。
当不透明背景色的 widget 位于 `ListTile` 与其 `Material` 祖先之间时，
会遮挡这些视觉效果，使用户无法看到。

To prevent you from accidentally introducing this bug and
wondering why the background or ink splash effects on
the `ListTile` aren't displaying,
the framework now reports an assertion error during development.

为防止你意外引入此 bug 并疑惑 `ListTile` 的背景或墨水飞溅效果为何不显示，
框架现在会在开发期间报告断言错误。

If your code has an intermediate colored widget
between a `ListTile` and a `Material` widget,
you will now see an error similar to this:

如果你的代码在 `ListTile` 和 `Material` widget 之间有中间有色 widget，
现在会看到类似以下的错误：

```text
ListTile background color or ink splashes may be invisible.
The ListTile is wrapped in a Container that has a background color.
Because ListTile paints its background and ink splashes on
the nearest Material ancestor, this Container will hide those effects.
To fix this, wrap the ListTile in its own Material widget, or
remove the background color from the intermediate Container.
```

## Migration guide

## 迁移指南

To fix the error,
remove the background color from the intermediate widget or
wrap the `ListTile` in its own `Material` widget.

要修复此错误，
请从中间 widget 移除背景色，
或将 `ListTile` 包裹在其自身的 `Material` widget 中。

Code before migration:

迁移前的代码：

```dart
// The colored Container hides the ink splashes from the ListTile.
Material(
  child: Container(
    color: Colors.pink,
    child: ListTile(
      title: const Text('Title'),
      onTap: () {},
    ),
  ),
)
```

Code after migration:

迁移后的代码：

```dart
// Use a Material widget directly for the background color.
Material(
  color: Colors.pink,
  child: Container(
    child: ListTile(
      title: const Text('Title'),
      onTap: () {},
    ),
  ),
)
```

Alternatively,
wrap the `ListTile` in its own `Material` widget:

或者，将 `ListTile` 包裹在其自身的 `Material` widget 中：

```dart
Container(
  color: Colors.blue,
  child: Material(
    type: MaterialType.transparency,
    child: ListTile(
      title: const Text('Title'),
      onTap: () {},
    ),
  ),
)
```

## Timeline

## 时间线

Landed in version: 3.43.0-0.1.pre<br>
In stable release: 3.44

合入版本：3.43.0-0.1.pre<br>
稳定版发布：3.44

## References

## 参考资料

API documentation:

API 文档：

* [`ListTile`][]
* [`Material`][]

Relevant issues:

相关 issue：

* [`ListTile.selectedTileColor` not visible when parent `Container` has explicit background color][issue-174366]

  当父 `Container` 有显式背景色时 `ListTile.selectedTileColor` 不可见

Relevant PRs:

相关 PR：

* [Add warning when there is a widget with color between `Material` and `ListTile`][pr-181402]

  当 `Material` 和 `ListTile` 之间有带颜色的 widget 时添加警告

[`ListTile`]: {{site.api}}/flutter/material/ListTile-class.html
[`Material`]: {{site.api}}/flutter/material/Material-class.html
[issue-174366]: {{site.repo.flutter}}/issues/174366
[pr-181402]: {{site.repo.flutter}}/pull/181402
