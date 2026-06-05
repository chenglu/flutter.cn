---
# title: "Deprecate InputDecoration.maintainHintHeight in favor of InputDecoration.maintainHintSize"
title: "弃用 InputDecoration.maintainHintHeight，改用 InputDecoration.maintainHintSize"
# description: "The InputDecoration.maintainHintHeight parameter has been replaced by InputDecoration.maintainHintSize."
description: "InputDecoration.maintainHintHeight 参数已被 InputDecoration.maintainHintSize 取代。"
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


## 摘要

## 摘要



The [`InputDecoration.maintainHintHeight`][] parameter was deprecated
in favor of the [`InputDecoration.maintainHintSize`][] parameter.

这[`InputDecoration.maintainHintHeight`][]参数已被弃用，有利于[`InputDecoration.maintainHintSize`][]范围。


这[`InputDecoration.maintainHintHeight`][]参数已被弃用，有利于[`InputDecoration.maintainHintSize`][]范围。


## Context

## 背景


## 背景

## 背景



The default intrinsic size of an input decorator depends on the hint size.
The [`InputDecoration.maintainHintSize`][] parameter can be set to `false` to
make the intrinsic size ignores the hint size when the hint isn't visible.
Previously, the `InputDecoration.maintainHintHeight` parameter was
used to override the default intrinsic height and had no impact on the
intrinsic width.

输入装饰器的默认内部大小取决于提示大小。这[`InputDecoration.maintainHintSize`][]参数可以设置为 `false` 以使内在大小在提示不可见时忽略提示大小。以前，`InputDecoration.maintainHintHeight` 参数用于覆盖默认的固有高度，对固有宽度没有影响。


输入装饰器的默认内部大小取决于提示大小。这[`InputDecoration.maintainHintSize`][]参数可以设置为 `false` 以使内在大小在提示不可见时忽略提示大小。以前，`InputDecoration.maintainHintHeight` 参数用于覆盖默认的固有高度，对固有宽度没有影响。

输入装饰器的默认内部大小取决于提示大小。这[`InputDecoration.maintainHintSize`][]参数可以设置为 `false` 以使内部大小在提示不可见时忽略提示大小。以前，`InputDecoration.maintainHintHeight` 参数用于覆盖默认的固有高度，对固有宽度没有影响。



## Description of change

## 变更说明


## 变更说明

## 变更说明



The [`InputDecoration.maintainHintHeight`][] is deprecated in
favor of [`InputDecoration.maintainHintSize`][] which makes both the intrinsic
width and height depend on the hint dimensions.

这[`InputDecoration.maintainHintHeight`][]已被弃用，有利于[`InputDecoration.maintainHintSize`][]这使得固有宽度和高度都取决于提示尺寸。


这[`InputDecoration.maintainHintHeight`][]已被弃用，有利于[`InputDecoration.maintainHintSize`][]这使得固有宽度和高度都取决于提示尺寸。


## Migration guide

## 迁移指南


## 迁移指南

## 迁移指南



Replace [`InputDecoration.maintainHintHeight`][] with
[`InputDecoration.maintainHintSize`][] to override the default intrinsic size
computation.

代替[`InputDecoration.maintainHintHeight`][]和[`InputDecoration.maintainHintSize`][]覆盖默认的固有大小计算。


代替[`InputDecoration.maintainHintHeight`][]和[`InputDecoration.maintainHintSize`][]覆盖默认的固有大小计算。


Code before migration:

迁移前的代码：


迁移前的代码：


```dart highlightLines=3
TextField(
  indicator: InputDecoration(
    maintainHintHeight: false,
  ),
),
```

Code after migration:

迁移后的代码：


迁移后的代码：


```dart highlightLines=3
TextField(
  indicator: InputDecoration(
    maintainHintSize: false,
  ),
),
```

## Timeline

## 时间线


## 时间线

## 时间线



Landed in version: 3.30.0-0.0.pre<br>
登陆版本：3.30.0-0.0.pre
登陆版本：3.30.0-0.0.pre
In stable release: 3.32
稳定版本：3.32

登陆版本：3.30.0-0.0.pre 稳定版本：3.32 稳定版本：3.32


## References

## 参考资料


## 参考资料

## 参考资料



API documentation:

API 文档：


API 文档：

API文档：



- [`InputDecoration.maintainHintHeight`][]
- [`InputDecoration.maintainHintSize`][]

Relevant issues:

相关 issue：


相关 issue：

相关issue：



- [Issue #93337][]

  [问题#93337][Issue #93337]


  [问题#93337][Issue #93337]


Relevant PRs:

相关 PR：


相关 PR：

相关PR：



- [Fix TextField intrinsic width when hint is not visible][]

  [当提示不可见时修复 TextField 固有宽度][Fix TextField intrinsic width when hint is not visible]


  [当提示不可见时修复 TextField 固有宽度][Fix TextField intrinsic width when hint is not visible]


[`InputDecoration.maintainHintHeight`]: {{site.api}}/flutter/material/InputDecoration/maintainHintHeight.html
[`InputDecoration.maintainHintSize`]: {{site.main-api}}/flutter/material/InputDecoration/maintainHintSize.html
[Issue #93337]: {{site.repo.flutter}}/issues/93337
[Fix TextField intrinsic width when hint is not visible]: {{site.repo.flutter}}/pull/161235
