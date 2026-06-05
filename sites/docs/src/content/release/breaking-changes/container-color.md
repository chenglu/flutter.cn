---
# title: Container with color optimization
title: 具有颜色优化的容器
# description: >
#   A container with a color and no other background decoration
#   no longer builds the same child widgets.
description: >-
  具有颜色且没有其他背景装饰的容器不再构建相同的子 widgets。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


A new `ColoredBox` widget has been added to the framework,
and the `Container` widget has been optimized to use it
if a user specifies a `color` instead of a `decoration`.

新的 `ColoredBox` widget 已添加到框架中，并且 `Container` widget 已经过优化，可以在用户指定 `color` 而不是 `decoration` 时使用它。


## Context

## 背景


It is very common to use the `Container` widget as follows:

使用 `Container` widget 是很常见的，如下所示：


```dart
return Container(color: Colors.red);
```

Previously, this code resulted in a widget hierarchy that used a
`BoxDecoration` to actually paint the background color.
The `BoxDecoration` widget covers many cases other than
just painting a background color,
and is not as efficient as the new `ColoredBox` widget,
which only paints a background color.

以前，此代码生成 widget 层次结构，该层次结构使用 `BoxDecoration` 来实际绘制背景颜色。 `BoxDecoration` widget 涵盖了除仅绘制背景颜色之外的许多情况，并且不如新的 `ColoredBox` widget 高效，后者仅绘制背景颜色。


Widget tests that wanted to assert based on the color
of a container in the widget tree would previously have
to find the `BoxDecoration` to actually get
the color of the container.
Now, they are able to check the `color` property
on the `Container` itself, unless a `BoxDecoration`
was explicitly provided as the `decoration` property.
It is still an error to supply both `color` and
`decoration` to `Container`.

想要根据 widget 树中容器的颜色进行断言的 Widget 测试之前必须找到 `BoxDecoration` 才能实际获取容器的颜色。现在，他们可以检查 `Container` 本身的 `color` 属性，除非明确提供 `BoxDecoration` 作为 `decoration` 属性。将 `color` 和 `decoration` 提供给 `Container` 仍然是一个错误。


## Migration guide

## 迁移指南


Tests that assert on the color of a `Container`
or that expected it to create a
`BoxDecoration` need to be modified.

需要修改断言 `Container` 颜色或期望其创建 `BoxDecoration` 的测试。


Code before migration:

迁移前的代码：


```dart
testWidgets('Container color', (WidgetTester tester) async {
  await tester.pumpWidget(Container(color: Colors.red));

  final Container container = tester.widgetList<Container>().first;
  expect(container.decoration.color, Colors.red);
  // Or, a test may have specifically looked for the BoxDecoration, e.g.:
  expect(find.byType(BoxDecoration), findsOneWidget);
});
```

Code after migration:

迁移后的代码：


```dart
testWidgets('Container color', (WidgetTester tester) async {
  await tester.pumpWidget(Container(color: Colors.red));

  final Container container = tester.widgetList<Container>().first;
  expect(container.color, Colors.red);
  // If your test needed to work directly with the BoxDecoration, it should
  // instead look for the ColoredBox, e.g.:
  expect(find.byType(BoxDecoration), findsNothing);
  expect(find.byType(ColoredBox), findsOneWidget);
});
```

## Timeline

## 时间线


Landed in version: 1.15.4<br>
登陆版本：1.15.4
In stable release: 1.17
稳定版本：1.17

## References

## 参考资料


API documentation:

API 文档：


* [`Container`][]
* [`ColoredBox`][]
* [`BoxDecoration`][]

Relevant issues:

相关 issue：


* [Issue 9672][]

  [问题 9672][Issue 9672]

* [Issue 28753][]

  [问题 28753][Issue 28753]


Relevant PR:

相关 PR：


* [Colored box and container optimization #50979][]

  [彩色盒子和容器优化#50979][Colored box and container optimization #50979]


[`Container`]: {{site.api}}/flutter/widgets/Container-class.html
[`ColoredBox`]: {{site.api}}/flutter/widgets/ColoredBox-class.html
[`BoxDecoration`]: {{site.api}}/flutter/painting/BoxDecoration-class.html
[Issue 9672]: {{site.repo.flutter}}/issues/9672
[Issue 28753]: {{site.repo.flutter}}/issues/28753
[Colored box and container optimization #50979]: {{site.repo.flutter}}/pull/50979
