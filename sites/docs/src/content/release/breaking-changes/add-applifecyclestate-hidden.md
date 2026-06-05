---
# title: Migration guide for adding AppLifecycleState.hidden
title: 添加 AppLifecycleState.hidden 的迁移指南
# description: AppLifecycleState had an additional hidden state added.
description: AppLifecycleState 添加了一个额外的隐藏状态。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


A new `hidden` state was added to the [`AppLifecycleState`][] enum to denote
when the application is not visible.

新的 `hidden` 状态已添加到[`AppLifecycleState`][]枚举来表示应用程序何时不可见。


## Context

## 背景


The `AppLifecycleState` enum is used to indicate which lifecycle state the
application is in when [`WidgetsBindingObserver.didChangeAppLifecycleState`][]
is called.

`AppLifecycleState` 枚举用于指示应用程序处于哪种生命周期状态[`WidgetsBindingObserver.didChangeAppLifecycleState`][]被称为。


## Description of change

## 变更说明


The new state `AppLifecycleState.hidden` was added to the `AppLifecycleState`
enum in the `dart:ui` package.

新状态 `AppLifecycleState.hidden` 已添加到 `dart:ui` 包中的 `AppLifecycleState` 枚举中。


The `hidden` state is entered when all of the application views are no longer
visible to the user. On Android and iOS, this state is entered briefly whenever
the state machine traverses from inactive to paused, or from paused to inactive.
It doesn't change when paused or inactive are entered. On other platforms, it
will be in this state while the application is not visible.

当所有应用程序视图不再对用户可见时，将进入 `hidden` 状态。在 Android 和 iOS 上，只要状态机从非活动状态转变为暂停状态，或从暂停状态转变为非活动状态，就会短暂进入此状态。当进入暂停或非活动状态时它不会改变。在其他平台上，当应用程序不可见时，它将处于此状态。


## Migration guide

## 迁移指南


If code has switch statements that handle all cases of the `AppLifecycleState`
enum, a new case will need to be added to handle the `AppLifecycleState.hidden`
state.

如果代码具有处理 `AppLifecycleState` 枚举的所有情况的 switch 语句，则需要添加一个新情况来处理 `AppLifecycleState.hidden` 状态。


Code before migration:

迁移前的代码：


```dart
void didChangeAppLifecycleState(AppLifecycleState state) {
  switch (state) {
    case AppLifecycleState.resumed:
    case AppLifecycleState.inactive:
      // Do something when the app is visible...
      break;
    case AppLifecycleState.paused:
    case AppLifecycleState.detached:
      // Do something when the app is not visible...
      break;
  }
}
```

Code after migration:

迁移后的代码：


```dart
void didChangeAppLifecycleState(AppLifecycleState state) {
  switch (state) {
    case AppLifecycleState.resumed:
    case AppLifecycleState.inactive:
      // Do something when the app is visible...
      break;
    case AppLifecycleState.hidden:  // <-- This is the new state.
    case AppLifecycleState.paused:
    case AppLifecycleState.detached:
      // Do something when the app is not visible...
      break;
  }
}
```

If there is already a `default:` case in the switch statement, or the code uses
conditionals instead, then the code will compile without changes, but the
default case or conditional will still need to be evaluated to decide if the
`hidden` state should also be handled.

如果 switch 语句中已经存在 `default:` 情况，或者代码使用条件，则代码将在不进行任何更改的情况下进行编译，但仍需要评估默认情况或条件来决定是否也应处理 `hidden` 状态。


## Timeline

## 时间线


Landed in version: 3.11.0-16.0.pre<br>
登陆版本：3.11.0-16.0.pre
In stable release: 3.13.0
稳定版本：3.13.0

## References

## 参考资料


Relevant PRs:

相关 PR：


* [PR 42418][]: Adds `AppLifecycleState.hidden` enum value

  [PR 42418][]：添加 `AppLifecycleState.hidden` 枚举值


[PR 42418]: {{site.repo.engine}}/pull/42418
[`WidgetsBindingObserver.didChangeAppLifecycleState`]: {{site.api}}/flutter/widgets/WidgetsBindingObserver/didChangeAppLifecycleState.html
[`AppLifecycleState`]: {{site.api}}/flutter/dart-ui/AppLifecycleState.html
