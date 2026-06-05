---
# title: Changing RawMenuAnchor close order
title: 更改 RawMenuAnchor 关闭顺序
# description: >-
#   Closing a `RawMenuAnchor` now triggers
#   `onClose` and `onCloseRequested` callbacks for all
#   descendant `RawMenuAnchor`s in a coordinated sequence.
description: >
  现在，关闭“RawMenuAnchor”会按协调顺序触发所有后代“RawMenuAnchor”的“onClose”和“onCloseRequested”回调。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Closing a `RawMenuAnchor` now triggers the `onCloseRequested`
and `onClose` callbacks for all descendant `RawMenuAnchor`s.
The `onCloseRequested` callback is triggered top-down,
starting from the triggering `RawMenuAnchor` and moving to its descendants,
while the `onClose` callback is triggered bottom-up.
If a `RawMenuAnchor` is already closed,
calls to `MenuController.close` and `MenuController.closeChildren`
don't trigger the `onCloseRequested` callback.

现在，关闭“RawMenuAnchor”会触发所有后代“RawMenuAnchor”的“onCloseRequested”和“onClose”回调。 `onCloseRequested` 回调是自上而下触发的，从触发 `RawMenuAnchor` 开始并移动到其后代，而 `onClose` 回调是自下而上触发的。如果“RawMenuAnchor”已经关闭，则调用“MenuController.close”和“MenuController.closeChildren”不会触发“onCloseRequested”回调。


## Background

## 背景


`RawMenuAnchor` is a low-level widget used to build custom menu systems.
Previously, a `RawMenuAnchor` didn't automatically
notify its descendants when it was closed.
You had to manually call `controller.closeChildren()`
within the `onCloseRequested` callback
to close descendant `RawMenuAnchor`s.

`RawMenuAnchor` 是一个用于构建自定义菜单系统的低级 widget。以前，“RawMenuAnchor”在关闭时不会自动通知其后代。你必须在“onCloseRequested”回调中手动调用“controller.closeChildren()”来关闭后代“RawMenuAnchor”。


Furthermore, the `onClose` callback timing was inconsistent.
A parent `RawMenuAnchor`'s `onClose` could be executed
before its descendants had finished closing.

此外，“onClose”回调时间不一致。父级“RawMenuAnchor”的“onClose”可以在其后代完成关闭之前执行。


The updated behavior ensures that when a parent `RawMenuAnchor` begins to close,
it subsequently triggers `onCloseRequested` for all of its
descendant `RawMenuAnchor`s in a top-down manner.

更新的行为确保当父“RawMenuAnchor”开始关闭时，它随后以自上而下的方式触发其所有后代“RawMenuAnchor”的“onCloseRequested”。


When `hideOverlay` is called from within `onCloseRequested` to close the menu,
all descendant `RawMenuAnchor`s have their `onClose` callbacks
executed in a bottom-up order.
This means that the most recently opened `RawMenuAnchor`
now has its `onClose` callback executed first,
followed by its parent, and so on up the hierarchy.

当从“onCloseRequested”中调用“hideOverlay”来关闭菜单时，所有后代“RawMenuAnchor”都会以自下而上的顺序执行其“onClose”回调。这意味着最近打开的“RawMenuAnchor”现在首先执行其“onClose”回调，然后是其父级回调，依此类推。


This design allows for a coordinated closing sequence
where child `RawMenuAnchor`s can perform any necessary cleanup
before their parents finalize the closing process.

这种设计允许协调的关闭顺序，子“RawMenuAnchor”可以在其父母完成关闭过程之前执行任何必要的清理。


Finally, if a `RawMenuAnchor` is already closed,
calls to `MenuController.close` and `MenuController.closeChildren`
don't trigger the `onCloseRequested` callback,
preventing unnecessary callback executions.

最后，如果“RawMenuAnchor”已经关闭，则调用“MenuController.close”和“MenuController.closeChildren”不会触发“onCloseRequested”回调，从而防止不必要的回调执行。


