---
# title: The forgetChild() method must call super
title: forgetChild() 方法必须调用 super
# description: >
#     Any element subclasses that override forgetChild are required to call super.
description: >
    任何重写 forgetChild 的 Element 子类都必须调用 super。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

A recent global key duplication detection refactor now requires
`Element` subclasses that override the `forgetChild()` to call `super()`.

最近的全局 key 重复检测重构现在要求
重写 `forgetChild()` 的 `Element` 子类必须调用 `super()`。

## Context

## 背景

When encountering a global key duplication that will be
cleaned up by an element rebuild later,
we must not report global key duplication.
Our previous implementation threw an error as soon as
duplication was detected, and didn't wait for the rebuild if the
element with the duplicated global key would have rebuilt.

当遇到稍后会被元素重建清理的全局 key 重复时，
我们不应报告全局 key 重复。
先前的实现在检测到重复时立即抛出错误，
如果带有重复全局 key 的元素会重建，则不会等待重建。

The new implementation keeps track of all global
key duplications during a build cycle, and only verifies global
key duplication at the end of the that cycle instead of
throwing an error immediately. As part of the refactoring,
we implemented a mechanism to remove previous global key
duplication in `forgetChild` if the rebuild had happened.
This, however, requires all `Element` subclasses that
override `forgetChild` to call the `super` method.

新实现在构建周期内跟踪所有全局 key 重复，
并在该周期结束时才验证全局 key 重复，
而非立即抛出错误。作为重构的一部分，
我们在 `forgetChild` 中实现了机制，
在重建发生后移除先前的全局 key 重复。
然而，这要求所有重写 `forgetChild` 的 `Element` 子类
必须调用 `super` 方法。

## Description of change

## 变更说明

The `forgetChild` of abstract class `Element` has a base
implementation to remove global key reservation,
and it is enforced by the `@mustCallSuper` meta tag.
All subclasses that override the method have to call `super`;
otherwise, the analyzer shows a linting error and
global key duplication detection might throw an unexpected error.

抽象类 `Element` 的 `forgetChild` 有基础实现用于移除全局 key 预留，
并通过 `@mustCallSuper` 元标签强制执行。
所有重写该方法的子类必须调用 `super`；
否则 analyzer 会显示 lint 错误，
全局 key 重复检测可能抛出意外错误。

## Migration guide

## 迁移指南

In the following example, an app's `Element`
subclass overrides the `forgetChild` method.

在以下示例中，应用的 `Element` 子类重写了 `forgetChild` 方法。

Code before migration:

迁移前的代码：

```dart
class CustomElement extends Element {

    @override
    void forgetChild(Element child) {
        ...
    }
}
```

Code after migration:

迁移后的代码：

```dart
class CustomElement extends Element {

    @override
    void forgetChild(Element child) {
        ...
        super.forgetChild(child);
    }
}
```

## Timeline

## 时间线

Landed in version: 1.16.3<br>
In stable release: 1.17

合入版本：1.16.3<br>
稳定版发布：1.17

## References

## 参考资料

API documentation:

API 文档：

* [`Element`][]
* [`forgetChild()`][]

Relevant issues:

相关 issue：

* [Issue 43780][]

Relevant PRs:

相关 PR：

* [PR 43790: Fix global key error][]

  [PR 43790：修复全局 key 错误][PR 43790: Fix global key error]


[`Element`]: {{site.api}}/flutter/widgets/Element-class.html
[`forgetChild()`]: {{site.api}}/flutter/widgets/Element/forgetChild.html
[Issue 43780]: {{site.repo.flutter}}/issues/43780
[PR 43790: Fix global key error]: {{site.repo.flutter}}/pull/46183
