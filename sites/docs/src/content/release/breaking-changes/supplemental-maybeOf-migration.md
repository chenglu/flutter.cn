---
# title: Migrate `of` to non-nullable return values, and add `maybeOf`
title: 将 `of` 迁移到不可为 null 的返回值，并添加 `maybeOf`
# description: >
#   To eliminate nullOk parameters to help with API clarity
#   in the face of null safety.
description: >
  消除 nullOk 参数，有助于在面对 null 安全时提高 API 清晰度。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


This migration guide describes conversion of code that uses various static `of`
functions to retrieve information from a context that used to return nullable
values, but now return non-nullable values.

本迁移指南描述了使用各种静态“of”函数从上下文中检索信息的代码转换，该上下文过去返回可为空值，但现在返回非可为空值。


## Context

## 背景


Flutter has a common pattern of allowing lookup of some types of widgets
(typically [`InheritedWidget`][]s, but also others) using static member
functions that are typically called `of`.

Flutter 有一个常见的模式，允许使用通常称为“of”的静态成员函数查找某些类型的 widget（通常是 [`InheritedWidget`][]，但也包括其他）。


When non-nullability was made the default, it was then desirable to have the
most commonly used APIs return a non-nullable value. This is because saying
`Scrollable.of(context)` and then still requiring an `!` operator or `?` and a
fallback value after that call felt awkward, and was not idiomatic for
non-nullable Dart code.

当不可为空被设置为默认值时，最常用的 API 就需要返回一个不可为空的值。这是因为说 `Scrollable.of(context)` 然后仍然需要 `!` 运算符或 `?` 以及调用后的后备值感觉很尴尬，并且对于不可为 null 的 Dart 代码来说不是惯用的。


A lot of this migration was performed when we eliminated `nullOk` parameters in
a [previous migration][], but some `of` methods were missed in that migration,
and some were subsequently added with nullable return types, counter to our
common pattern.

当我们在先前的迁移中消除“nullOk”参数时，执行了很多此类迁移，但在该迁移中遗漏了一些“of”方法，并且随后添加了一些可空返回类型，这与我们的常见模式相反。


In this migration, the affected `of` accessors were split into two calls: one
that returned a non-nullable value and threw an exception when the sought-after
value was not present (still called `of`), and one that returned a nullable
value that didn't throw an exception, and returned null if the value was not
present (a new method called `maybeOf`).

在此迁移中，受影响的“of”访问器分为两个调用：一个返回不可为 null 的值，并在所需值不存在时引发异常（仍称为“of”），另一个返回不引发异常的可为 null 值，如果该值不存在则返回 null（称为“maybeOf”的新方法）。


## Description of change

## 变更说明


The change modified these static `of` APIs to return non-nullable values.
If a value is not found, they will also now assert in debug mode, and
throw an exception in release mode.

此更改修改了这些静态 API 以返回不可为 null 的值。如果未找到值，它们现在也会在调试模式下断言，并在发布模式下抛出异常。


* [`AutofillGroup.of`]

  [` 自动填充组.of`]

* [`DefaultTabController.of`]

  [`DefaultTabController.of`]

* [`DefaultTextHeightBehavior.of`]

  [`DefaultTextHeightBehavior.of`]

* [`Form.of`]

  [` 形式 `]

* [`HeroControllerScope.of`]

  [`HeroControllerScope.of`]

* [`Material.of`]

  [` 材料 `]

* [`Overlay.of`]

  [` 覆盖 `]

* [`PageStorage.of`]

  [` 页面存储.of`]

* [`PrimaryScrollController.of`]

  [`PrimaryScrollController.of`]

* [`RenderAbstractViewport.of`]

  [`RenderAbstractViewport.of`]

* [`RestorationScope.of`]

  [` 恢复范围 `]

* [`Scrollable.of`]

  [` 可滚动.of`]

* [`ScrollNotificationObserver.of`]

  [`ScrollNotificationObserver.of`]


This change also introduced new static `maybeOf` APIs alongside
the above functions, which return a nullable version of the same value, and
simply return null if the value is not found, without throwing any exceptions.

