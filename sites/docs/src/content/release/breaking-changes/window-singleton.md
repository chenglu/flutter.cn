---
# title: The window singleton is deprecated
title: 窗口单例已弃用
# description: >
#   In preparation for supporting multiple views and
#   multiple windows the window singleton has been deprecated.
description: >-
  为了准备支持多个视图和多个窗口，窗口单例已被弃用。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


In preparation for supporting multiple views and multiple windows, the `window`
singleton has been deprecated. Code previously relying on the `window` singleton
needs to look up the specific view it wants to operate on via the `View.of` API
or interact with the `PlatformDispatcher` directly.

为了准备支持多个视图和多个窗口，`window` 单例已被弃用。之前依赖 `window` 单例的代码需要通过 `View.of` API 查找它想要操作的特定视图，或者直接与 `PlatformDispatcher` 交互。


## Context

## 背景


Originally, Flutter assumed that an application would only consist of a single
view (the `window`) into which content can be drawn. In a multi-view world, this
assumption no longer makes sense and the APIs encoding this assumption have
been deprecated. Instead, applications and libraries that relied on these APIs
must choose a specific view they want to operate on and
migrate to new multi-view compatible APIs as outlined in this migration guide.

最初，Flutter 假设应用程序仅包含可以在其中绘制内容的单个视图（`window`）。在多视图世界中，此假设不再有意义，并且编码此假设的 API 已被弃用。相反，依赖这些 API 的应用程序和库必须选择他们想要操作的特定视图，并迁移到本迁移指南中概述的新的多视图兼容 API。


## Description of change

## 变更说明


The APIs that have been deprecated as part of this change are:

作为此更改的一部分，已弃用的 API 包括：


* The global `window` property exposed by `dart:ui`.

  `dart:ui` 公开的全局 `window` 属性。

* The `window` property on the `BaseBinding` class,

  `BaseBinding` 类的 `window` 属性，

  which is usually accessed via

通常通过以下方式访问

  * `GestureBinding.instance.window`,

    `GestureBinding.instance.window`，

  * `SchedulerBinding.instance.window`,

    `SchedulerBinding.instance.window`，

  * `ServicesBinding.instance.window`,

    `ServicesBinding.instance.window`，

  * `PaintingBinding.instance.window`,

    `PaintingBinding.instance.window`，

  * `SemanticsBinding.instance.window`,

    `SemanticsBinding.instance.window`，

  * `RendererBinding.instance.window`,

    `RendererBinding.instance.window`，

  * `WidgetsBinding.instance.window`, or

    `WidgetsBinding.instance.window`，或

  * `WidgetTester.binding.window`.

    `WidgetTester.binding.window`。

* The `SingletonFlutterView` class from `dart:ui`.

  `dart:ui` 中的 `SingletonFlutterView` 类。

* `TestWindow` from `flutter_test`, its constructors,

  来自 `flutter_test` 的 `TestWindow`，其构造函数，

  and all of its properties and methods.

及其所有属性和方法。


The following options exist to migrate application and library code that relies
on these deprecated APIs:

可以使用以下选项来迁移依赖于这些已弃用 API 的应用程序和库代码：


If a `BuildContext` is available, consider looking up the current `FlutterView`
via `View.of`. This returns the `FlutterView` into
which the widgets built by the `build` method associated with the given context
will be drawn. The `FlutterView` provides access to the same functionality
that was previously available on the deprecated `SingletonFlutterView` class
returned by the deprecated `window` properties mentioned above. However, some
of the platform-specific functionality has moved to the `PlatformDispatcher`,
which can be accessed from the `FlutterView` returned by `View.of` via
`FlutterView.platformDispatcher`. Using `View.of` is the preferred way of
migrating away from the deprecated properties mentioned above.

如果 `BuildContext` 可用，请考虑通过 `View.of` 查找当前的 `FlutterView`。这将返回 `FlutterView`，由与给定上下文关联的 `build` 方法构建的 widget 将被绘制到其中。 `FlutterView` 提供对先前在已弃用的 `SingletonFlutterView` 类（由上述已弃用的 `window` 属性返回）上可用的相同功能的访问。但是，一些特定于平台的功能已移至 `PlatformDispatcher`，可以通过 `FlutterView.platformDispatcher` 从 `View.of` 返回的 `FlutterView` 进行访问。使用 `View.of` 是迁移上述已弃用属性的首选方法。


