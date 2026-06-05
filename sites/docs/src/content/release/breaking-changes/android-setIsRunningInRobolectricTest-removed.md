---
# title: FlutterMain.setIsRunningInRobolectricTest on Android removed
title: Android 上的 FlutterMain.setIsRunningInRobolectricTest 已删除
# description: >
#     The test-only FlutterMain.setIsRunningInRobolectricTest API on the
#     Android engine is consolidated into the FlutterInjector.
description: >-
  Android 引擎上的仅测试 FlutterMain.setIsRunningInRobolectricTest API 已合并到 FlutterInjector 中。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


If you write Java JUnit tests (such as Robolectric tests)
against the Flutter engine's Java embedding and used the
`FlutterMain.setIsRunningInRobolectricTest(true)` API,
replace it with the following:

如果你针对 Flutter 引擎的 Java 嵌入编写 Java JUnit 测试（例如 Robolectric 测试）并使用 `FlutterMain.setIsRunningInRobolectricTest(true)` API，请将其替换为以下内容：


```java
FlutterJNI mockFlutterJNI = mock(FlutterJNI.class);
FlutterInjector.setInstance(
        new FlutterInjector.Builder()
            .setFlutterLoader(new FlutterLoader(mockFlutterJNI))
            .build());
```

This should be very uncommon.

这应该是非常罕见的。


## Context

## 背景


The `FlutterMain` class itself is being deprecated and replaced with the
`FlutterInjector` class. The `FlutterMain` class uses a number of
static variables and functions than make it difficult to test.
`FlutterMain.setIsRunningInRobolectricTest()` is one ad-hoc static
mechanism to allow tests to run on the host machine on JVM without
loading the `libflutter.so` native library
(which can't be done on the host machine).

`FlutterMain` 类本身已被弃用并替换为 `FlutterInjector` 类。 `FlutterMain` 类使用许多静态变量和函数，这使得测试变得困难。 `FlutterMain.setIsRunningInRobolectricTest()` 是一种临时静态机制，允许测试在 JVM 上的主机上运行，​​而无需加载 `libflutter.so` 本机库（这不能在主机上完成）。


Rather than one-off solutions, all dependency injections needed for tests
in Flutter's Android/Java engine embedding are now moved to the
[`FlutterInjector`] class.

Flutter 的 Android/Java 引擎嵌入中测试所需的所有依赖项注入现在都移至 [`FlutterInjector`] 类，而不是一次性解决方案。


[`FlutterInjector`]: https://cs.opensource.google/flutter/engine/+/master:shell/platform/android/io/flutter/FlutterInjector.java

Within the `FlutterInjector` class,
the `setFlutterLoader()` Builder
function allows for control of how the
[`FlutterLoader`][] class locates and loads
the `libflutter.so` library.

在 `FlutterInjector` 类中， `setFlutterLoader()` Builder 函数允许控制如何[`FlutterLoader`][]类定位并加载 `libflutter.so` 库。


[`FlutterLoader`]: https://cs.opensource.google/flutter/engine/+/master:shell/platform/android/io/flutter/embedding/engine/loader/FlutterLoader.java

## Description of change

## 变更说明


This [engine commit][] removed the
`FlutterMain.setIsRunningInRobolectricTest()` testing function;
and the following [commit][] added a
`FlutterInjector` class to assist testing.
[PR 20473][] further refactored `FlutterLoader`
and `FlutterJNI` to allow for additional mocking and testing.

这[engine commit][]删除了 `FlutterMain.setIsRunningInRobolectricTest()` 测试功能；以及以下内容[commit][]添加了 `FlutterInjector` 类来协助测试。[PR 20473][]进一步重构 `FlutterLoader` 和 `FlutterJNI` 以允许额外的模拟和测试。


[commit]: {{site.repo.engine}}/commit/15f5696c4139a21e1fc54014ce17d01f6ad1737c#diff-f928557f2d60773a8435366400fa42ed
[engine commit]: {{site.repo.engine}}/commit/15f5696c4139a21e1fc54014ce17d01f6ad1737c#diff-599e1d64442183ead768757cca6805c3L154
[PR 20473]: {{site.repo.engine}}/pull/20473
to allow for additional mocking/testing.

允许额外的模拟/测试。


## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```java
FlutterMain.setIsRunningInRobolectricTest(true);
```

Code after migration:

迁移后的代码：


```java
FlutterJNI mockFlutterJNI = mock(FlutterJNI.class);
FlutterInjector.setInstance(
        new FlutterInjector.Builder()
            .setFlutterLoader(new FlutterLoader(mockFlutterJNI))
            .build());
```

## Timeline

## 时间线


Landed in version: 1.22.0-2.0.pre.133<br>
登陆版本：1.22.0-2.0.pre.133
In stable release: 2.0.0
稳定版本：2.0.0
