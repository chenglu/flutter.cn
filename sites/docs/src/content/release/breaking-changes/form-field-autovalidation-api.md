---
# title: The new Form, FormField auto-validation API
title: 全新的 Form、FormField 自动验证 API
# description: Gives more control in how to auto validate a Form and a FormField.
description: 让你更灵活地控制 Form 和 FormField 的自动验证方式。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The previous auto validation API for the `Form` and
`FormField` widgets didn't control when auto validation
should occur. So the auto validation for these widgets
always happened on first build when the widget was first
visible to the user, and you weren't able to control
when the auto validation should happen.

`Form` 和 `FormField` widget 先前的自动验证 API
无法控制自动验证何时发生。
因此，这些 widget 的自动验证总是在首次构建、
widget 首次对用户可见时发生，
你无法控制自动验证的时机。

## Context

## 背景

Due to the original API not allowing developers to change
the auto validation behavior for validating only when
the user interacts with the form field, we added new API
that allows developers to configure how they want
auto validation to behave for the `Form` and `FormField`
widgets.

由于原始 API 不允许开发者更改自动验证行为
（例如仅在用户与表单字段交互时验证），
我们添加了新 API，让开发者可以配置
`Form` 和 `FormField` widget 的自动验证方式。

## Description of change

## 变更说明

The following changes were made:

进行了以下变更：

* The `autovalidate` parameter is deprecated.
* A new parameter called `autovalidateMode`,
  an Enum that accepts values from the `AutovalidateMode`
  Enum class, is added.

* `autovalidate` 参数已被弃用。
* 新增了名为 `autovalidateMode` 的参数，
  这是一个接受 `AutovalidateMode` 枚举类值的 Enum。

## Migration guide

## 迁移指南

To migrate to the new auto validation API you need to
replace the usage of the deprecated `autovalidate`
parameter to the new `autovalidateMode` parameter.
If you want the same behavior as before you can use:
`autovalidateMode = AutovalidateMode.always`.
This makes your `Form` and `FormField` widgets auto
validate on first build and every time it changes.

要迁移到新的自动验证 API，你需要将已弃用的 `autovalidate`
参数替换为新的 `autovalidateMode` 参数。
如果你希望保持与之前相同的行为，可以使用：
`autovalidateMode = AutovalidateMode.always`。
这会让 `Form` 和 `FormField` widget 在首次构建时
以及每次变更时自动验证。

Code before migration:

迁移前的代码：

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidate: true,
      builder: (FormFieldState state) {
        return Container();
      },
    );
  }
}
```

Code after migration:

迁移后的代码：

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FormField(
      autovalidateMode: AutovalidateMode.always,
      builder: (FormFieldState state) {
        return Container();
      },
    );
  }
}
```

## Timeline

## 时间线

Landed in version: 1.21.0-5.0.pre<br>
In stable release: 1.22

合入版本：1.21.0-5.0.pre<br>
稳定版发布：1.22

## References

## 参考资料

API documentation:

API 文档：

* [`AutovalidateMode`]({{site.api}}/flutter/widgets/AutovalidateMode.html)

Relevant issues:

相关 issue：

* [Issue 56363]({{site.repo.flutter}}/issues/56363)
* [Issue 18885]({{site.repo.flutter}}/issues/18885)
* [Issue 15404]({{site.repo.flutter}}/issues/15404)
* [Issue 36154]({{site.repo.flutter}}/issues/36154)
* [Issue 48876]({{site.repo.flutter}}/issues/48876)

Relevant PRs:

相关 PR：

* [PR 56365: FormField should autovalidate only if its
  content was changed]({{site.github}}/flutter/pull/56365)
* [PR 56365：FormField 应仅在其内容变更时自动验证]({{site.github}}/flutter/pull/56365)
* [PR 59766: FormField should autovalidate only if its
  content was changed
  (fixed)]({{site.repo.flutter}}/pull/59766)
* [PR 59766：FormField 应仅在其内容变更时自动验证（已修复）]({{site.repo.flutter}}/pull/59766)
