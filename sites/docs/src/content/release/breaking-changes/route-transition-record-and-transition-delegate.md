---
# title: Route transition record and transition delegate updates
title: 路由转换记录和转换委托更新
# description: >
#   Changes to the rule on how transition delegate resolve route transition.
description: >
  更改了有关转换委托如何解决路由转换的规则。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


A new boolean getter `isWaitingForExitingDecision` was added
to the route transition record and the `isEntering` getter
was renamed to `isWaitingForEnteringDecision`.
In the `resolve()` method for the transition delegate,
use the `isWaitingForExitingDecision` to check if an exiting
route actually needs an explicit decision on how to transition
off the screen. If you try to make a decision for an existing route
that _isn't_ waiting for a decision, Flutter throws an assertion error.

新的布尔 getter“isWaitingForExitingDecision”已添加到路由转换记录中，并且“isEntering”getter 已重命名为“isWaitingForEnteringDecision”。在转换委托的“resolve()”方法中，使用“isWaitingForExitingDecision”来检查退出路由是否确实需要关于如何转换离开屏幕的显式决策。如果你尝试对不等待决策的现有路由做出决策，Flutter 会抛出断言错误。


## Context

## 背景


When the navigator receives a new list of pages, it tries to update its
current routes stack to match the list. However, it requires explicit
decisions on how to transition the route on and off the screen.
Previously, routes that were not in the new list required decisions
on how to transition off the screen. However, we later found out
this is not always true. If a route is popped,
but is still waiting for the popping animation to finish,
this route would sit in the navigator routes stack until
the animation was done. If a page update occurred during this time,
this route exits but doesn't require a decision
on how to transition off the screen. Therefore,
`isWaitingForExitingDecision` was added to cover that case.

当导航器收到新的页面列表时，它会尝试更新其当前的路由堆栈以匹配该列表。然而，它需要明确决定如何在屏幕上和屏幕外转换路线。以前，不在新列表中的路线需要决定如何过渡到屏幕之外。然而，我们后来发现这并不总是正确的。如果弹出一条路线，但仍在等待弹出动画完成，则该路线将位于导航器路线堆栈中，直到动画完成。如果在此期间发生页面更新，则该路由将退出，但不需要决定如何转换出屏幕。因此，添加了“isWaitingForExitingDecision”来涵盖这种情况。


The `isEntering` getter is also renamed to
`isWaitingForEnteringDecision` to be more descriptive,
and also to make the naming more consistent.

`isEntering` getter 也被重命名为 `isWaitingForEnteringDecision` 以更具描述性，也使命名更加一致。


## Migration guide

## 迁移指南


If you implement your own transition delegate, you need to check the
exiting routes using the getter `isWaitingForExitingDecision` before you
call `markForPop`, `markForComplete`, or `markForRemove` on them.
You also need to rename all the references from `isEntering` to
`isWaitingForEnteringDecision`.

如果你实现自己的转换委托，则需要在调用“markForPop”、“markForComplete”或“markForRemove”之前使用 getter“isWaitingForExitingDecision”检查现有路由。你还需要将所有引用从“isEntering”重命名为“isWaitingForEnteringDecision”。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/widgets.dart';

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    List<RouteTransitionRecord> newPageRouteHistory,
    Map<RouteTransitionRecord, RouteTransitionRecord> locationToExitingPageRoute,
    Map<RouteTransitionRecord, List<RouteTransitionRecord>> pageRouteToPagelessRoutes,
  }) {
    final List<RouteTransitionRecord> results = <RouteTransitionRecord>[];

    for (final RouteTransitionRecord pageRoute in newPageRouteHistory) {
      if (pageRoute.isEntering) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);

    }
    for (final RouteTransitionRecord exitingPageRoute in locationToExitingPageRoute.values) {
      exitingPageRoute.markForRemove();
      final List<RouteTransitionRecord> pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
      if (pagelessRoutes != null) {
        for (final RouteTransitionRecord pagelessRoute in pagelessRoutes) {
          pagelessRoute.markForRemove();
        }
      }
      results.add(exitingPageRoute);

    }
    return results;
  }
}
```

Code after migration:

迁移后的代码：


```dart
import 'package:flutter/widgets.dart';

class NoAnimationTransitionDelegate extends TransitionDelegate<void> {
  @override
  Iterable<RouteTransitionRecord> resolve({
    List<RouteTransitionRecord> newPageRouteHistory,
    Map<RouteTransitionRecord, RouteTransitionRecord> locationToExitingPageRoute,
    Map<RouteTransitionRecord, List<RouteTransitionRecord>> pageRouteToPagelessRoutes,
  }) {
    final List<RouteTransitionRecord> results = <RouteTransitionRecord>[];

    for (final RouteTransitionRecord pageRoute in newPageRouteHistory) {
      // Renames isEntering to isWaitingForEnteringDecision.
      if (pageRoute.isWaitingForEnteringDecision) {
        pageRoute.markForAdd();
      }
      results.add(pageRoute);

    }
    for (final RouteTransitionRecord exitingPageRoute in locationToExitingPageRoute.values) {
      // Checks the isWaitingForExitingDecision before calling the markFor methods.
      if (exitingPageRoute.isWaitingForExitingDecision) {
        exitingPageRoute.markForRemove();
        final List<RouteTransitionRecord> pagelessRoutes = pageRouteToPagelessRoutes[exitingPageRoute];
        if (pagelessRoutes != null) {
          for (final RouteTransitionRecord pagelessRoute in pagelessRoutes) {
            pagelessRoute.markForRemove();
          }
        }
      }
      results.add(exitingPageRoute);

    }
    return results;
  }
}
```

## Timeline

## 时间轴


Landed in version: 1.18.0<br>
In stable release: 1.20

登陆版本：1.18.0<br>稳定版本：1.20


## References

## 参考


API documentation:

API 文档：


* [`Navigator`][]


* [`TransitionDelegate`][]

  [`TransitionDelegate`][]

* [`RouteTransitionRecord`][]


Relevant issue:

相关问题：


* [Issue 45938: Navigator 2.0][]

  [问题 45938：导航器 2.0][Issue 45938: Navigator 2.0]


Relevant PR:

相关公关：


* [PR 55998][]: Fixes the navigator pages update crash

  [PR 55998][]：修复了导航器页面更新崩溃问题

when there is still a route waiting

当仍有路线等待时


[Issue 45938: Navigator 2.0]: {{site.repo.flutter}}/issues/45938
[`Navigator`]: {{site.api}}/flutter/widgets/Navigator-class.html
[PR 55998]: {{site.repo.flutter}}/pull/55998
[`TransitionDelegate`]: {{site.api}}/flutter/widgets/TransitionDelegate-class.html
[`RouteTransitionRecord`]: {{site.api}}/flutter/widgets/RouteTransitionRecord-class.html
