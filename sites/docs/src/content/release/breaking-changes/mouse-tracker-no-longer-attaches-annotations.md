---
# title: MouseTracker no longer attaches annotations
title: MouseTracker 不再附加注释
# description: >
#   MouseTracker no longer relies on annotation attachment to
#   perform the mounted-exit check; therefore,
#   all three related methods are removed.
description: >
  MouseTracker 不再依赖注释附件来执行安装退出检查；因此，所有三个相关方法都被删除。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Removed `MouseTracker`'s methods `attachAnnotation`,
`detachAnnotation`, and `isAnnotationAttached`.

删除了“MouseTracker”的方法“attachAnnotation”、“detachAnnotation”和“isAnnotationAttached”。


## Context

## 背景


Mouse events, such as when a mouse pointer has entered a region,
exited, or is hovering over a region, are detected with the help of
`MouseTrackerAnnotation`s that are placed on interested regions
during the render phase. Upon each update (a new frame or a new event),
`MouseTracker` compares the annotations hovered by the mouse
pointer before and after the update, then dispatches
callbacks accordingly.

鼠标事件，例如鼠标指针进入某个区域、退出或悬停在某个区域上时，可以在渲染阶段放置在感兴趣区域上的“MouseTrackerAnnotation”的帮助下进行检测。每次更新（新帧或新事件）时，“MouseTracker”都会比较更新前后鼠标指针悬停的注释，然后相应地调度回调。