If no `BuildContext` is available to look up a `FlutterView`, the
`PlatformDispatcher` can be consulted directly to access platform-specific
functionality. It also maintains a list of all available `FlutterView`s in
`PlatformDispatcher.views` to access view-specific functionality. If possible,
the `PlatformDispatcher` should be accessed via a binding (for example
`WidgetsBinding.instance.platformDispatcher`) instead of using the static
`PlatformDispatcher.instance` property. This ensures that the functionality
of the `PlatformDispatcher` can be properly mocked out in tests.

如果没有 `BuildContext` 可用于查找 `FlutterView`，则可以直接查阅 `PlatformDispatcher` 以访问特定于平台的功能。它还维护 `PlatformDispatcher.views` 中所有可用 `FlutterView` 的列表，以访问特定于视图的功能。如果可能，应通过绑定（例如 `WidgetsBinding.instance.platformDispatcher`）访问 `PlatformDispatcher`，而不是使用静态 `PlatformDispatcher.instance` 属性。这确保了 `PlatformDispatcher` 的功能可以在测试中正确模拟。


### Testing

### 测试


For tests that accessed the `WidgetTester.binding.window` property to change
window properties for testing, the following migrations are available:

对于访问 `WidgetTester.binding.window` 属性以更改测试窗口属性的测试，可以使用以下迁移：


In tests written with `testWidgets`, two new properties have been added that
together replace the functionality of `TestWindow`.

在使用 `testWidgets` 编写的测试中，添加了两个新属性，它们一起取代了 `TestWindow` 的功能。


* `WidgetTester.view` will provide a `TestFlutterView` that can be modified

  `WidgetTester.view` 将提供可修改的 `TestFlutterView`

  similarly to `WidgetTester.binding.window`, but with only view-specific
  properties such as the size of a view, its display pixel ratio, etc.

与 `WidgetTester.binding.window` 类似，但仅具有特定于视图的属性，例如视图的大小、其显示像素比等。

  * `WidgetTester.viewOf` is available for certain multi-view use cases, but

    `WidgetTester.viewOf` 可用于某些多视图用例，但是

      should not be required for any migrations from
      `WidgetTester.binding.window`.

从 `WidgetTester.binding.window` 进行的任何迁移都不需要。

* `WidgetTester.platformDispatcher` will provide access to a

  `WidgetTester.platformDispatcher` 将提供对

  `TestPlatformDispatcher` that can be used to modify platform specific
  properties such as the platform's locale, whether certain system features
  are available, etc.

`TestPlatformDispatcher` 可用于修改平台特定属性，例如平台的区域设置、某些系统功能是否可用等。


## Migration guide

## 迁移指南


Instead of accessing the static `window` property, application and library code
that has access to a `BuildContext` should use `View.of` to look up the
`FlutterView` the context is associated with. Some properties have moved to
the `PlatformDispatcher` accessible from the view via the `platformDispatcher`
getter.

有权访问 `BuildContext` 的应用程序和库代码应使用 `View.of` 来查找与上下文关联的 `FlutterView` ，而不是访问静态 `window` 属性。某些属性已移至 `PlatformDispatcher`，可通过 `platformDispatcher` getter 从视图中访问。


Code before migration:

迁移前的代码：


```dart
Widget build(BuildContext context) {
  final double dpr = WidgetsBinding.instance.window.devicePixelRatio;
  final Locale locale = WidgetsBinding.instance.window.locale;
  return Text('The device pixel ratio is $dpr and the locale is $locale.');
}
```

Code after migration:

迁移后的代码：


```dart
Widget build(BuildContext context) {
  final double dpr = View.of(context).devicePixelRatio;
  final Locale locale = View.of(context).platformDispatcher.locale;
  return Text('The device pixel ratio is $dpr and the locale is $locale.');
}
```

If no `BuildContext` is available, the `PlatformDispatcher` exposed by the
bindings can be consulted directly.

