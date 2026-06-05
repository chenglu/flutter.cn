---
# title: The default page transition on Android is now PredictiveBackPageTransitionsBuilder
title: Android 上的默认页面转换现在是 PredictiveBackPageTransitionsBuilder
# description: >-
#   Android's default page transition has been updated to match the
#   platform and to support predictive back.
description: >-
  Android 的默认页面转换已更新，以匹配平台并支持预测返回。
ai-translated: true
---

## Summary

## 摘要


The default page transition on Android has been updated from
[`ZoomPageTransitionsBuilder`][] to [`PredictiveBackPageTransitionsBuilder`][].
When not using predictive back, this falls back to
[`FadeForwardsPageTransitionsBuilder`][].

Android 上的默认页面转换已从[`ZoomPageTransitionsBuilder`][]到[`PredictiveBackPageTransitionsBuilder`][]。当不使用预测返回时，这会回退到[`FadeForwardsPageTransitionsBuilder`][].


## Context

## 背景


Android has been rolling out a feature called predictive back, where performing
a back gesture allows the user to peek at the previous route or app and possibly
cancel the navigation. Flutter added support for this with the [`PopScope`][]
widget followed by [`PredictiveBackPageTransitionsBuilder`][].

Android 一直在推出一项称为“预测返回”的功能，通过执行返回手势，用户可以查看之前的路线或应用程序，并可能取消导航。 Flutter 添加了对此的支持[`PopScope`][]widget 后跟[`PredictiveBackPageTransitionsBuilder`][].


In the meantime, Android also updated its default page transition. Flutter added
support for this with [`FadeForwardsPageTransitionsBuilder`][].

与此同时，Android 还更新了其默认页面转换。 Flutter 添加了对此的支持[`FadeForwardsPageTransitionsBuilder`][].


## Description of change

## 变更说明


With this change, [`PredictiveBackPageTransitionsBuilder`][] has replaced
[`ZoomPageTransitionsBuilder`][] as the default page transition on Android.
During a normal page transition without a predictive back gesture, users
see the new [`FadeForwardsPageTransitionsBuilder`][] as the default page
transition. When using a predictive back gesture, the page animates along
with the gesture and allows canceling or committing to the back navigation.

随着这一变化，[`PredictiveBackPageTransitionsBuilder`][]已取代[`ZoomPageTransitionsBuilder`][]作为 Android 上的默认页面转换。在没有预测性后退手势的正常页面转换期间，用户会看到新的[`FadeForwardsPageTransitionsBuilder`][]作为默认页面转换。当使用预测后退手势时，页面会随着手势一起动画化，并允许取消或提交后退导航。


