---
# title: The Form widget no longer supports being a sliver.
title: Form widget 不再支持作为 sliver 使用。
# description: >-
#   The Form widget now includes a semantics widget,
#   which prevents it from being used directly as a sliver.
description: >-
  Form widget 现在包含 semantics widget，
  因此无法直接作为 sliver 使用。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Previously, the Form widget essentially acted as a direct wrapper
around its child. This design allowed a Form containing a sliver child
(e.g., Form(child: other sliver)) to be treated as a sliver itself
 within a CustomScrollView or similar scrollable parent.

此前，Form widget 本质上充当其子组件的直接包装器。
这种设计允许包含 sliver 子组件的 Form
（例如 Form(child: other sliver)）在 CustomScrollView
或类似可滚动父组件中被视为 sliver。

However, This PR introduced a new semantics widget
within the Form widget's internal structure. This change alters
its rendering behavior, meaning Form can no longer directly
function as a sliver.

然而，此 PR 在 Form widget 的内部结构中引入了新的 semantics widget。
这一变更改变了其渲染行为，意味着 Form 不再能直接作为 sliver 使用。

## Context

## 背景

This change is part of an ongoing effort to improve the
accessibility and semantic understanding of Flutter widgets.
By embedding a semantics widget directly within Form, the framework
can provide better information to accessibility services.

此变更是持续改进 Flutter widget 无障碍性和语义理解的
一部分。通过在 Form 内直接嵌入 semantics widget，
框架可以向无障碍服务提供更好的信息。

## Description of change

## 变更说明

The core change is the integration of a semantics widget
into the Form widget's build method.

核心变更是将 semantics widget 集成到 Form widget 的 build 方法中。

## Migration guide

## 迁移指南

If your app does not currently use the Form widget directly
as a sliver within a scrollable list
(e.g., as a direct child of CustomScrollView's slivers property),
then no changes are required.

如果你的应用当前未在可滚动列表中
直接将 Form widget 作为 sliver 使用
（例如作为 CustomScrollView 的 slivers 属性的直接子组件），
则无需更改。

If your app use Form as a sliver, you will need to wrap the Form
widget within a SliverToBoxAdapter. SliverToBoxAdapter is a
sliver that contains a single box widget, converting a regular
widget into a sliver that can be placed in a CustomScrollView.

如果你的应用将 Form 作为 sliver 使用，
需要将 Form widget 包裹在 SliverToBoxAdapter 中。
SliverToBoxAdapter 是包含单个 box widget 的 sliver，
可将普通 widget 转换为可放置在 CustomScrollView 中的 sliver。

Code before migration:

迁移前的代码：

```dart
sliver: Form(
    key: controller.formKey,
    child: SomeWidgetWithFormFields(),
)
```

Code after migration:

迁移后的代码：

```dart
sliver: SliverToBoxAdapter(
    child: Form(
        key: controller.formKey,
        child: SomeWidgetWithFormFields(),
    )
)
```

## Timeline

## 时间线

Landed in version: 3.35.0-pre<br>
In stable release: 3.35

合入版本：3.35.0-pre<br>
稳定版发布：3.35

## References

## 参考资料

API documentation:

API 文档：

* [`Form`]({{site.api}}/flutter/widgets/Form-class.html)

Relevant issues:

相关 issue：

* [Issue 161628]({{site.repo.flutter}}/issues/161628)

Relevant PRs:

相关 PR：

* [PR 170709: Add semantics role for form]({{site.repo.flutter}}/pull/170709)

  [PR 170709：为 form 添加 semantics role]({{site.repo.flutter}}/pull/170709)
