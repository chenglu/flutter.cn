---
# title: >-
title: >-
  Deprecated the 'value' parameter of
  the 'DropdownButtonFormField' constructor
# description: >-
#   The `DropdownButtonFormField` constructor parameter `value` has been
#   replaced by the parameter `initialValue`.
description: >-
  `DropdownButtonFormField` 构造函数参数 `value` 已替换为参数 `initialValue`。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `value` parameter of the [`DropdownButtonFormField`][] constructor was
deprecated in favor of the `initialValue` parameter.

的 `value` 参数[`DropdownButtonFormField`][]构造函数已被弃用，取而代之的是 `initialValue` 参数。


## Context

## 背景


The `value` parameter of the [`DropdownButtonFormField`][] constructor was used
to initialize [`DropdownButtonFormField.initialValue`][].
Not using the same name was confusing. For example,
developers falsely assumed that setting `value` would change
the current selected value. This was not the case—it
only set the initial value or when the field is reset.

的 `value` 参数[`DropdownButtonFormField`][]构造函数用于初始化[`DropdownButtonFormField.initialValue`][]。不使用相同的名称会令人困惑。例如，开发人员错误地认为设置 `value` 会更改当前选择的值。情况并非如此，它仅设置初始值或在重置字段时设置。


## Description of change

## 变更说明


The `value` parameter of the [`DropdownButtonFormField`][] constructor is
deprecated in favor of the parameter named `initialValue`.

的 `value` 参数[`DropdownButtonFormField`][]构造函数已被弃用，取而代之的是名为 `initialValue` 的参数。


## Migration guide

## 迁移指南


Replace the `value` parameter of the [`DropdownButtonFormField`][] constructor
with the `initialValue` parameter to initialize
[`DropdownButtonFormField.initialValue`][].

替换 `value` 参数[`DropdownButtonFormField`][]使用 `initialValue` 参数进行初始化的构造函数[`DropdownButtonFormField.initialValue`][].


Code before migration:

迁移前的代码：


```dart highlightLines=2
DropdownButtonFormField(
  value: 'Yellow',
),
```

Code after migration:

迁移后的代码：


```dart highlightLines=2
DropdownButtonFormField(
  initialValue: 'Yellow',
),
```

## Timeline

## 时间线


Landed in version: 3.35.0-0.0.pre<br>
登陆版本：3.35.0-0.0.pre
In stable release: 3.35
稳定版本：3.35

## References

## 参考资料


API documentation:

API 文档：


- [`DropdownButtonFormField`][]
- [`DropdownButtonFormField.initialValue`][]

Relevant issues:

相关 issue：


- [Issue #169983][]

  [问题#169983][Issue #169983]


Relevant PRs:

相关 PR：


- [Deprecate `DropdownButtonFormField` `value` parameter in favor of `initialValue`][]

  [弃用 `DropdownButtonFormField` `value` 参数，转而使用 `initialValue`][Deprecate `DropdownButtonFormField` `value` parameter in favor of `initialValue`]


[`DropdownButtonFormField`]: {{site.api}}/flutter/material/DropdownButtonFormField/DropdownButtonFormField.html
[`DropdownButtonFormField.initialValue`]: {{site.main-api}}/flutter/widgets/FormField/initialValue.html
[Issue #169983]: {{site.repo.flutter}}/issues/169983
[Deprecate `DropdownButtonFormField` `value` parameter in favor of `initialValue`]: {{site.repo.flutter}}/pull/170805