此更改还与上述函数一起引入了新的静态“maybeOf” API，它们返回相同值的可为空版本，并且如果未找到该值则简单地返回 null，而不会引发任何异常。


* [`AutofillGroup.maybeOf`]

  [`AutofillGroup.maybeOf`]

* [`DefaultTabController.maybeOf`]

  [`DefaultTabController.maybeOf`]

* [`DefaultTextHeightBehavior.maybeOf`]

  [`DefaultTextHeightBehavior.maybeOf`]

* [`Form.maybeOf`]

  [`Form.maybeOf`]

* [`HeroControllerScope.maybeOf`]

  [`HeroControllerScope.maybeOf`]

* [`Material.maybeOf`]

  [`Material.maybeOf`]

* [`Overlay.maybeOf`]

  [`Overlay.maybeOf`]

* [`PageStorage.maybeOf`]

  [`PageStorage.maybeOf`]

* [`PrimaryScrollController.maybeOf`]

  [`PrimaryScrollController.maybeOf`]

* [`RenderAbstractViewport.maybeOf`]

  [`RenderAbstractViewport.maybeOf`]

* [`RestorationScope.maybeOf`]

  [`RestorationScope.maybeOf`]

* [`Scrollable.maybeOf`]

  [` 可滚动.maybeOf`]

* [`ScrollNotificationObserver.maybeOf`]

  [`ScrollNotificationObserver.maybeOf`]


## Migration guide

## 迁移指南


To modify your code to use the new form of the APIs, first convert all
instances of the original static `of` functions (where its nullability is
important) to use the `maybeOf` form instead.

要修改代码以使用新形式的 API，请首先将原始静态“of”函数的所有实例（其中其可空性很重要）转换为使用“maybeOf”形式。


Code before migration:

迁移前的代码：


```dart
ScrollController? controller = Scrollable.of(context);
```

Code after migration:

迁移后的代码：


```dart
ScrollController? controller = Scrollable.maybeOf(context);
```

Then, for instances where the code calls the `of` API followed by
an exclamation point, just remove the exclamation point: it can
no longer return a nullable value.

然后，对于代码调用“of”API 并后跟感叹号的实例，只需删除感叹号：它不能再返回可为 null 的值。


Code before migration:

迁移前的代码：


```dart
ScrollController controller = Scrollable.of(context)!;
```

Code after migration:

迁移后的代码：


```dart
ScrollController controller = Scrollable.of(context);
```

The following can also be helpful:

以下内容也可能有所帮助：


* [`unnecessary_non_null_assertion`][] (linter message) identifies

  [`unnecessary_non_null_assertion`][]（linter 消息）标识

places where an  `!` operator should be removed

应删除“!”运算符的地方

* [`unnecessary_null_checks`][] (analysis option) identifies places

  [`unnecessary_null_checks`][]（分析选项）标识地点

where the `?` operator isn't needed

不需要 '?` 运算符的地方

* [`unnecessary_null_in_if_null_operators`][] identifies places

  [`unnecessary_null_in_if_null_operators`][] 标识地点

where a `??` operator isn't needed

不需要 `??` 运算符的地方

* [`unnecessary_nullable_for_final_variable_declarations`][] (analysis option)

  [`unnecessary_nullable_for_final_variable_declarations`][]（分析选项）

finds unnecessary question mark operators on `final` and `const` variables

在“final”和“const”变量上找到不必要的问号运算符


## Timeline

## 时间轴


In stable release: 3.7

稳定版本：3.7


## References

## 参考


API documentation:

API 文档：


* [`Material.of`][]


Relevant PRs:

相关 PR：


* [Add `maybeOf` for all the cases when `of` returns nullable][]

  [为“of”返回可为空的所有情况添加“maybeOf”][`Form.maybeOf`]

* [Add `Overlay.maybeOf`, make `Overlay.of` return a non-nullable instance][]

  [添加 `Overlay.maybeOf`，使 `Overlay.of` 返回一个不可为空的实例][Add `Overlay.maybeOf`, make `Overlay.of` return a non-nullable instance]


