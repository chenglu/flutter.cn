---
# title: When a route is removed from the stack, associated futures must complete
title: 当路由从堆栈中移除时，关联的 Future 必须完成
# description: >
#   Before this breaking change, routes created by Navigator and awaited for
#   results could never complete if the route was removed instead of popped.
description: >
  在此破坏性变更之前，由 Navigator 创建并等待结果的路由，如果是被移除而非弹出，则关联的 Future 永远无法完成。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

When routes are pushed, developers can await them to be notified when they are
popped. However, this didn't work when they were removed because the associated
future was never completed.

推送路由时，开发者可以 await 它们以在弹出时收到通知。然而，当路由被移除时这不起作用，因为关联的 Future 从未完成。

## Context

## 背景

All Navigator methods that call `remove` had this issue. By using `complete`,
the issue is properly resolved, allowing developers to pass a result.

所有调用 `remove` 的 Navigator 方法都存在此问题。通过使用 `complete`，该问题得到了妥善解决，让开发者可以传递结果。

## Description of change

## 变更说明

All Navigator methods have been updated to no longer call `remove` but instead
use `complete`. Context menus are now built from the `contextMenuBuilder`
parameter.

所有 Navigator 方法已更新，不再调用 `remove`，而是使用 `complete`。上下文菜单现在通过 `contextMenuBuilder` 参数构建。

All methods that directly use `complete` now accept an optional `result`
parameter to return it to the associated future. Other methods that indirectly
use `remove` currently return `null`. In the future, we might extend these
methods with an optional callback function to allow developers to handle pop
logic in indirect scenarios (such as `removeUntil`).

所有直接使用 `complete` 的方法现在都接受可选的 `result` 参数，以将其返回给关联的 Future。其他间接使用 `remove` 的方法目前返回 `null`。未来，我们可能会为这些方法扩展可选的回调函数，让开发者在间接场景（例如 `removeUntil`）中处理弹出逻辑。

Before this PR, the methods below can't return a result:

在此 PR 之前，以下方法无法返回结果：

```dart
Navigator.of(context).removeRoute(route);
Navigator.of(context).removeRouteBelow(route);
```

After this PR, methods can return a result:

在此 PR 之后，这些方法可以返回结果：

```dart
Navigator.of(context).removeRoute(route, result);
Navigator.of(context).removeRouteBelow(route, result);
```

## Migration guide

## 迁移指南

If you implemented `RouteTransitionRecord` and used `markForRemove`,
you need to use `markForComplete` instead. `markForRemove` is now deprecated.

如果你实现了 `RouteTransitionRecord` 并使用了 `markForRemove`，你需要改用 `markForComplete`。`markForRemove` 现已弃用。

For other developers, no changes are required. The navigator continues to work
as expected with new capabilities.

对于其他开发者，无需进行任何更改。Navigator 继续按预期工作，并具备新功能。

## Timeline

## 时间线

Landed in version: 3.31.0-0.0.pre<br>
In stable release: 3.32

合入版本：3.31.0-0.0.pre<br>
稳定版发布：3.32

## References

## 参考资料

### API documentation:

### API 文档：

* [`RouteTransitionRecord`]({{site.api}}/flutter/widgets/RouteTransitionRecord-class.html)
* [`Navigator`]({{site.api}}/flutter/widgets/Navigator-class.html)

### Relevant issues:

### 相关问题：

* [removeRoute unresolved future]({{site.repo.flutter}}/issues/157505)

### Relevant PRs:

### 相关 PR：

* [feat: removeRoute now calls didComplete]({{site.repo.flutter}}/pull/157725)
