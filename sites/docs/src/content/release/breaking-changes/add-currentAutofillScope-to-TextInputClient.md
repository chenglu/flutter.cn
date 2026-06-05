---
# title: Adding TextInputClient.currentAutofillScope property
title: 添加 TextInputClient.currentAutofillScope 属性
# description: >
#   A new getter TextInputClient.currentAutofillScope was
#   added to the TextInputClient interface for autofill support.
description: >-
  TextInputClient 接口中添加了新的 getter TextInputClient.currentAutofillScope 以支持自动填充。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


A new getter, `TextInputClient.currentAutofillScope`, was added to the
`TextInputClient` interface; all `TextInputClient` subclasses must
provide a concrete implementation of `currentAutofillScope`.

`TextInputClient` 接口中添加了新的 getter `TextInputClient.currentAutofillScope`；所有 `TextInputClient` 子类必须提供 `currentAutofillScope` 的具体实现。


This getter allows the `TextInputClient` to trigger an
autofill that involves multiple logically connected input
fields. For example, a "username" field can trigger an
autofill that fills both itself and the "password"
field associated with it.

此 getter 允许 `TextInputClient` 触发涉及多个逻辑连接的输入字段的自动填充。例如，“用户名”字段可以触发自动填充，填充其本身和与其关联的“密码”字段。


## Context

## 背景


On many platforms, autofill services are capable of
autofilling multiple input fields in a single autofill attempt.
For example, username fields and password fields can usually
be autofilled in one go. For this reason, a Flutter input
field that is about to trigger autofill should also provide
the platform with information about other autofillable input
fields logically connected to it.
`TextInputClient.currentAutofillScope` defines the group of
input fields that are logically connected to this `TextInputClient`,
and can be autofilled together.

在许多平台上，自动填充服务能够在一次自动填充尝试中自动填充多个输入字段。例如，用户名字段和密码字段通常可以一次性自动填充。因此，即将触发自动填充的 Flutter 输入字段还应该向平台提供与其逻辑连接的其他可自动填充输入字段的信息。 `TextInputClient.currentAutofillScope` 定义逻辑上连接到此 `TextInputClient` 的输入字段组，并且可以一起自动填充。


## Description of change

## 变更说明


`TextInputClient` now has an additional getter that returns
the `AutofillScope` that this client belongs to.
This getter is used by the input client to collect autofill
related information from other autofillable input fields
within the same scope.

`TextInputClient` 现在有一个额外的 getter，它返回该客户端所属的 `AutofillScope` 。输入客户端使用此 getter 从同一范围内的其他可自动填充输入字段收集自动填充相关信息。


```dart
abstract class TextInputClient {
  AutofillScope get currentAutofillScope;
}
```

If you see the error message "missing concrete implementation of
'getter TextInputClient.currentAutofillScope'" while compiling
a Flutter app, follow the migration steps listed below.

如果你在编译 Flutter 应用程序时看到错误消息“缺少‘getter TextInputClient.currentAutofillScope’的具体实现”，请按照下面列出的迁移步骤操作。


## Migration guide

## 迁移指南


If you're not planning to add multifield autofill
support to your `TextInputClient` subclass,
simply return `null` in the getter:

如果你不打算向 `TextInputClient` 子类添加多字段自动填充支持，只需在 getter 中返回 `null` 即可：


```dart
class CustomTextField implements TextInputClient {
  // Not having an AutofillScope does not prevent the input field
  // from being autofilled. However, only this input field is
  // autofilled when autofill is triggered on it.
  AutofillScope get currentAutofillScope => null;
}
```

If multifield autofill support is desirable, a common
`AutofillScope` to use is the `AutofillGroup` widget.
To get the closest `AutofillGroup` widget to the text
input, use `AutofillGroup.of(context)`:

如果需要多字段自动填充支持，常用的 `AutofillScope` 是 `AutofillGroup` widget。要获得最接近文本输入的 `AutofillGroup` widget，请使用 `AutofillGroup.of(context)`：


```dart
class CustomTextFieldState extends State<CustomTextField> implements TextInputClient {
  AutofillScope get currentAutofillScope => AutofillGroup.of(context);
}
```

For more information, check out [`AutofillGroup`][].

欲了解更多信息，请查看[`AutofillGroup`][].


## Timeline

## 时间线


Landed in version: 1.18.0<br>
登陆版本：1.18.0
In stable release: 1.20
稳定版本：1.20

## References

## 参考资料


API documentation:

API 文档：


* [`AutofillGroup`][]
* [`TextInputClient.currentAutofillScope`][]

Relevant issue:

相关issue：


* [Issue 13015: Autofill support][]

  [问题 13015：自动填充支持][Issue 13015: Autofill support]


Relevant PR:

相关 PR：


* [Framework PR that added autofill support][]

  [添加了自动填充支持的框架 PR][Framework PR that added autofill support]



[Framework PR that added autofill support]: {{site.repo.flutter}}/pull/52126
[Issue 13015: Autofill support]: {{site.repo.flutter}}/issues/13015

[`AutofillGroup`]: {{site.api}}/flutter/widgets/AutofillGroup-class.html
[`TextInputClient.currentAutofillScope`]: {{site.api}}/flutter/services/TextInputClient/currentAutofillScope.html
