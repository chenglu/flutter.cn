---
# title: Route and Navigator Refactoring
title: 路线和导航器重构
# description: >
#   Some APIs and function signatures of the
#   Route and Navigator classes have changed.
description: >
  Route 和 Navigator 类的一些 API 和函数签名已更改。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The `Route` class no longer manages its overlay entries in overlay,
and its `install()` method no longer has an `insertionPoint` parameter.
The `isInitialRoute` property in `RouteSetting` has been deprecated,
and `Navigator.pop()` no longer returns a value.

“Route”类不再管理其覆盖层中的覆盖条目，并且其“install()”方法不再具有“insertionPoint”参数。 “RouteSetting”中的“isInitialRoute”属性已被弃用，并且“Navigator.pop()”不再返回值。


## Context

## 背景


We refactored the navigator APIs to prepare for the new page API
and the introduction of the `Router` widget as outlined in
the [Router][] design document.
This refactoring introduced some function signature changes
in order to make the existing navigator APIs continue to work
with the new page API.

我们重构了导航器 API，为新页面 API 和引入“路由器”widget 做好准备，如 路由器 设计文档中所述。这次重构引入了一些函数签名更改，以便使现有的导航器 API 继续与新页面 API 配合使用。


## Description of change

## 变更说明


The boolean return value of `Navigator.pop()` was not well
defined, and the user could achieve the same result by calling
`Navigator.canPop()`.
Since the API for `Navigator.canPop()` was better defined,
we simplified `Navigator.pop()` to not return a boolean value.

`Navigator.pop()` 的布尔返回值没有明确定义，用户可以通过调用 `Navigator.canPop()` 获得相同的结果。由于“Navigator.canPop()”的 API 得到了更好的定义，我们简化了“Navigator.pop()”以不返回布尔值。


On the other hand, the navigator requires the ability
to manually rearrange entries in the overlay to allow
the user to change the route history in the new API.
We changed it so that the route only creates and destroys
its overlay entries, while the navigator inserts or
removes overlay entries from the overlay.
We also removed the `insertionPoint` argument of
`Route.install()` because it was obsolete after the change.

另一方面，导航器需要能够手动重新排列叠加层中的条目，以允许用户更改新 API 中的路线历史记录。我们对其进行了更改，以便路线仅创建和销毁其覆盖条目，而导航器则在覆盖中插入或删除覆盖条目。我们还删除了“Route.install()”的“insertionPoint”参数，因为它在更改后已过时。


Finally, we removed the `isInitialRoute` property from
`RouteSetting` as part of refactoring, and provided the
`onGenerateInitialRoutes` API for full control of
initial routes generation.

最后，作为重构的一部分，我们从“RouteSetting”中删除了“isInitialRoute”属性，并提供了“onGenerateInitialRoutes”API 来完全控制初始路由的生成。


## Migration guide

## 迁移指南


Case 1: An app depends on `pop()` returning a boolean value.

情况 1：应用程序依赖于“pop()”返回布尔值。


```dart
TextField(
  onTap: () {
    if (Navigator.pop(context))
      print('There still is at least one route after pop');
    else
      print('Oops! No more routes.');
  }
)
```

You could use `Navigator.canPop()` in combination with
`Navigator.pop()` to achieve the same result.

你可以将“Navigator.canPop()”与“Navigator.pop()”结合使用来实现相同的结果。


```dart
TextField(
  onTap: () {
    if (Navigator.canPop(context))
      print('There still is at least one route after pop');
    else
      print('Oops! No more routes.');
    // Our navigator pops the route anyway.
    Navigator.pop(context);
  }
)
```

Case 2: An app generates routes based on `isInitialRoute`.

案例 2：应用程序根据“isInitialRoute”生成路由。


```dart
MaterialApp(
  onGenerateRoute: (RouteSetting setting) {
    if (setting.isInitialRoute)
      return FakeSplashRoute();
    else
      return RealRoute(setting);
  }
)
```

There are different ways to migrate this change.
One way is to set an explicit value for `MaterialApp.initialRoute`.
You can then test for this value in place of `isInitialRoute`.
As `initialRoute` inherits its default value outside of Flutter's scope,
you must set an explicit value for it.

有多种方法可以迁移此更改。一种方法是为“MaterialApp.initialRoute”设置显式值。然后，你可以测试该值来代替“isInitialRoute”。由于“initialRoute”继承了 Flutter 范围之外的默认值，因此你必须为其设置一个显式值。


```dart
MaterialApp(
  initialRoute: '/', // Set this value explicitly. Default might be altered.
  onGenerateRoute: (RouteSetting setting) {
    if (setting.name == '/')
      return FakeSplashRoute();
    else
      return RealRoute(setting);
  }
)
```

If there is a more complicated use case,
you can use the new API, `onGenerateInitialRoutes`,
in `MaterialApp` or `CupertinoApp`.

如果有更复杂的用例，你可以在“MaterialApp”或“CupertinoApp”中使用新的 API“onGenerateInitialRoutes”。


```dart
MaterialApp(
  onGenerateRoute: (RouteSetting setting) {
    return RealRoute(setting);
  },
  onGenerateInitialRoutes: (String initialRouteName) {
    return <Route>[FakeSplashRoute()];
  }
)
```

## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


Design doc:

设计文档：


* [Router][]


API documentation:

API 文档：


* [`Route`][]

  [` 路线 `][`Route`]

* [`Route.install`][]


* [`RouteSetting.isInitialRoute`][]

  [`RouteSetting.isInitialRoute`][]

* [`Navigator`][]


* [`Navigator.pop`][]

  [` 导航器.pop`][`Navigator.pop`]

* [`Navigator.canPop`][]

  [`Navigator.canPop`][]


Relevant issue:

相关问题：


* [Issue 45938: Router][]

  [问题 45938：路由器][PR 44930]


Relevant PR:

相关公关：


* [PR 44930][] - Refactor the imperative api to continue working in the new navigation system

  [PR 44930][] - 重构命令式 API 以继续在新的导航系统中工作


[Issue 45938: Router]: {{site.repo.flutter}}/issues/45938
[`Navigator`]: {{site.api}}/flutter/widgets/Navigator-class.html
[`Navigator.pop`]: {{site.api}}/flutter/widgets/Navigator/pop.html
[`Navigator.canPop`]: {{site.api}}/flutter/widgets/Navigator/canPop.html
[Router]: /go/navigator-with-router
[PR 44930]: {{site.repo.flutter}}/pull/44930
[`Route`]: {{site.api}}/flutter/widgets/Route-class.html
[`Route.install`]: {{site.api}}/flutter/widgets/Route/install.html
[`RouteSetting.isInitialRoute`]: {{site.api}}/flutter/widgets/RouteSettings/isInitialRoute.html
