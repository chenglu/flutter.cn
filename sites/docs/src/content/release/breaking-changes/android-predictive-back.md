---
# title: Android predictive back
title: Android 预测返回
# description: >-
#   The ability to control back navigation at the time that a back gesture is
#   received has been replaced with an ahead-of-time navigation API in order to
#   support Android 14's Predictive Back feature.
description: >-
  收到后退手势时控制后退导航的功能已被提前导航 API 取代，以支持 Android 14 的预测后退功能。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


To support Android 14's Predictive Back feature,
a set of ahead-of-time APIs have replaced just-in-time navigation APIs,
like `WillPopScope` and `Navigator.willPop`.

为了支持 Android 14 的预测返回功能，一组提前 API 取代了即时导航 API，例如 `WillPopScope` 和 `Navigator.willPop`。


:::note
The Flutter 3.22 release includes some updates
to predictive back behavior. For more info, check out
[Issue #132504][].

Flutter 3.22 版本包括对预测背部行为的一些更新。欲了解更多信息，请查看[Issue #132504][].

:::

[Issue #132504]: {{site.github}}/flutter/flutter/issues/132504#issuecomment-2025776552

## Background

## 背景


Android 14 introduced the
[Predictive Back feature]({{site.android-dev}}/guide/navigation/predictive-back-gesture),
which allows the user to peek behind the current route during a valid back
gesture and decide whether to continue back or to cancel the gesture. This was
incompatible with Flutter's navigation APIs that allow the developer to cancel a
back gesture after it is received.

Android 14 介绍了[Predictive Back feature]({{site.android-dev}}/guide/navigation/predictive-back-gesture)，它允许用户在有效的后退手势期间查看当前路线的后面，并决定是继续后退还是取消手势。这与 Flutter 的导航 API 不兼容，该 API 允许开发人员在收到后退手势后取消该手势。


With predictive back, the back animation begins immediately when the
user initiates the gesture and before it has been committed. There is no
opportunity for the Flutter app to decide whether it's allowed to happen at that
time. It must be known ahead of time.

通过预测性后退，后退动画会在用户发起手势时且在手势执行之前立即开始。 There is no opportunity for the Flutter app to decide whether it's allowed to happen at that time.必须提前知道。


For this reason, all APIs that allow a Flutter app developer to cancel a back
navigation at the time that a back gesture is received are now deprecated. They
have been replaced with equivalent APIs that maintain a boolean state at all
times that dictates whether or not back navigation is possible. When it is, the
predictive back animation happens as usual. Otherwise, navigation is stopped. In
both cases, the app developer is informed that a back was attempted and
whether it was successful.

因此，现在已弃用所有允许 Flutter 应用开发人员在收到后退手势时取消后退导航的 API。它们已被等效的 API 所取代，这些 API 始终保持布尔状态，指示是否可以进行后退导航。当它出现时，预测返回动画会像往常一样发生。否则，导航将停止。在这两种情况下，应用程序开发人员都会被告知已尝试返回以及是否成功。


### PopScope

### PopScope


The `PopScope` class directly replaces `WillPopScope` in order to enable
predictive back. Instead of deciding whether a pop is possible at the time it
occurs, this is set ahead of time with the `canPop` boolean. You can still
listen to pops by using `onPopInvoked`.

`PopScope` 类直接替换 `WillPopScope` 以启用预测返回。不是在发生时决定弹出是否可能，而是使用 `canPop` 布尔值提前设置。你仍然可以使用 `onPopInvoked` 收听流行音乐。


```dart
PopScope(
  canPop: _myPopDisableEnableLogic(),
  onPopInvoked: (bool didPop) {
    // Handle the pop. If `didPop` is false, it was blocked.
  },
)
```

### Form.canPop and Form.onPopInvoked

### Form.canPop 和 Form.onPopInvoked


These two new parameters are based on `PopScope` and replace the deprecated
`Form.onWillPop` parameter. They are used with `PopScope` in the same way as
above.

这两个新参数基于 `PopScope` 并替换已弃用的 `Form.onWillPop` 参数。它们以与上面相同的方式与 `PopScope` 一起使用。


```dart
Form(
  canPop: _myPopDisableEnableLogic(),
  onPopInvoked: (bool didPop) {
    // Handle the pop. If `didPop` is false, it was blocked.
  },
)
```

### Route.popDisposition

### Route.popDisposition


This getter synchronously returns the `RoutePopDisposition`
for the route, which describes how pops will behave.

此 getter 同步返回路由的 `RoutePopDisposition` ，它描述了 pop 的行为方式。


```dart
if (myRoute.popDisposition == RoutePopDisposition.doNotPop) {
  // Back gestures are disabled.
}
```

### ModalRoute.registerPopEntry and ModalRoute.unregisterPopEntry

### ModalRoute.registerPopEntry 和 ModalRoute.unregisterPopEntry


Use these methods to register `PopScope` widgets,
to be evaluated when the route decides whether it can pop.
This functionality might be used when implementing a
custom `PopScope` widget.

使用这些方法注册`PopScope` widgets，在路由决定是否可以弹出时进行评估。实现自定义 `PopScope` widget 时可能会使用此功能。


```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  final ModalRoute<dynamic>? nextRoute = ModalRoute.of(context);
  if (nextRoute != _route) {
    _route?.unregisterPopEntry(this);
    _route = nextRoute;
    _route?.registerPopEntry(this);
  }
}
```

## Migration guide

## 迁移指南


### Migrating from `WillPopScope` to `PopScope`

### 从 `WillPopScope` 迁移到 `PopScope`


The direct replacement of the `WillPopScope` widget is the `PopScope` widget.
In many cases, logic that was being run at the time of the back gesture in
`onWillPop` can be done at build time and set to `canPop`.

The direct replacement of the `WillPopScope` widget is the `PopScope` widget.在许多情况下，`onWillPop` 中后退手势时运行的逻辑可以在构建时完成并设置为 `canPop`。


Code before migration:

迁移前的代码：


```dart
WillPopScope(
  onWillPop: () async {
    return _myCondition;
  },
  child: ...
),
```

Code after migration:

迁移后的代码：


```dart
PopScope(
  canPop: _myCondition,
  child: ...
),
```

For cases where it's necessary to be notified that a
pop was attempted, the `onPopInvoked` method can be
used in a similar way to `onWillPop`. Keep in mind
that while `onWillPop` was called before the pop
was handled and had the ability to cancel it,
`onPopInvoked` is called after the pop is finished being handled.

对于需要通知尝试弹出的情况，可以以与 `onWillPop` 类似的方式使用 `onPopInvoked` 方法。请记住，虽然 `onWillPop` 在弹出处理之前被调用并且能够取消它，但 `onPopInvoked` 在弹出处理完成后被调用。


Code before migration:

迁移前的代码：


```dart
WillPopScope(
  onWillPop: () async {
    _myHandleOnPopMethod();
    return true;
  },
  child: ...
),
```

Code after migration:

迁移后的代码：


```dart
PopScope(
  canPop: true,
  onPopInvoked: (bool didPop) {
    _myHandleOnPopMethod();
  },
  child: ...
),
```

### Migrating from WillPopScope to NavigatorPopHandler for nested Navigators

### 嵌套导航器从 WillPopScope 迁移到 NavigatorPopHandler


A very common use case of `WillPopScope` was to properly handle
back gestures when using nested `Navigator` widgets.
It's possible to do this using `PopScope` as well,
but there is now a wrapper widget that makes this even easier:
`NavigatorPopHandler`.

`WillPopScope` 的一个非常常见的用例是在使用嵌套 `Navigator` widgets 时正确处理后退手势。也可以使用 `PopScope` 来完成此操作，但现在有一个包装器 widget 使这变得更加容易：`NavigatorPopHandler`。


Code before migration:

迁移前的代码：


```dart
WillPopScope(
  onWillPop: () async => !(await _nestedNavigatorKey.currentState!.maybePop()),
  child: Navigator(
    key: _nestedNavigatorKey,
    …
  ),
)
```

Code after migration:

迁移后的代码：


```dart
NavigatorPopHandler(
  onPop: () => _nestedNavigatorKey.currentState!.pop(),
  child: Navigator(
    key: _nestedNavigatorKey,
    …
  ),
)
```

### Migrating from Form.onWillPop to Form.canPop and Form.onPopInvoked

### 从 Form.onWillPop 迁移到 Form.canPop 和 Form.onPopInvoked


Previously, `Form` used a `WillPopScope` instance under
the hood and exposed its `onWillPop` method.
This has been replaced with a `PopScope` that exposes its
`canPop` and `onPopInvoked` methods.
Migrating is identical to migrating from
`WillPopScope` to `PopScope`, detailed above.

此前，`Form` 在底层使用了 `WillPopScope` 实例并公开了其 `onWillPop` 方法。 This has been replaced with a `PopScope` that exposes its `canPop` and `onPopInvoked` methods. Migrating is identical to migrating from `WillPopScope` to `PopScope`, detailed above.


### Migrating from Route.willPop to Route.popDisposition

### 从 Route.willPop 迁移到 Route.popDisposition


`Route`'s `willPop` method returned a
`Future<RoutePopDisposition>` to accommodate the fact
that pops could be canceled. Now that that's no longer true,
this logic has been simplified to a synchronous getter.

`Route` 的 `willPop` 方法返回 `Future<RoutePopDisposition>` 以适应弹出可以被取消的事实。现在情况不再如此，这个逻辑已被简化为同步 getter。


Code before migration:

迁移前的代码：


```dart
if (await myRoute.willPop() == RoutePopDisposition.doNotPop) {
  ...
}
```

Code after migration:

迁移后的代码：


```dart
if (myRoute.popDisposition == RoutePopDisposition.doNotPop) {
  ...
}
```

### Migrating from ModalRoute.add/removeScopedWillPopCallback to ModalRoute.(un)registerPopEntry

### 从 ModalRoute.add/removeScopedWillPopCallback 迁移到 ModalRoute.(un)registerPopEntry


Internally, `ModalRoute` kept track of the existence of
`WillPopScope`s in its widget subtree by registering them
with `addScopedWillPopCallback` and
`removeScopedWillPopCallback`.
Since `PopScope` replaces `WillPopScope`,
these methods have been replaced by `registerPopEntry` and
`unregisterPopEntry`, respectively.

在内部，`ModalRoute` 通过将 `WillPopScope`s 注册到 `addScopedWillPopCallback` 和 `removeScopedWillPopCallback` 来跟踪其 widget 子树中 `WillPopScope`s 的存在。由于 `PopScope` 替换了 `WillPopScope`，这些方法已分别被 `registerPopEntry` 和 `unregisterPopEntry` 替换。


`PopEntry` is implemented by `PopScope` in order to expose only the minimal
information necessary to `ModalRoute`. Anyone writing their own `PopScope`
should implement `PopEntry` and register and unregister their widget with
its enclosing `ModalRoute`.

`PopEntry` 由 `PopScope` 实现，以便仅公开 `ModalRoute` 所需的最少信息。 Anyone writing their own `PopScope` should implement `PopEntry` and register and unregister their widget with its enclosing `ModalRoute`.


Code before migration:

迁移前的代码：


```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  if (widget.onWillPop != null) {
    _route?.removeScopedWillPopCallback(widget.onWillPop!);
  }
  _route = ModalRoute.of(context);
  if (widget.onWillPop != null) {
    _route?.addScopedWillPopCallback(widget.onWillPop!);
  }
}
```

Code after migration:

迁移后的代码：


```dart
@override
void didChangeDependencies() {
  super.didChangeDependencies();
  _route?.unregisterPopEntry(this);
  _route = ModalRoute.of(context);
  _route?.registerPopEntry(this);
}
```

### Migrating from ModalRoute.hasScopedWillPopCallback to ModalRoute.popDisposition

### 从 ModalRoute.hasScopedWillPopCallback 迁移到 ModalRoute.popDisposition


This method was previously used for a use-case
very similar to Predictive Back but in the Cupertino library,
where certain back transitions allowed canceling
the navigation. The route transition was disabled
when there was even the possibility of a `WillPopScope`
widget canceling the pop.

This method was previously used for a use-case very similar to Predictive Back but in the Cupertino library, where certain back transitions allowed canceling the navigation.当甚至有可能 `WillPopScope` widget 取消弹出时，路由转换被禁用。


Now that the API requires this to be decided ahead of time,
this no longer needs to be speculatively based on the
existence of `PopScope` widgets. The definitive
logic of whether a `ModalRoute` has popping blocked
by a `PopScope` widget is baked into `ModalRoute.popDisposition`.

现在 API 要求提前决定，不再需要根据 `PopScope` widgets 的存在进行推测。 `ModalRoute` 是否已被 `PopScope` widget 阻止弹出的确定逻辑被烘焙到 `ModalRoute.popDisposition` 中。


Code before migration:

迁移前的代码：


```dart
if (_route.hasScopedWillPopCallback) {
  // Disable predictive route transitions.
}
```

Code after migration:

迁移后的代码：


```dart
if (_route.popDisposition == RoutePopDisposition.doNotPop) {
  // Disable predictive route transitions.
}
```

### Migrating a back confirmation dialog

### 迁移回确认对话框


`WillPopScope` was sometimes used to show a confirmation
dialog when a back gesture was received.
This can still be done with `PopScope` in a similar pattern.

`WillPopScope` 有时用于在收到后退手势时显示确认对话框。这仍然可以使用 `PopScope` 以类似的模式完成。


Code before migration:

迁移前的代码：


```dart
WillPopScope(
  onWillPop: () async {
    final bool? shouldPop = await _showBackDialog();
    return shouldPop ?? false;
  },
  child: child,
)
```

Code after migration:

迁移后的代码：


```dart
return PopScope(
  canPop: false,
  onPopInvoked: (bool didPop) async {
    if (didPop) {
      return;
    }
    final NavigatorState navigator = Navigator.of(context);
    final bool? shouldPop = await _showBackDialog();
    if (shouldPop ?? false) {
      navigator.pop();
    }
  },
  child: child,
)
```

### Supporting predictive back

### 支持预测返回


  1. Run Android 14 (API level 34) or above.

    运行 Android 14（API 级别 34）或更高版本。

  1. Enable the feature flag for predictive back on

    启用预测性重新开启功能标志

     the device under "Developer options".
     This will be unnecessary on future versions of Android.

“开发者选项”下的设备。这在 Android 的未来版本中是不必要的。

  1. Set `android:enableOnBackInvokedCallback="true"` in

    将 `android:enableOnBackInvokedCallback="true"` 设置为

     `android/app/src/main/AndroidManifest.xml`.
      If needed, refer to
     [Android's full guide]({{site.android-dev}}/guide/navigation/custom-back/predictive-back-gesture).
     for migrating Android apps to support predictive back.

`android/app/src/main/AndroidManifest.xml`。如果需要的话可以参考[Android's full guide]({{site.android-dev}}/guide/navigation/custom-back/predictive-back-gesture)。用于迁移 Android 应用程序以支持预测性回归。

  1. Make sure you're using version `3.14.0-7.0.pre`

    确保你使用的是版本 `3.14.0-7.0.pre`

     of Flutter or greater.

Flutter 或更大。

  1. Make sure your Flutter app doesn't use the

    确保你的 Flutter 应用程序不使用

     `WillPopScope` widget. Using it disables
     predictive back. If needed, use `PopScope` instead.

`WillPopScope` widget。使用它会禁用预测返回。如果需要，请使用 `PopScope` 代替。

  1. Run the app and perform a back gesture (swipe from the

    运行应用程序并执行后退手势（从

     left side of the screen).

屏幕左侧）。


## Timeline

## 时间线


Landed in version: 3.14.0-7.0.pre<br>
登陆版本：3.14.0-7.0.pre
In stable release: 3.16
稳定版本：3.16

## References

## 参考资料


API documentation:

API 文档：


* [`PopScope`][]
* [`NavigatorPopHandler`][]
* [`PopEntry`][]
* [`Form.canPop`][]
* [`Form.onPopInvoked`][]
* [`Route.popDisposition`][]
* [`ModalRoute.registerPopEntry`][]
* [`ModalRoute.unregisterPopEntry`][]

Relevant issues:

相关 issue：


* [Issue 109513][]

  [问题 109513][Issue 109513]


Relevant PRs:

相关 PR：


* [Predictive Back support for root routes][]

  [对根路由的预测性返回支持][Predictive Back support for root routes]

* [Platform channel for predictive back][]

  [预测反馈的平台渠道][Platform channel for predictive back]


[`PopScope`]: {{site.api}}/flutter/widgets/PopScope-class.html
[`NavigatorPopHandler`]: {{site.api}}/flutter/widgets/NavigatorPopHandler-class.html
[`PopEntry`]: {{site.api}}/flutter/widgets/PopEntry-class.html
[`Form.canPop`]: {{site.api}}/flutter/widgets/Form/canPop.html
[`Form.onPopInvoked`]: {{site.api}}/flutter/widgets/Form/onPopInvoked.html
[`Route.popDisposition`]: {{site.api}}/flutter/widgets/Route/popDisposition.html
[`ModalRoute.registerPopEntry`]: {{site.api}}/flutter/widgets/ModalRoute/registerPopEntry.html
[`ModalRoute.unregisterPopEntry`]: {{site.api}}/flutter/widgets/ModalRoute/unregisterPopEntry.html

[Issue 109513]: {{site.repo.flutter}}/issues/109513
[Predictive back support for root routes]: {{site.repo.flutter}}/pull/120385
[Platform channel for predictive back]: {{site.repo.engine}}/pull/39208
