---
# title: Deprecate `SemanticsProperties.focusable` and `SemanticsConfiguration.isFocusable`
title: 弃用 `SemanticsProperties.focusable` 和 `SemanticsConfiguration.isFocusable`
# description: >
#   The `focusable` parameter has been replaced by `isFocused`.
description: >-
  `focusable` 参数已替换为 `isFocused`。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `SemanticsProperties.focusable` and `SemanticsConfiguration.isFocusable`
parameters were deprecated in favor of the `SemanticsProperties.focused` and
`SemanticsConfiguration.isFocused` parameters.

`SemanticsProperties.focusable` 和 `SemanticsConfiguration.isFocusable` 参数已被弃用，取而代之的是 `SemanticsProperties.focused` 和 `SemanticsConfiguration.isFocused` 参数。


The `focused` parameter is now nullable.
Setting it to `true` or `false` automatically
sets `isFocusable` to `true`, while
setting it to `null` sets `isFocusable` to `false`.

`focused` 参数现在可以为空。将其设置为 `true` 或 `false` 会自动将 `isFocusable` 设置为 `true`，而将其设置为 `null` 则会将 `isFocusable` 设置为 `false`。


## Context

## 背景


The `SemanticsConfiguration.isFocusable` property is a boolean that
indicates whether the semantics node can have input focus.
`SemanticsConfiguration.isFocused` is a boolean that indicates if the
semantics node has input focus.

`SemanticsConfiguration.isFocusable` 属性是一个布尔值，指示语义节点是否可以具有输入焦点。 `SemanticsConfiguration.isFocused` 是一个布尔值，指示语义节点是否具有输入焦点。


This change also applies to
`SemanticsProperties.focusable` and `SemanticsProperties.focused`.

此更改也适用于 `SemanticsProperties.focusable` 和 `SemanticsProperties.focused`。


We deprecated `isFocusable` because its functionality is covered by `isFocused`.
The `isFocused` property is now stored as a tristate flag in the engine,
and this change makes the framework consistent with the engine.

我们弃用了 `isFocusable`，因为它的功能已被 `isFocused` 覆盖。 `isFocused` 属性现在作为三态标志存储在引擎中，此更改使框架与引擎保持一致。


## Description of change

## 变更说明


The `SemanticsConfiguration.isFocusable` property is
deprecated in favor of `SemanticsConfiguration.isFocused`.
This property is a nullable boolean; setting it to `true` or `false`
automatically sets `isFocusable` to `true`, and
setting it to `null` sets `isFocusable` to `false`.

`SemanticsConfiguration.isFocusable` 属性已弃用，取而代之的是 `SemanticsConfiguration.isFocused`。该属性是一个可为 null 的布尔值；将其设置为 `true` 或 `false` 会自动将 `isFocusable` 设置为 `true`，并将其设置为 `null` 将 `isFocusable` 设置为 `false`。


## Migration guide

## 迁移指南


Replace `SemanticsConfiguration.isFocusable` with
`SemanticsConfiguration.isFocused`.

将 `SemanticsConfiguration.isFocusable` 替换为 `SemanticsConfiguration.isFocused`。


### Example 1: Setting `isFocused` to `true` automatically sets `isFocusable` to `true`

### 示例 1：将 `isFocused` 设置为 `true` 会自动将 `isFocusable` 设置为 `true`


Code before migration:

迁移前的代码：


```dart
void describeSemanticsConfiguration(SemanticsConfiguration config) {
  config.isFocusable = true;
  config.isFocused = true;
}
```

Code after migration:

迁移后的代码：


```dart
void describeSemanticsConfiguration(SemanticsConfiguration config) {
  config.isFocused = true;
}
```

### Example 2: Setting `isFocused` to `null` automatically sets `isFocusable` to `false`

### 示例 2：将 `isFocused` 设置为 `null` 会自动将 `isFocusable` 设置为 `false`


Code before migration:

迁移前的代码：


```dart
void describeSemanticsConfiguration(SemanticsConfiguration config) {
  config.isFocusable = false;
  config.isFocused = false;
}
```

Code after migration:

迁移后的代码：


```dart
void describeSemanticsConfiguration(SemanticsConfiguration config) {
  config.isFocused = null;
}
```


## Timeline

## 时间线


Landed in version: 3.37.0-0.0.pre<br>
登陆版本：3.37.0-0.0.pre
In stable release: 3.38
稳定版本：3.38


## References

## 参考资料


API documentation:

API 文档：


* [`SemanticsConfiguration`][]
* [`SemanticsProperties`][]
* [`SemanticsNode`][]

Relevant issue:

相关issue：


* [Issue 166092][]

  [问题 166092][Issue 166092]


Relevant PR:

相关 PR：


* [PR 170935][]

  [PR 170935][PR 170935]


[`SemanticsConfiguration`]: {{site.api}}/flutter/semantics/SemanticsConfiguration-class.html
[`SemanticsProperties`]: {{site.api}}/flutter/semantics/SemanticsProperties-class.html
[`SemanticsNode`]: {{site.api}}/flutter/semantics/SemanticsNode-class.html
[Issue 166092]: {{site.repo.flutter}}/issues/166092
[PR 170935]: {{site.repo.flutter}}/pull/170935