In this example, no page transition is explicitly given, so the
[default]({{site.github}}/flutter/flutter/blob/e983e4bd81f29b17215057fa5c9f46f96cbaf183/packages/flutter/lib/src/material/page_transitions_theme.dart#L806-L813)
is set to [`PredictiveBackPageTransitionsBuilder`][] in the theme on Android.

在此示例中，没有显式给出页面转换，因此[default]({{site.github}}/flutter/flutter/blob/e983e4bd81f29b17215057fa5c9f46f96cbaf183/packages/flutter/lib/src/material/page_transitions_theme.dart#L806-L813)设置为[`PredictiveBackPageTransitionsBuilder`][]在 Android 的主题中。


```dart
MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
  ),
  home: const PageOne(),
);
```

## Migration guide

## 迁移指南


If you want to keep your app's page transition on the old
[`ZoomPageTransitionsBuilder`][], you can simply set your page transition
explicitly in your app's theme. Keep in mind that you will not be able to
support predictive back route transitions.

如果你想让应用程序的页面转换保持在旧版本上[`ZoomPageTransitionsBuilder`][]，你只需在应用程序的主题中显式设置页面转换即可。请记住，你将无法支持预测性返回路线转换。


Code before migration:

迁移前的代码：


```dart
return MaterialApp(
  theme: ThemeData(
    brightness: Brightness.light,
    // pageTransitionsTheme is the default.
  ),
  home: const MyFirstScreen(),
);
```

Code after migration:

迁移后的代码：


```dart
MaterialApp(
  theme: ThemeData(
    // pageTransitionsTheme is explicitly set to the old transition on Android.
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
  ),
  home: const MyFirstScreen(),
);
```

One side effect of changing the default transition is that the duration that it
takes to transition between pages has increased from 300ms to 450ms. This might
cause breakages in tests that depend on the previous transition duration.
Fortunately, it's possible to use [`TransitionDurationObserver`][] to keep tests
independent of whatever page transition is used.

更改默认转换的副作用之一是页面之间转换所需的持续时间从 300 毫秒增加到 450 毫秒。这可能会导致依赖于先前转换持续时间的测试中断。幸运的是，可以使用[`TransitionDurationObserver`][]保持测试独立于使用的任何页面转换。


Code before migration:

迁移前的代码：


```dart
testWidgets('example', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      onGenerateRoute: (RouteSettings settings) { ... },
    ),
  );

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsNothing);

  // Pump through the whole transition, hardcoded to 300ms.
  await tester.tap(find.text('Next'));
  await tester.pump(const Duration(milliseconds: 300));

  expect(find.text('Page 1'), findsNothing);
  expect(find.text('Page 2'), findsOneWidget);
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('example', (WidgetTester tester) async {
  final TransitionDurationObserver observer = TransitionDurationObserver();

  await tester.pumpWidget(
    MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      onGenerateRoute: (RouteSettings settings) { ... },
    ),
  );

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsNothing);

  // Pump through the whole transition independent of the duration.
  await tester.tap(find.text('Next'));
  await observer.pumpPastTransition(tester);

  expect(find.text('Page 1'), findsNothing);
  expect(find.text('Page 2'), findsOneWidget);
});
```

It's even possible to write tests that need to pump part of the way through a
page transition without depending on the exact duration.

甚至可以编写需要在页面转换过程中进行部分泵送的测试，而不依赖于确切的持续时间。


Code before migration:

迁移前的代码：


```dart
testWidgets('example', (WidgetTester tester) async {
  await tester.pumpWidget(
    MaterialApp(
      onGenerateRoute: (RouteSettings settings) { ... },
    ),
  );

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsNothing);

  // Pump through half of the transition with a hardcoded value.
  await tester.tap(find.text('Back'));
  await tester.pump(const Duration(milliseconds: 150));

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsOneWidget);
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('example', (WidgetTester tester) async {
  final TransitionDurationObserver observer = TransitionDurationObserver();

  await tester.pumpWidget(
    MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      onGenerateRoute: (RouteSettings settings) { ... },
    ),
  );

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsNothing);

  // Pump through half of the transition independent of the duration.
  await tester.tap(find.text('Back'));
  await tester.pump(observer.transitionDuration ~/ 2);

  expect(find.text('Page 1'), findsOneWidget);
  expect(find.text('Page 2'), findsOneWidget);
});
```

## Timeline

## 时间线


Landed in version: 3.37.0-0.0.pre<br>
登陆版本：3.37.0-0.0.pre
In stable release: 3.38.0
稳定版本：3.38.0

## References

## 参考资料


API documentation:

API 文档：


* [`ZoomPageTransitionsBuilder`][]
* [`PredictiveBackPageTransitionsBuilder`][]
* [`FadeForwardsPageTransitionsBuilder`][]
* [`PopScope`][]
* [`TransitionDurationObserver`][]

Relevant issues:

相关 issue：


* [Android predictive back route transitions][]

  [Android 预测返回路线转换][Android predictive back route transitions]


Relevant PRs:

相关 PR：


* [Predictive back route transitions by default][]

  [默认情况下预测返回路线转换][Predictive back route transitions by default]


[`FadeForwardsPageTransitionsBuilder`]: {{site.api}}/flutter/material/FadeForwardsPageTransitionsBuilder-class.html
[`PopScope`]: {{site.api}}/flutter/widgets/PopScope-class.html
[`PredictiveBackPageTransitionsBuilder`]: {{site.api}}/flutter/material/PredictiveBackPageTransitionsBuilder-class.html
[`TransitionDurationObserver`]: {{site.api}}/flutter/flutter_test/TransitionDurationObserver-class.html
[`ZoomPageTransitionsBuilder`]: {{site.api}}/flutter/material/ZoomPageTransitionsBuilder-class.html

[Android predictive back route transitions]: {{site.github.com}}/flutter/flutter/issues/131961
[Predictive back route transitions by default]: {{site.github}}/flutter/flutter/pull/165832
