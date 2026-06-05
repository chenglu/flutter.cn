---
# title: iOS FlutterViewController splashScreenView made nullable
title: iOS FlutterViewController splashScreenView 改为可空
# description: >
#   FlutterViewController splashScreenView changed from nonnull to nullable.
description: >
  FlutterViewController 的 splashScreenView 从 nonnull 改为 nullable。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `FlutterViewController` property `splashScreenView` has
been changed from `nonnull` to `nullable`.

`FlutterViewController` 属性 `splashScreenView` 已从
`nonnull` 改为 `nullable`。

Old declaration of `splashScreenView`:

`splashScreenView` 的旧声明：

```objc
@property(strong, nonatomic) UIView* splashScreenView;
```

New declaration of `splashScreenView`:

`splashScreenView` 的新声明：

```objc
@property(strong, nonatomic, nullable) UIView* splashScreenView;
```

## Context

## 背景

Prior to this change, on iOS the `splashScreenView` property returned `nil`
when no splash screen view was set, and
setting the property to `nil` removed the splash screen view.
However, the `splashScreenView` API was incorrectly marked `nonnull`.
This property is most often used when transitioning to
Flutter views in iOS add-to-app scenarios.

在此变更之前，在 iOS 上，当未设置启动屏视图时
`splashScreenView` 属性返回 `nil`，
将属性设为 `nil` 会移除启动屏视图。
然而，`splashScreenView` API 被错误地标记为 `nonnull`。
此属性最常用于 iOS add-to-app 场景中过渡到 Flutter 视图时。

## Description of change

## 变更说明

While it was possible in Objective-C to work around the
incorrect `nonnull` annotation by setting `splashScreenView` to
a `nil` `UIView`, in Swift this caused a compilation error:

在 Objective-C 中可以通过将 `splashScreenView` 设为
`nil` `UIView` 来绕过错误的 `nonnull` 注解，
但在 Swift 中这会导致编译错误：

```plaintext
error build: Value of optional type 'UIView?' must be unwrapped to a value of type 'UIView'
```

[PR #34743][] updates the property attribute to `nullable`.
It can return `nil` and can be set to `nil` to
remove the view in both Objective-C and Swift.

[PR #34743][] 将属性特性更新为 `nullable`。
它可以在 Objective-C 和 Swift 中返回 `nil`，
也可以设为 `nil` 以移除视图。

## Migration guide

## 迁移指南

If `splashScreenView` is stored in a `UIView` variable in Swift,
update to an optional type `UIView?`.

如果在 Swift 中将 `splashScreenView` 存储在 `UIView` 变量中，
请更新为可选类型 `UIView?`。

Code before migration:

迁移前的代码：

```swift
  var splashScreenView = UIView()
  var flutterEngine = FlutterEngine(name: "my flutter engine")
  let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
  splashScreenView = flutterViewController.splashScreenView // compilation error: Value of optional type 'UIView?' must be unwrapped to a value of type 'UIView'
```

Code after migration:

迁移后的代码：

```swift
  var splashScreenView : UIView? = UIView()
  var flutterEngine = FlutterEngine(name: "my flutter engine")
  let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
  let splashScreenView = flutterViewController.splashScreenView // compiles successfully
  if let splashScreenView = splashScreenView {
  }
```

## Timeline

## 时间线

In stable release: 3.7

稳定版发布：3.7

## References

## 参考资料

Relevant PR:

相关 PR：

* [Make splashScreenView of FlutterViewController nullable][]

  [将 FlutterViewController 的 splashScreenView 改为可空][Make splashScreenView of FlutterViewController nullable]

[Make splashScreenView of FlutterViewController nullable]: {{site.repo.engine}}/pull/34743
[PR #34743]: {{site.repo.engine}}/pull/34743
