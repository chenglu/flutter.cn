---
# title: Deprecated API removed after v3.3
title: v3.3 后删除了已弃用的 API
# description: >
#   After reaching end of life, the following deprecated APIs
#   were removed from Flutter.
description: >-
  生命周期结束后，以下已弃用的 API 已从 Flutter 中删除。
ai-translated: true
---

## Summary

## 摘要


In accordance with Flutter's [Deprecation Policy][],
deprecated APIs that reached end of life after the
3.3 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 3.3 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-3-3

## Changes

## Changes


This section lists the deprecations, listed by the affected class.

本节列出了弃用的内容，按受影响的类列出。


### `RenderUnconstrainedBox`

### `RenderUnconstrainedBox`


Supported by Flutter Fix: no

由 Flutter 支持修复：无


`RenderUnconstrainedBox` was deprecated in v2.1.
Use `RenderConstraintsTransformBox` instead.

`RenderUnconstrainedBox` 在 v2.1 中已弃用。请使用 `RenderConstraintsTransformBox` 代替。


Where unconstrained in both axes, provide `ConstraintsTransformBox.unconstrained`
to `constraintsTransform`.

如果两个轴均不受约束，请将 `ConstraintsTransformBox.unconstrained` 提供给 `constraintsTransform`。


If `RenderUnconstrainedBox.constrainedAxis` was previously set,
replace respectively:

如果之前设置了`RenderUnconstrainedBox.constrainedAxis`，则分别替换：


- Where `constrainedAxis` was previously `Axis.horizontal`, set

  其中 `constrainedAxis` 以前是 `Axis.horizontal`，设置

  `constraintsTransform` to `ConstraintsTransformBox.widthUnconstrained`.

`constraintsTransform` 至 `ConstraintsTransformBox.widthUnconstrained`。

- Where `constrainedAxis` was previously `Axis.vertical`, set

  其中 `constrainedAxis` 以前是 `Axis.vertical`，设置

  `constraintsTransform` to `ConstraintsTransformBox.heightUnconstrained`.

`constraintsTransform` 至 `ConstraintsTransformBox.heightUnconstrained`。


This change allowed for the introduction of several more types of constraint
transformations through `ConstraintsTransformBox`. Other parameters of the old
API are compatible with the new API.

此更改允许通过 `ConstraintsTransformBox` 引入更多类型的约束转换。老API的其他参数与新API兼容。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
// Unconstrained
final RenderUnconstrainedBox unconstrained = RenderUnconstrainedBox(
  textDirection: TextDirection.ltr,
  child: RenderConstrainedBox(
    additionalConstraints: const BoxConstraints.tightFor(height: 200.0),
  ),
  alignment: Alignment.center,
);

// Constrained in horizontal axis
final RenderUnconstrainedBox unconstrained = RenderUnconstrainedBox(
  constrainedAxis: Axis.horizontal,
  textDirection: TextDirection.ltr,
  child: RenderConstrainedBox(
    additionalConstraints: const BoxConstraints.tightFor(width: 200.0, height: 200.0),
  ),
  alignment: Alignment.center,
);

// Constrained in vertical axis
final RenderUnconstrainedBox unconstrained = RenderUnconstrainedBox(
  constrainedAxis: Axis.vertical,
  textDirection: TextDirection.ltr,
  child: RenderFlex(
    direction: Axis.vertical,
    textDirection: TextDirection.ltr,
    children: <RenderBox>[flexible],
  ),
  alignment: Alignment.center,
);
```

Code after migration:

迁移后的代码：


```dart
// Unconstrained
final RenderConstraintsTransformBox unconstrained = RenderConstraintsTransformBox(
  constraintsTransform: ConstraintsTransformBox.unconstrained,
  textDirection: TextDirection.ltr,
  child: RenderConstrainedBox(
    additionalConstraints: const BoxConstraints.tightFor(height: 200.0),
  ),
  alignment: Alignment.center,
);

// Constrained in horizontal axis
final RenderConstraintsTransformBox unconstrained = RenderConstraintsTransformBox(
  constraintsTransform: ConstraintsTransformBox.widthUnconstrained,
  textDirection: TextDirection.ltr,
  child: RenderConstrainedBox(
    additionalConstraints: const BoxConstraints.tightFor(width: 200.0, height: 200.0),
  ),
  alignment: Alignment.center,
);

// Constrained in vertical axis
final RenderConstraintsTransformBox unconstrained = RenderConstraintsTransformBox(
  constraintsTransform: ConstraintsTransformBox.widthUnconstrained,
  textDirection: TextDirection.ltr,
  child: RenderFlex(
    direction: Axis.vertical,
    textDirection: TextDirection.ltr,
    children: <RenderBox>[flexible],
  ),
  alignment: Alignment.center,
);
```

**References**

**参考**


API documentation:

API 文档：


* [`RenderConstraintsTransformBox`][]
* [`ConstraintsTransformBox`][]

Relevant PRs:

相关 PR：


* Deprecated in [#78673][]

  已弃用于[#78673][]

* Removed in [#111711][]

  删除于[#111711][]


[`RenderConstraintsTransformBox`]: {{site.api}}/flutter/rendering/RenderConstraintsTransformBox-class.html
[`ConstraintsTransformBox`]: {{site.api}}/flutter/widgets/ConstraintsTransformBox-class.html
[#78673]: {{site.repo.flutter}}/pull/78673
[#111711]: {{site.repo.flutter}}/pull/111711

---

### `DragAnchor`, `Draggable.dragAnchor` & `LongPressDraggable.dragAnchor`

### `DragAnchor`、`Draggable.dragAnchor` 和 `LongPressDraggable.dragAnchor`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The enum `DragAnchor`, and its uses in `Draggable.dragAnchor` &
`LongPressDraggable.dragAnchor` were deprecated in v2.1.
Use `dragAnchorStrategy` instead.

枚举 `DragAnchor` 及其在 `Draggable.dragAnchor` 和 `LongPressDraggable.dragAnchor` 中的使用在 v2.1 中已弃用。请改用 `dragAnchorStrategy` 。


This change allowed for more accurate feedback of the draggable widget when used
in conjunction with other widgets like `Stack` and `InteractiveViewer`.

当与其他 widget（如 `Stack` 和 `InteractiveViewer`）结合使用时，此更改允许可拖动 widget 获得更准确的反馈。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
Draggable draggable = Draggable();
draggable = Draggable(dragAnchor: DragAnchor.child);
draggable = Draggable(dragAnchor: DragAnchor.pointer);

LongPressDraggable longPressDraggable = LongPressDraggable();
longPressDraggable = LongPressDraggable(dragAnchor: DragAnchor.child);
longPressDraggable = LongPressDraggable(dragAnchor: DragAnchor.pointer);
```