The `MouseTracker` class, which manages the state of mouse pointers,
used to require `MouseRegion` to attach annotations when mounted,
and detach annotations when unmounted.
This was used by `MouseTracker` to perform the
_mounted-exit check_ (for example, `MouseRegion.onExit`
must not be called if the exit was caused by the unmounting
of the widget), in order to prevent calling `setState`
of an unmounted widget and throwing exceptions (explained
in detail in [Issue #44631][]).

管理鼠标指针状态的“MouseTracker”类过去需要“MouseRegion”在安装时附加注释，并在卸载时分离注释。 `MouseTracker` 使用它来执行_挂载退出检查_（例如，如果退出是由卸载 widget 引起的，则不得调用 `MouseRegion.onExit`），以防止调用已卸载 widget 的 `setState` 并引发异常（在 [Issue #44631][] 中详细说明）。


This mechanism has been replaced by making `MouseRegion`
a stateful widget, so that it can perform the mounted-exit
check by itself by blocking the callback when unmounted.
Therefore, these methods have been removed, and `MouseTracker`
no longer tracks all annotations on the screen.

此机制已被使“MouseRegion”成为有状态 widget 所取代，以便它可以通过在卸载时阻止回调来自行执行安装退出检查。因此，这些方法已被删除，“MouseTracker”不再跟踪屏幕上的所有注释。


## Description of change

## 变更说明


The `MouseTracker` class has removed three methods related
to attaching annotations:

`MouseTracker` 类删除了三个与附加注释相关的方法：


```dart diff
  class MouseTracker extends ChangeNotifier {
    // ...
-   void attachAnnotation(MouseTrackerAnnotation annotation) {/* ... */}

-   void detachAnnotation(MouseTrackerAnnotation annotation) {/* ... */}

-   @visibleForTesting
-   bool isAnnotationAttached(MouseTrackerAnnotation annotation) {/* ... */}
  }
```

`RenderMouseRegion` and `MouseTrackerAnnotation` no longer perform the
mounted-exit check, while `MouseRegion` still does.

`RenderMouseRegion` 和 `MouseTrackerAnnotation` 不再执行安装退出检查，而 `MouseRegion` 仍然执行。


## Migration guide

## 迁移指南


Calls to `MouseTracker.attachAnnotation` and
`detachAnnotation` should be removed with little to no impact:

对 `MouseTracker.attachAnnotation` 和 `detachAnnotation` 的调用应该被删除，几乎没有影响：


* Uses of `MouseRegion` should not be affected at all.

  `MouseRegion` 的使用根本不应该受到影响。

* If your code directly uses `RenderMouseRegion` or

  如果你的代码直接使用 `RenderMouseRegion` 或

`MouseTrackerAnnotation`, be aware that `onExit`
is now called when the exit is caused by events that used
to call `MouseTracker.detachAnnotation`.
This should not be a problem if no states are involved,
otherwise you might want to add the mounted-exit check,
especially if the callback is leaked so that outer
widgets might call `setState` in it. For example:

`MouseTrackerAnnotation`，请注意，当退出是由过去调用 `MouseTracker.detachAnnotation` 的事件引起时，现在会调用 `onExit`。如果不涉及任何状态，这应该不是问题，否则你可能需要添加安装退出检查，特别是如果回调被泄漏，以便外部 widget 可能会调用其中的“setState”。例如：


Code before migration:

迁移前的代码：


```dart
class MyMouseRegion extends SingleChildRenderObjectWidget {
  const MyMouseRegion({this.onHoverChange});

  final ValueChanged<bool> onHoverChange;

  @override
  RenderMouseRegion createRenderObject(BuildContext context) {
    return RenderMouseRegion(
      onEnter: (_) { onHoverChange(true); },
      onExit: (_) { onHoverChange(false); },
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderMouseRegion renderObject) {
    renderObject
      ..onEnter = (_) { onHoverChange(true); }
      ..onExit = (_) { onHoverChange(false); };
  }
}
```

Code after migration:

迁移后的代码：


```dart
class MyMouseRegion extends SingleChildRenderObjectWidget {
  const MyMouseRegion({this.onHoverChange});

  final ValueChanged<bool> onHoverChange;

  @override
  RenderMouseRegion createRenderObject(BuildContext context) {
    return RenderMouseRegion(
      onEnter: (_) { onHoverChange(true); },
      onExit: (_) { onHoverChange(false); },
    );
  }

  @override
  void updateRenderObject(BuildContext context, RenderMouseRegion renderObject) {
    renderObject
      ..onEnter = (_) { onHoverChange(true); }
      ..onExit = (_) { onHoverChange(false); };
  }

  @override
  void didUnmountRenderObject(RenderMouseRegion renderObject) {
    renderObject
      ..onExit = onHoverChange == null ? null : (_) {};
  }
}
```

Calls to `MouseTracker.isAnnotationAttached` must be removed.
This feature is no longer technically possible,
since annotations are no longer tracked.
If you somehow need this feature, please submit an issue.

必须删除对“MouseTracker.isAnnotationAttached”的调用。此功能在技术上不再可行，因为不再跟踪注释。如果你需要此功能，请提交问题。


## Timeline

## 时间轴


Landed in version: 1.15.4<br>
In stable release: 1.17

登陆版本：1.15.4<br>稳定版本：1.17


## References

## 参考


API documentation:

API 文档：


* [`MouseRegion`][]


* [`MouseTracker`][]


* [`MouseTrackerAnnotation`][]

  [`MouseTrackerAnnotation`][]

* [`RenderMouseRegion`][]


Relevant PRs:

相关 PR：


* [MouseTracker no longer requires annotations attached][],

  [MouseTracker 不再需要附加注释][`MouseTracker`]，

which made the change

这带来了改变

* [Improve MouseTracker lifecycle: Move checks to post-frame][],

  [改善 MouseTracker 生命周期：将检查移至后帧][`MouseTracker`]，

which first introduced the mounted-exit change,
explained at _The change to onExit_.

它首先引入了 Mounted-Exit 更改，在 _The Change to onExit_ 中进行了解释。


[Improve MouseTracker lifecycle: Move checks to post-frame]: {{site.repo.flutter}}/issues/44631
[Issue #44631]: {{site.repo.flutter}}/pull/44631
[`MouseRegion`]: {{site.api}}/flutter/widgets/MouseRegion-class.html
[`MouseTracker`]: {{site.api}}/flutter/gestures/MouseTracker-class.html
[MouseTracker no longer requires annotations attached]: {{site.repo.flutter}}/issues/48453
[`MouseTrackerAnnotation`]: {{site.api}}/flutter/gestures/MouseTrackerAnnotation-class.html
[`RenderMouseRegion`]: {{site.api}}/flutter/rendering/RenderMouseRegion-class.html