[previous migration]: /release/breaking-changes/eliminating-nullok-parameters
[`unnecessary_non_null_assertion`]: {{site.dart-site}}/tools/diagnostic-messages#unnecessary_non_null_assertion
[`unnecessary_null_checks`]: {{site.dart-site}}/tools/linter-rules#unnecessary_null_checks
[`unnecessary_null_in_if_null_operators`]: {{site.dart-site}}/tools/linter-rules#unnecessary_null_in_if_null_operators
[`unnecessary_nullable_for_final_variable_declarations`]: {{site.dart-site}}/tools/linter-rules#unnecessary_nullable_for_final_variable_declarations
[`AutofillGroup.maybeOf`]: {{site.api}}/flutter/widgets/AutofillGroup/maybeOf.html
[`AutofillGroup.of`]: {{site.api}}/flutter/widgets/AutofillGroup/of.html
[`DefaultTabController.maybeOf`]: {{site.api}}/flutter/material/DefaultTabController/maybeOf.html
[`DefaultTabController.of`]: {{site.api}}/flutter/material/DefaultTabController/of.html
[`DefaultTextHeightBehavior.maybeOf`]: {{site.api}}/flutter/widgets/DefaultTextHeightBehavior/maybeOf.html
[`DefaultTextHeightBehavior.of`]: {{site.api}}/flutter/widgets/DefaultTextHeightBehavior/of.html
[`Form.maybeOf`]: {{site.api}}/flutter/widgets/Form/maybeOf.html
[`Form.of`]: {{site.api}}/flutter/widgets/Form/of.html
[`HeroControllerScope.maybeOf`]: {{site.api}}/flutter/widgets/HeroControllerScope/maybeOf.html
[`HeroControllerScope.of`]: {{site.api}}/flutter/widgets/HeroControllerScope/of.html
[`InheritedWidget`]: {{site.api}}/flutter/widgets/InheritedWidget-class.html
[`Material.maybeOf`]: {{site.api}}/flutter/material/Material/maybeOf.html
[`Material.of`]: {{site.api}}/flutter/material/Material/of.html
[`Overlay.maybeOf`]: {{site.api}}/flutter/widgets/Overlay/maybeOf.html
[`Overlay.of`]: {{site.api}}/flutter/widgets/Overlay/of.html
[`PageStorage.maybeOf`]: {{site.api}}/flutter/widgets/PageStorage/maybeOf.html
[`PageStorage.of`]: {{site.api}}/flutter/widgets/PageStorage/of.html
[`PrimaryScrollController.maybeOf`]: {{site.api}}/flutter/widgets/PrimaryScrollController/maybeOf.html
[`PrimaryScrollController.of`]: {{site.api}}/flutter/widgets/PrimaryScrollController/of.html
[`RenderAbstractViewport.maybeOf`]: {{site.api}}/flutter/rendering/RenderAbstractViewport/maybeOf.html
[`RenderAbstractViewport.of`]: {{site.api}}/flutter/rendering/RenderAbstractViewport/of.html
[`RestorationScope.maybeOf`]: {{site.api}}/flutter/widgets/RestorationScope/maybeOf.html
[`RestorationScope.of`]: {{site.api}}/flutter/widgets/RestorationScope/of.html
[`Scrollable.maybeOf`]: {{site.api}}/flutter/widgets/Scrollable/maybeOf.html
[`Scrollable.of`]: {{site.api}}/flutter/widgets/Scrollable/of.html
[`ScrollNotificationObserver.maybeOf`]: {{site.api}}/flutter/widgets/ScrollNotificationObserver/maybeOf.html
[`ScrollNotificationObserver.of`]: {{site.api}}/flutter/widgets/ScrollNotificationObserver/of.html
[Add `maybeOf` for all the cases when `of` returns nullable]: {{site.repo.flutter}}/pull/114120
[Add `Overlay.maybeOf`, make `Overlay.of` return a non-nullable instance]: {{site.repo.flutter}}/pull/110811
