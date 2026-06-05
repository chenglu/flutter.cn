---
# title: Android ActivityControlSurface attachToActivity signature change
title: Android ActivityControlSurface AttachToActivity 签名更改
# description: >
#   attachToActivity activity parameter changed to
#   ExclusiveAppComponent instead of Activity.
description: >-
  AttachToActivity 活动参数更改为 ExclusiveAppComponent 而不是 Activity。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


:::note
If you use standard Android embedding Java classes like
[`FlutterActivity`][] or [`FlutterFragment`][],
and don't manually embed a [`FlutterView`][]
inside your own custom `Activity` (this should be uncommon),
you can stop reading.

如果你使用标准 Android 嵌入 Java 类，例如[`FlutterActivity`][]或者[`FlutterFragment`][]，并且不要手动嵌入[`FlutterView`][]在你自己的自定义 `Activity` 中（这应该不常见），你可以停止阅读。

:::

A new [`ActivityControlSurface`][] method:

一个新的[`ActivityControlSurface`][]方法：


```java
void attachToActivity(
    @NonNull ExclusiveAppComponent<Activity> exclusiveActivity,
    @NonNull Lifecycle lifecycle);
```

is replacing the now deprecated method:

正在替换现已弃用的方法：


```java
void attachToActivity(@NonNull Activity activity, @NonNull Lifecycle lifecycle);
```

The existing deprecated method with the `Activity`
parameter was removed in Flutter 2.

带有 `Activity` 参数的现有已弃用方法已在 Flutter 2 中删除。


## Context

## 背景


In order for custom Activities to also supply the `Activity`
lifecycle events Flutter plugins expect using the
[`ActivityAware`][] interface, the [`FlutterEngine`][]
exposed a [`getActivityControlSurface()`][] API.

为了让自定义活动也提供 `Activity` 生命周期事件 Flutter 插件期望使用[`ActivityAware`][]接口，将[`FlutterEngine`][]暴露了一个[`getActivityControlSurface()`][]API。


This allows custom Activities to signal to the engine
(with which it has a `(0|1):1` relationship) that
it was being attached or detached from the engine.

这允许自定义活动向引擎（与其具有 `(0|1):1` 关系）发出信号，表明它正在与引擎连接或分离。


:::note
This lifecycle signaling is done automatically when you
use the engine's bundled [`FlutterActivity`][]
or [`FlutterFragment`][], which should be the most
common case.

当你使用引擎的捆绑包时，此生命周期信号会自动完成[`FlutterActivity`][]或者[`FlutterFragment`][]，这应该是最常见的情况。

:::

However, the previous API had the flaw that it didn't
enforce exclusion between activities connecting to
the engine, thus enabling `n:1` relationships between
the activity and the engine,
causing lifecycle cross-talk issues.

但是，之前的 API 存在缺陷，即它没有强制连接到引擎的活动之间进行排除，从而在活动和引擎之间启用 `n:1` 关系，从而导致生命周期串扰 issues。


## Description of change

## 变更说明


After [Issue #21272][], instead of attaching your activity
to the [`FlutterEngine`][] by using the:

后[Issue #21272][]，而不是将你的活动附加到[`FlutterEngine`][]通过使用：


```java
void attachToActivity(@NonNull Activity activity, @NonNull Lifecycle lifecycle);
```

API, which is now deprecated, instead use:

API 现已弃用，请改为使用：


```java
void attachToActivity(
    @NonNull ExclusiveAppComponent<Activity> exclusiveActivity,
    @NonNull Lifecycle lifecycle);
```

An `ExclusiveAppComponent<Activity>` interface
is now expected instead of an `Activity`.
The `ExclusiveAppComponent<Activity>` provides a callback
in case your exclusive activity is being replaced by
another activity attaching itself to the `FlutterEngine`.

现在需要 `ExclusiveAppComponent<Activity>` 接口，而不是 `Activity`。如果你的独占活动被另一个附加到 `FlutterEngine` 的活动替换，`ExclusiveAppComponent<Activity>` 会提供回调。


```java
void detachFromActivity();
```

API remains unchanged and you're still expected
to call it when your custom
activity is being destroyed naturally.

API 保持不变，并且当你的自定义 Activity 自然销毁时，你仍然需要调用它。


## Migration guide

## 迁移指南


If you have your own activity holding a
[`FlutterView`][], replace calls to:

如果你有自己的活动[`FlutterView`][]，将调用替换为：


```java
void attachToActivity(@NonNull Activity activity, @NonNull Lifecycle lifecycle);
```

with calls to:

并致电：


```java
void attachToActivity(
    @NonNull ExclusiveAppComponent<Activity> exclusiveActivity,
    @NonNull Lifecycle lifecycle);
```

on the [`ActivityControlSurface`][] that you obtained by calling
[`getActivityControlSurface()`][] on the [`FlutterEngine`][].

于[`ActivityControlSurface`][]你通过调用获得的[`getActivityControlSurface()`][]于[`FlutterEngine`][].


Wrap your activity with an `ExclusiveAppComponent<Activity>`
and implement the callback method:

用 `ExclusiveAppComponent<Activity>` 包装你的活动并实现回调方法：


```java
void detachFromFlutterEngine();
```

to handle your activity being replaced by another
activity being attached to the [`FlutterEngine`][].
Generally, you want to perform the same detaching operations
as performed when the activity is being naturally destroyed.

处理你的活动被附加到的另一个活动替换[`FlutterEngine`][]。通常，你希望执行与活动自然销毁时执行的相同的分离操作。


## Timeline

## 时间线


Landed in version: 1.23.0-7.0.pre<br>
登陆版本：1.23.0-7.0.pre
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


Motivating bug: [Issue #66192][]—Non exclusive
UI components attached to the FlutterEngine causes
event crosstalk

激励错误：[Issue #66192][]— 连接到 FlutterEngine 的非独占 UI 组件会导致事件串扰



[`ActivityAware`]: {{site.api}}/javadoc/io/flutter/embedding/engine/plugins/activity/ActivityAware.html
[`ActivityControlSurface`]: {{site.api}}/javadoc/io/flutter/embedding/engine/plugins/activity/ActivityControlSurface.html
[`FlutterActivity`]: {{site.api}}/javadoc/io/flutter/embedding/android/FlutterActivity.html
[`FlutterEngine`]: {{site.api}}/javadoc/io/flutter/embedding/engine/FlutterEngine.html
[`FlutterFragment`]: {{site.api}}/javadoc/io/flutter/embedding/android/FlutterFragment.html
[`FlutterView`]: {{site.api}}/javadoc/io/flutter/view/FlutterView.html
[`getActivityControlSurface()`]: {{site.api}}/javadoc/io/flutter/embedding/engine/FlutterEngine.html#getActivityControlSurface--
[Issue #66192]: {{site.repo.flutter}}/issues/66192.
[Issue #21272]: {{site.repo.engine}}/pull/21272