如果没有可用的 `BuildContext` ，则可以直接查询绑定公开的 `PlatformDispatcher` 。


Code before migration:

迁移前的代码：


```dart
double getTextScaleFactor() {
  return WidgetsBinding.instance.window.textScaleFactor;
}
```

Code after migration:

迁移后的代码：


```dart
double getTextScaleFactor() {
  // View.of(context).platformDispatcher.textScaleFactor if a BuildContext is available, otherwise:
  return WidgetsBinding.instance.platformDispatcher.textScaleFactor;
}
```

### Testing

### 测试


In tests written with `testWidget`, the new `view` and `platformDispatcher`
accessors should be used instead.

在使用 `testWidget` 编写的测试中，应使用新的 `view` 和 `platformDispatcher` 访问器。


#### Setting view-specific properties

#### 设置特定于视图的属性


`TestFlutterView` has also made an effort to make the test API clearer and more
concise by using setters with the same name as their related getter instead of
setters with the `TestValue` suffix.

`TestFlutterView` 还通过使用与其相关 getter 同名的 setter 而不是带有 `TestValue` 后缀的 setter，努力使测试 API 更清晰、更简洁。


Code before migration:

迁移前的代码：


```dart
testWidget('test name', (WidgetTester tester) async {
  tester.binding.window.devicePixelRatioTestValue = 2.0;
  tester.binding.window.displayFeaturesTestValue = <DisplayFeatures>[];
  tester.binding.window.gestureSettingsTestValue = const GestureSettings(physicalTouchSlop: 100);
  tester.binding.window.paddingTestValue = FakeViewPadding.zero;
  tester.binding.window.physicalGeometryTestValue = const Rect.fromLTRB(0,0, 500, 800);
  tester.binding.window.physicalSizeTestValue = const Size(300, 400);
  tester.binding.window.systemGestureInsetsTestValue = FakeViewPadding.zero;
  tester.binding.window.viewInsetsTestValue = FakeViewPadding.zero;
  tester.binding.window.viewPaddingTestValue = FakeViewPadding.zero;
});
```

Code after migration

迁移后的代码


```dart
testWidget('test name', (WidgetTester tester) async {
  tester.view.devicePixelRatio = 2.0;
  tester.view.displayFeatures = <DisplayFeatures>[];
  tester.view.gestureSettings = const GestureSettings(physicalTouchSlop: 100);
  tester.view.padding = FakeViewPadding.zero;
  tester.view.physicalGeometry = const Rect.fromLTRB(0,0, 500, 800);
  tester.view.physicalSize = const Size(300, 400);
  tester.view.systemGestureInsets = FakeViewPadding.zero;
  tester.view.viewInsets = FakeViewPadding.zero;
  tester.view.viewPadding = FakeViewPadding.zero;
});
```

#### Resetting view-specific properties

#### 重置特定于视图的属性


`TestFlutterView` retains the capability to reset individual properties or the
entire view but, in order to be more clear and consist, the naming of these
methods has changed from `clear<property>TestValue` and `clearAllTestValues` to
`reset<property>` and `reset` respectively.

`TestFlutterView` 保留了重置单个属性或整个视图的功能，但为了更加清晰和一致，这些方法的命名已分别从 `clear<property>TestValue` 和 `clearAllTestValues` 更改为 `reset<property>` 和 `reset`。


##### Resetting individual properties

##### 重置个别属性


Code before migration:

迁移前的代码：


```dart
testWidget('test name', (WidgetTester tester) async {
  addTearDown(tester.binding.window.clearDevicePixelRatioTestValue);
  addTearDown(tester.binding.window.clearDisplayFeaturesTestValue);
  addTearDown(tester.binding.window.clearGestureSettingsTestValue);
  addTearDown(tester.binding.window.clearPaddingTestValue);
  addTearDown(tester.binding.window.clearPhysicalGeometryTestValue);
  addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
  addTearDown(tester.binding.window.clearSystemGestureInsetsTestValue);
  addTearDown(tester.binding.window.clearViewInsetsTestValue);
  addTearDown(tester.binding.window.clearViewPaddingTestValue);
});
```

