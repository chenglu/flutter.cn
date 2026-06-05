---
# title: Generic types in PopScope
title: PopScope 中的泛型类型
# description: >-
#   Added a generic type to the PopScope class and updated
#   the onPopInvoked function signature.
description: >
  向 PopScope 类添加了泛型类型并更新了 onPopInvoked 函数签名。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Added a generic type to the [`PopScope`][] class and replaced
the [`onPopInvoked`][] with a new method [`onPopInvokedWithResult`][].
The new method takes a boolean `didPop` and a `result` as position parameters.

向 [`PopScope`][] 类添加了泛型类型，并用新方法 [`onPopInvokedWithResult`][] 替换了 [`onPopInvoked`][]。新方法采用布尔值“didPop”和“result”作为位置参数。


Also replaced the [`Form.onPopInvoked`] with [`Form.onPopInvokedWithResult`][]
for the same reason.

出于同样的原因，还用 [`Form.onPopInvokedWithResult`][] 替换了 [`Form.onPopInvoked`]。


## Context

## 背景


Previously, `PopScope` didn't have a way to access
the pop result when `onPopInvoked` was called.
The generic type is added to the `PopScope` class so that
the new method `onPopInvokedWithResult` can access the type-safe result.

以前，当调用“onPopInvoked”时，“PopScope”无法访问弹出结果。泛型类型被添加到“PopScope”类中，以便新方法“onPopInvokedWithResult”可以访问类型安全的结果。


## Description of change

## 变更说明


Added a generic type (`<T>`) to the `PopScope` class and
a new method `onPopInvokedWithResult`.
The `onPopInvoked` property was deprecated in favor of `onPopInvokedWithResult`.

向“PopScope”类添加了泛型类型（“<T>”）和新方法“onPopInvokedWithResult”。 “onPopInvoked”属性已被弃用，取而代之的是“onPopInvokedWithResult”。


Also added a new method `onPopInvokedWithResult`
to `Form` to replace `onPopInvoked`.

还在“Form”中添加了一个新方法“onPopInvokedWithResult”来替换“onPopInvoked”。


## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      navigatorKey: nav,
      home: Column(
        children: [
          Form(
            canPop: false,
            onPopInvoked: (bool didPop) {
              if (didPop) {
                return;
              }
              launchConfirmationDialog();
            },
            child: MyWidget(),
          ),
          PopScope(
            canPop: false,
            onPopInvoked: (bool didPop) {
              if (didPop) {
                return;
              }
              launchConfirmationDialog();
            },
            child: MyWidget(),
          ),
        ],
      ),
    ),
  );
}
```

Code after migration:

迁移后的代码：


```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      navigatorKey: nav,
      home: Column(
        children: [
          Form(
            canPop: false,
            onPopInvokedWithResult: (bool didPop, Object? result) {
              if (didPop) {
                return;
              }
              launchConfirmationDialog();
            },
            child: MyWidget(),
          ),
          PopScope<Object?>(
            canPop: false,
            onPopInvokedWithResult: (bool didPop, Object? result) {
              if (didPop) {
                return;
              }
              launchConfirmationDialog();
            },
            child: MyWidget(),
          ),
        ],
      ),
    ),
  );
}
```

The generic type should match the generic type of the [`Route`][]
that the `PopScope` is in.
For example, if the route uses `int` as its generic type,
consider using `PopScope<int>`.

泛型类型应与 `PopScope` 所在的 [`Route`][] 的泛型类型相匹配。例如，如果路由使用 `int` 作为其泛型类型，请考虑使用 `PopScope<int>`。


If the `PopScope` widgets are shared across multiple routes with
different types, you can use `PopScope<Object?>` to catch all possible types.

如果“PopScope”widget 在不同类型的多个路由之间共享，则可以使用“PopScope<Object?>”来捕获所有可能的类型。


## Timeline

## 时间轴


Landed in version: 3.22.0-26.0.pre<br>
In stable release: 3.24.0

登陆版本：3.22.0-26.0.pre<br> 稳定版本：3.24.0


## References

## 参考


API documentation:

API 文档：


* [`PopScope`][]

  [`PopScope`][]

* [`onPopInvoked`][]

  [`onPopInvoked`][]

* [`Route`][]

  [` 路线 `][`Route`]

* [`onPopInvokedWithResult`][]

  [`onPopInvokedWithResult`][]

* [`Form.onPopInvoked`][]

  [`Form.onPopInvoked`][]

* [`Form.onPopInvokedWithResult`][]

  [`Form.onPopInvokedWithResult`][]


Relevant issue:

相关问题：


* [Issue 137458][]

  [问题 137458][Issue 137458]


Relevant PR:

相关公关：


* [Add generic type for result in PopScope][] _(reverted)_

  [在 PopScope 中添加结果的通用类型][`PopScope`] _(恢复)_

* [Reapply new PopScope API][] _(final reland)_

  [重新应用新的 PopScope API][Reapply new PopScope API]_（最终重新登陆）_


[Add generic type for result in PopScope]: {{site.repo.flutter}}/pull/139164
[Reapply new PopScope API]: {{site.repo.flutter}}/pull/147607
[`PopScope`]: {{site.api}}/flutter/widgets/PopScope-class.html
[`Route`]: {{site.api}}/flutter/widgets/Route-class.html
[`onPopInvoked`]: {{site.api}}/flutter/widgets/PopScope/onPopInvoked.html
[`onPopInvokedWithResult`]: {{site.api}}/flutter/widgets/PopScope/onPopInvokedWithResult.html
[`Form.onPopInvoked`]: {{site.api}}/flutter/widgets/Form/onPopInvoked.html
[`Form.onPopInvokedWithResult`]: {{site.api}}/flutter/widgets/Form/onPopInvokedWithResult.html
[Issue 137458]: {{site.repo.flutter}}/issues/137458