Code after migration:

迁移后的代码：


```dart
Draggable draggable = Draggable();
draggable = Draggable(dragAnchorStrategy: childDragAnchorStrategy);
draggable = Draggable(dragAnchorStrategy: pointerDragAnchorStrategy);

LongPressDraggable longPressDraggable = LongPressDraggable();
longPressDraggable = LongPressDraggable(dragAnchorStrategy: childDragAnchorStrategy);
longPressDraggable = LongPressDraggable(dragAnchorStrategy: pointerDragAnchorStrategy);
```

**References**

**参考**


API documentation:

API 文档：


* [`Draggable`][]
* [`LongPressDraggable`][]
* [`DragAnchorStrategy`][]

Relevant issues:

相关 issue：


* [#73143][]

  [#73143][#73143]


Relevant PRs:

相关 PR：


* Deprecated in [#79160][]

  已弃用于[#79160][]

* Removed in [#111713][]

  删除于[#111713][]


[`Draggable`]: {{site.api}}/flutter/widgets/Draggable-class.html
[`LongPressDraggable`]: {{site.api}}/flutter/widgets/LongPressDraggable-class.html
[`DragAnchorStrategy`]: {{site.api}}/flutter/widgets/DragAnchorStrategy.html
[#73143]: {{site.repo.flutter}}/pull/73143
[#79160]: {{site.repo.flutter}}/pull/79160
[#111713]: {{site.repo.flutter}}/pull/111713

---

### `ScrollBehavior.buildViewportChrome`

### `ScrollBehavior.buildViewportChrome`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The method `ScrollBehavior.buildViewportChrome` was deprecated in v2.1.

方法 `ScrollBehavior.buildViewportChrome` 在 v2.1 中已弃用。


This method was used by the `Scrollable` widget to apply an overscroll
indicator, like `GlowingOverscrollIndicator`, by default on the appropriate
platforms. As more default decorators have been added, like `Scrollbar`s, each
has instead been split into individual methods to replace `buildViewportChrome`.

默认情况下，`Scrollable` widget 使用此方法在适当的平台上应用过度滚动指示器，例如 `GlowingOverscrollIndicator`。随着更多默认装饰器的添加，例如 `Scrollbar`s，每个装饰器都被拆分为单独的方法来替换 `buildViewportChrome`。


This allows extending classes to only override the specific decorator, through
`buildScrollbar` or `buildOverscrollIndicator`, rather than needing to rewrite
code in order to maintain one or the other.

这允许扩展类仅通过 `buildScrollbar` 或 `buildOverscrollIndicator` 覆盖特定的装饰器，而不需要重写代码来维护其中之一。


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
final ScrollBehavior scrollBehavior = ScrollBehavior();
scrollBehavior.buildViewportChrome(context, child, axisDirection);
```

Code after migration:

迁移后的代码：


```dart
final ScrollBehavior scrollBehavior = ScrollBehavior();
scrollBehavior.buildOverscrollIndicator(context, child, axisDirection);
```

**References**

**参考**


Design document:

设计文档：


* [Exposing & Updating ScrollBehaviors][]

  [公开和更新滚动行为][Exposing & Updating ScrollBehaviors]


API documentation:

API 文档：


* [`ScrollBehavior`][]

Relevant issues:

相关 issue：


* [Scrollbars should be always visible and instantiated by default on web and desktop][]

  [默认情况下，滚动条在 Web 和桌面上应始终可见并实例化][Scrollbars should be always visible and instantiated by default on web and desktop]


Relevant PRs:

相关 PR：


* [#76739][]

  [#76739][#76739]

* Deprecated in [#78588][]

  已弃用于[#78588][]

* Removed in [#111715][]

  删除于[#111715][]


[In-depth migration guide available]: /release/breaking-changes/default-desktop-scrollbars
[Exposing & Updating ScrollBehaviors]: /go/exposing-scroll-behaviors
[`ScrollBehavior`]: {{site.api}}/flutter/widgets/ScrollBehavior-class.html
[Scrollbars should be always visible and instantiated by default on web and desktop]: {{site.repo.flutter}}/issues/40107
[#76739]: {{site.repo.flutter}}/pull/76739
[#78588]: {{site.repo.flutter}}/pull/78588
[#111715]: {{site.repo.flutter}}/pull/111715

---

## Timeline

## 时间线


In stable release: 3.7
稳定版本：3.7