Code after migration

迁移后的代码


```dart
testWidget('test name', (WidgetTester tester) async {
  addTearDown(tester.view.resetDevicePixelRatio);
  addTearDown(tester.view.resetDisplayFeatures);
  addTearDown(tester.view.resetGestureSettings);
  addTearDown(tester.view.resetPadding);
  addTearDown(tester.view.resetPhysicalGeometry);
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetSystemGestureInsets);
  addTearDown(tester.view.resetViewInsets);
  addTearDown(tester.view.resetViewPadding);
});
```

##### Resetting all properties at once

##### 立即重置所有属性


Code before migration:

迁移前的代码：


```dart
testWidget('test name', (WidgetTester tester) async {
  addTearDown(tester.binding.window.clearAllTestValues);
});
```

Code after migration

迁移后的代码


```dart
testWidget('test name', (WidgetTester tester) async {
  addTearDown(tester.view.reset);
});
```

#### Setting platform-specific properties

#### 设置特定于平台的属性


`TestPlatformDispatcher` retains the same functionality and naming scheme for
test setters as did `TestWindow`, so migration of platform-specific properties
mainly consists of calling the same setters on the new
`WidgetTester.platformDispatcher` accessor.

`TestPlatformDispatcher` 保留了与 `TestWindow` 相同的测试设置器功能和命名方案，因此平台特定属性的迁移主要包括在新的 `WidgetTester.platformDispatcher` 访问器上调用相同的设置器。


Code before migration:

迁移前的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  tester.binding.window.accessibilityFeaturesTestValue = FakeAccessibilityFeatures.allOn;
  tester.binding.window.alwaysUse24HourFormatTestValue = false;
  tester.binding.window.brieflyShowPasswordTestValue = true;
  tester.binding.window.defaultRouteNameTestValue = '/test';
  tester.binding.window.initialLifecycleStateTestValue = 'painting';
  tester.binding.window.localesTestValue = <Locale>[const Locale('en-us'), const Locale('ar-jo')];
  tester.binding.window.localeTestValue = const Locale('ar-jo');
  tester.binding.window.nativeSpellCheckServiceDefinedTestValue = false;
  tester.binding.window.platformBrightnessTestValue = Brightness.dark;
  tester.binding.window.semanticsEnabledTestValue = true;
  tester.binding.window.textScaleFactorTestValue = 2.0;
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  tester.platformDispatcher.accessibilityFeaturesTestValue = FakeAccessibilityFeatures.allOn;
  tester.platformDispatcher.alwaysUse24HourFormatTestValue = false;
  tester.platformDispatcher.brieflyShowPasswordTestValue = true;
  tester.platformDispatcher.defaultRouteNameTestValue = '/test';
  tester.platformDispatcher.initialLifecycleStateTestValue = 'painting';
  tester.platformDispatcher.localesTestValue = <Locale>[const Locale('en-us'), const Locale('ar-jo')];
  tester.platformDispatcher.localeTestValue = const Locale('ar-jo');
  tester.platformDispatcher.nativeSpellCheckServiceDefinedTestValue = false;
  tester.platformDispatcher.platformBrightnessTestValue = Brightness.dark;
  tester.platformDispatcher.semanticsEnabledTestValue = true;
  tester.platformDispatcher.textScaleFactorTestValue = 2.0;
});
```

#### Resetting platform-specific properties

#### 重置特定于平台的属性


Similarly to setting properties, resetting platform-specific properties consists
mainly of changing from the `binding.window` accessor to the
`platformDispatcher` accessor.

与设置属性类似，重置特定于平台的属性主要包括从 `binding.window` 访问器更改为 `platformDispatcher` 访问器。


##### Resetting individual properties

##### 重置个别属性


Code before migration:

迁移前的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  addTeardown(tester.binding.window.clearAccessibilityFeaturesTestValue);
  addTeardown(tester.binding.window.clearAlwaysUse24HourFormatTestValue);
  addTeardown(tester.binding.window.clearBrieflyShowPasswordTestValue);
  addTeardown(tester.binding.window.clearDefaultRouteNameTestValue);
  addTeardown(tester.binding.window.clearInitialLifecycleStateTestValue);
  addTeardown(tester.binding.window.clearLocalesTestValue);
  addTeardown(tester.binding.window.clearLocaleTestValue);
  addTeardown(tester.binding.window.clearNativeSpellCheckServiceDefinedTestValue);
  addTeardown(tester.binding.window.clearPlatformBrightnessTestValue);
  addTeardown(tester.binding.window.clearSemanticsEnabledTestValue);
  addTeardown(tester.binding.window.clearTextScaleFactorTestValue);
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  addTeardown(tester.platformDispatcher.clearAccessibilityFeaturesTestValue);
  addTeardown(tester.platformDispatcher.clearAlwaysUse24HourFormatTestValue);
  addTeardown(tester.platformDispatcher.clearBrieflyShowPasswordTestValue);
  addTeardown(tester.platformDispatcher.clearDefaultRouteNameTestValue);
  addTeardown(tester.platformDispatcher.clearInitialLifecycleStateTestValue);
  addTeardown(tester.platformDispatcher.clearLocalesTestValue);
  addTeardown(tester.platformDispatcher.clearLocaleTestValue);
  addTeardown(tester.platformDispatcher.clearNativeSpellCheckServiceDefinedTestValue);
  addTeardown(tester.platformDispatcher.clearPlatformBrightnessTestValue);
  addTeardown(tester.platformDispatcher.clearSemanticsEnabledTestValue);
  addTeardown(tester.platformDispatcher.clearTextScaleFactorTestValue);
});
```