## Migration guide

## 迁移指南


If your code does not override the default implementation of
`RawMenuAnchor.onCloseRequested` or your `RawMenuAnchor`
does not contain submenus, no changes are required.

如果你的代码未覆盖 `RawMenuAnchor.onCloseRequested` 的默认实现，或者你的 `RawMenuAnchor` 不包含子菜单，则无需进行任何更改。


If you have a custom implementation of `onCloseRequested`
in a `RawMenuAnchor` containing submenus,
`controller.closeChildren()` is now called automatically
when the parent menu closes.
Make sure that your implementation of `onCloseRequested`
still behaves correctly with this automatic call.
Immediate calls to `controller.closeChildren()` within your
`onCloseRequested` callback are no longer necessary.
Remove those calls.

如果你在包含子菜单的“RawMenuAnchor”中自定义了“onCloseRequested”实现，则现在当父菜单关闭时会自动调用“controller.closeChildren()”。确保你的“onCloseRequested”实现在此自动调用中仍然正常运行。不再需要在“onCloseRequested”回调中立即调用“controller.closeChildren()”。删除这些调用。


Additionally, if your logic relied on the
parent's `onClose` callback firing before its descendants,
refactor your code to account for the new bottom-up execution order.

此外，如果你的逻辑依赖于父级的“onClose”回调在其后代之前触发，请重构你的代码以考虑新的自下而上的执行顺序。


Code before migration:

迁移前的代码：


```dart
RawMenuAnchor(
  controller: menuController,
  onCloseRequested: (hideOverlay) {
    if (!animationController.isForwardOrCompleted) {
      return;
    }

    // Descendant submenus must be closed before the parent menu.
    // This is now handled automatically, so this call is no longer necessary.
    menuController.closeChildren();
    animationController.reverse().whenComplete(hideOverlay);
  },
  onClose: () {
    // This might have executed before descendants called onClose().
    _handleMenuClosed();
  },
  // ...
)
```

Code after migration:

迁移后的代码：


```dart
RawMenuAnchor(
  controller: menuController,
  onCloseRequested: (hideOverlay) {
    if (!animationController.isForwardOrCompleted) {
      return;
    }

    // `menuController.closeChildren()` is now called automatically.
    animationController.reverse().whenComplete(hideOverlay);
  },
  onClose: () {
    // This now executes only after all descendant submenus have
    // called `onClose()`.
    _handleMenuClosed();
  },
  // ...
)
```

:::important
This migration is not supported by `dart fix`
`dart fix` 不支持此迁移

:::

## Timeline

## 时间轴


Landed in version: 3.44.0-0.1.pre<br>
In stable release: 3.44

登陆版本：3.44.0-0.1.pre<br> 稳定版本：3.44


## References

## 参考


API documentation:

API 文档：


* [`RawMenuAnchor`][]

  [`RawMenuAnchor`][]

* [`RawMenuAnchor.onCloseRequested`][]

  [`RawMenuAnchor.onCloseRequested`][]


Relevant issues:

相关问题：


* [[widgets/raw_menu_anchor.dart] onClose should be called by descendant menus before parent][issue-182355]

  [[widgets/raw_menu_anchor.dart] onClose 应该由子菜单在父菜单之前调用][issue-182355]


Relevant PRs:

相关 PR：


* [[widgets/raw_menu_anchor.dart] Always onClose and onCloseRequested on descendants before parent.][pr-182357]

  [[widgets/raw_menu_anchor.dart] 始终在父级之前的后代上 onClose 和 onCloseRequested。][pr-182357]


[`RawMenuAnchor`]: {{site.api}}/flutter/widgets/RawMenuAnchor-class.html
[`RawMenuAnchor.onCloseRequested`]: {{site.api}}/flutter/widgets/RawMenuAnchor/onCloseRequested.html
[issue-182355]: {{site.repo.flutter}}/issues/182355
[pr-182357]: {{site.repo.flutter}}/pull/182357
