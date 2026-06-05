---
# title: Remove invalid parameters for `InputDecoration.collapsed`
title: 移除 `InputDecoration.collapsed` 的无效参数
# description: >
#   'InputDecoration.collapsed' constructor parameters
#   'floatingLabelBehavior' and 'floatingLabelAlignment' are deprecated without
#   replacement because they have no effect.
description: >
  `InputDecoration.collapsed` 构造函数参数
  `floatingLabelBehavior` 和 `floatingLabelAlignment` 已被弃用且无替代方案，
  因为它们没有任何效果。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`InputDecoration.collapsed` invalid parameters `floatingLabelBehavior` and
`floatingLabelAlignment` are deprecated.

`InputDecoration.collapsed` 的无效参数 `floatingLabelBehavior` 和
`floatingLabelAlignment` 已被弃用。

## Background

## 背景

`InputDecoration.collapsed` constructor is used to
create a minimal decoration without a label.

`InputDecoration.collapsed` 构造函数用于
创建不带标签的最小装饰。

The parameters `floatingLabelAlignment` and `floatingLabelBehavior` have
no effect because an input decoration created using
`InputDecoration.collapsed` has no label.

参数 `floatingLabelAlignment` 和 `floatingLabelBehavior` 没有任何效果，
因为使用 `InputDecoration.collapsed` 创建的输入装饰没有标签。

## Migration guide

## 迁移指南

To migrate, remove usage of `floatingLabelBehavior` and `floatingLabelAlignment`
parameters when calling the `InputDecoration.collapsed` constructor.
Those parameters had no effect.

迁移时，在调用 `InputDecoration.collapsed` 构造函数时
移除 `floatingLabelBehavior` 和 `floatingLabelAlignment` 参数的使用。
这些参数没有任何效果。

Code before migration:

迁移前的代码：

```dart
InputDecoration.collapsed(
  hintText: 'Hint',
  floatingLabelAlignment: FloatingLabelAlignment.center,
  floatingLabelBehavior: FloatingLabelBehavior.auto,
),
```

Code after migration:

迁移后的代码：

```dart
InputDecoration.collapsed(
  hintText: 'Hint',
),
```

## Timeline

## 时间线

Landed in version: 3.24.0-0.1.pre<br>
In stable release: 3.27.0

合入版本：3.24.0-0.1.pre<br>
稳定版发布：3.27.0

## References

## 参考资料

API documentation:

API 文档：

* [`InputDecoration.collapsed`][]
* [`InputDecoration.floatingLabelAlignment`][]
* [`InputDecoration.floatingLabelBehavior`][]

Relevant issues:

相关 issue：

* [Add prefixIcon and suffixIcon parameters to InputDecoration.collapsed][]

  [为 InputDecoration.collapsed 添加 prefixIcon 和 suffixIcon 参数][Add prefixIcon and suffixIcon parameters to InputDecoration.collapsed]

Relevant PRs:

相关 PR：

* [Deprecate invalid InputDecoration.collapsed parameters][]

  [弃用 InputDecoration.collapsed 的无效参数][Deprecate invalid InputDecoration.collapsed parameters]
* [Cleanup InputDecoration.collapsed constructor][]

  [清理 InputDecoration.collapsed 构造函数][Cleanup InputDecoration.collapsed constructor]

[`InputDecoration.collapsed`]: {{site.api}}/flutter/material/InputDecoration/InputDecoration.collapsed.html
[`InputDecoration.floatingLabelAlignment`]: {{site.api}}/flutter/material/InputDecoration/floatingLabelAlignment.html
[`InputDecoration.floatingLabelBehavior`]: {{site.api}}/flutter/material/InputDecoration/floatingLabelBehavior.html

[Add prefixIcon and suffixIcon parameters to InputDecoration.collapsed]: {{site.repo.flutter}}/issues/61331
[Deprecate invalid InputDecoration.collapsed parameters]: {{site.repo.flutter}}/pull/152486
[Cleanup InputDecoration.collapsed constructor]: {{site.repo.flutter}}/pull/152165
