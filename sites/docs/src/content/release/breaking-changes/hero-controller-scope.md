---
# title: More strict assertions in the Navigator and the Hero controller scope
title: Navigator 和 Hero 控制器作用域中更严格的断言
# description: >
#   Added additional assertions to guarantee that
#   one hero controller scope can only subscribe to one navigator at a time.
description: >
  添加了额外断言，确保一个 hero 控制器作用域
  一次只能订阅一个 navigator。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The framework throws an assertion error when it detects there are
multiple navigators registered with one hero controller scope.

当框架检测到一个 hero 控制器作用域注册了多个 navigator 时，
会抛出断言错误。

## Context

## 背景

The hero controller scope hosts a hero controller for its widget
subtree. The hero controller can only support one navigator at
a time. Previously, there was no assertion to guarantee that.

hero 控制器作用域为其 widget 子树托管 hero 控制器。
hero 控制器一次只能支持一个 navigator。
此前没有断言来保证这一点。

## Description of change

## 变更说明

If the code starts throwing assertion errors after this change,
it means the code was already broken even before this change.
Multiple navigators may be registered under the same hero
controller scope, and they can not trigger hero animations when
their route changes. This change only surfaced this problem.

如果代码在此变更后开始抛出断言错误，
意味着代码在此变更之前就已经存在问题。
多个 navigator 可能注册在同一个 hero 控制器作用域下，
当路由变更时无法触发 hero 动画。此变更只是暴露了这个问题。

## Migration guide

## 迁移指南

An example application that starts to throw exceptions.

一个开始抛出异常的应用示例。

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      builder: (BuildContext context, Widget child) {
        // Builds two parallel navigators. This throws
        // error because both of navigators are under the same
        // hero controller scope created by MaterialApp.
        return Stack(
          children: <Widget>[
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (BuildContext context) {
                    return const Text('first Navigator');
                  }
                );
              },
            ),
            Navigator(
              onGenerateRoute: (RouteSettings settings) {
                return MaterialPageRoute<void>(
                  settings: settings,
                  builder: (BuildContext context) {
                    return const Text('Second Navigator');
                  }
                );
              },
            ),
          ],
        );
      }
    )
  );
}
```

You can fix this application by introducing your own hero controller scopes.

你可以通过引入自己的 hero 控制器作用域来修复此应用。

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      builder: (BuildContext context, Widget child) {
        // Builds two parallel navigators.
        return Stack(
          children: <Widget>[
            HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: Navigator(
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const Text('first Navigator');
                    }
                  );
                },
              ),
            ),
            HeroControllerScope(
              controller: MaterialApp.createMaterialHeroController(),
              child: Navigator(
                onGenerateRoute: (RouteSettings settings) {
                  return MaterialPageRoute<void>(
                    settings: settings,
                    builder: (BuildContext context) {
                      return const Text('second Navigator');
                    }
                  );
                },
              ),
            ),
          ],
        );
      }
    )
  );
}
```

## Timeline

## 时间线

Landed in version: 1.20.0<br>
In stable release: 1.20

合入版本：1.20.0<br>
稳定版发布：1.20

## References

## 参考资料

API documentation:

API 文档：

* [`Navigator`][]
* [`HeroController`][]
* [`HeroControllerScope`][]

Relevant issue:

相关 issue：

* [Issue 45938][]

Relevant PR:

相关 PR：

* [Clean up hero controller scope][]

  [清理 hero 控制器作用域][Clean up hero controller scope]

[Clean up hero controller scope]: {{site.repo.flutter}}/pull/60655
[`Navigator`]: {{site.api}}/flutter/widgets/Navigator-class.html
[`HeroController`]: {{site.api}}/flutter/widgets/HeroController-class.html
[`HeroControllerScope`]: {{site.api}}/flutter/widgets/HeroControllerScope-class.html
[Issue 45938]: {{site.repo.flutter}}/issues/45938