##### Resetting all properties at once

##### 立即重置所有属性


Code before migration:

迁移前的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  addTeardown(tester.binding.window.clearAllTestValues);
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('test name', (WidgetTester tester) async {
  addTeardown(tester.platformDispatcher.clearAllTestValues);
});
```

## Timeline

## 时间线


Landed in version: 3.9.0-13.0.pre.20<br>
登陆版本：3.9.0-13.0.pre.20
In stable release: 3.10.0
稳定版本：3.10.0

## References

## 参考资料


API documentation:

API 文档：


* [`View.of`][]
* [`FlutterView`][]
* [`PlatformDispatcher`][]
* [`TestPlatformDispatcher`][]
* [`TestFlutterView`][]
* [`TestWidgetsFlutterBinding.window`][]

Relevant issues:

相关 issue：


* [Issue 116929][]

  [问题 116929][Issue 116929]

* [Issue 117481][]

  [问题 117481][Issue 117481]

* [Issue 121915][]

  [问题 121915][Issue 121915]


Relevant PRs:

相关 PR：


* [Deprecate SingletonFlutterWindow and global window singleton][]

  [弃用 SingletonFlutterWindow 和全局窗口单例][Deprecate SingletonFlutterWindow and global window singleton]

* [Deprecate BindingBase.window][]

  [弃用 BindingBase.window][Deprecate BindingBase.window]

* [Deprecates `TestWindow`][]

  [弃用 `TestWindow`][Deprecates `TestWindow`]



[`View.of`]: {{site.api}}/flutter/widgets/View/of.html
[`FlutterView`]: {{site.api}}/flutter/dart-ui/FlutterView-class.html
[`PlatformDispatcher`]: {{site.api}}/flutter/dart-ui/PlatformDispatcher-class.html
[`TestPlatformDispatcher`]: {{site.api}}/flutter/flutter_test/TestPlatformDispatcher-class.html
[`TestFlutterView`]: {{site.api}}/flutter/flutter_test/TestFlutterView-class.html
[`TestWidgetsFlutterBinding.window`]: {{site.api}}/flutter/flutter_test/TestWidgetsFlutterBinding/window.html
[Issue 116929]: {{site.repo.flutter}}/issues/116929
[Issue 117481]: {{site.repo.flutter}}/issues/117481
[Issue 121915]: {{site.repo.flutter}}/issues/121915
[Deprecate SingletonFlutterWindow and global window singleton]: {{site.repo.engine}}/pull/39302
[Deprecate BindingBase.window]: {{site.repo.flutter}}/pull/120998
[Deprecates `TestWindow`]: {{site.repo.flutter}}/pull/122824
