---
# title: The generic type of ParentDataWidget changed to ParentData
title: ParentDataWidget 的通用类型更改为 ParentData
# description: The ParentDataWidget is now bound to the ParentData type.
description: ParentDataWidget 现在已绑定到 ParentData 类型。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


The generic type of `ParentDataWidget` has changed from
`RenderObjectWidget` to `ParentData`.

“ParentDataWidget”的通用类型已从“RenderObjectWidget”更改为“ParentData”。


## Context

## 背景


Prior to this change, a `ParentDataWidget` was bound
to a specific `RenderObjectWidget` type as ancestor.
For example, a `Positioned` widget could only be used
within a `Stack` widget. With this change,
a `ParentDataWidget` can be used with any
`RenderObjectWidget` type as ancestor as long as
the `RenderObject` of said `RenderObjectWidget`
sets up the correct `ParentData` type. In this new world,
the `Positioned` widget can be reused with a hypothetical
new `SuperStack` widget.

在此更改之前，“ParentDataWidget”作为祖先绑定到特定的“RenderObjectWidget”类型。例如，“Positioned”widget 只能在“Stack”widget 中使用。通过此更改，只要所述“RenderObjectWidget”的“RenderObject”设置正确的“ParentData”类型，“ParentDataWidget”就可以与任何“RenderObjectWidget”类型一起使用作为祖先。在这个新世界中，“Positioned”widget 可以与假设的新“SuperStack”widget 一起重用。


## Description of change

## 变更说明


The generic type argument of `ParentDataWidget`
has changed from `RenderObjectWidget` to `ParentData`,
and a new debug property, `debugTypicalAncestorWidgetClass`,
is added to `ParentDataWidget`.
The latter is used for error messages to give users a
better idea of the context a given `ParentDataWidget`
is supposed to be used in.

“ParentDataWidget”的通用类型参数已从“RenderObjectWidget”更改为“ParentData”，并且新的调试属性“debugTypicalAncestorWidgetClass”已添加到“ParentDataWidget”。后者用于错误消息，让用户更好地了解给定的“ParentDataWidget”应该使用的上下文。


## Migration guide

## 迁移指南


You must migrate your code as described in this section
if you're subclassing or implementing `ParentDataWidget`.
If you do, the analyzer shows the following warnings when you
upgrade to the Flutter version that includes this change:

如果你要子类化或实现“ParentDataWidget”，则必须按照本节中所述迁移代码。如果这样做，当你升级到包含此更改的 Flutter 版本时，分析器会显示以下警告：


```plaintext
  error • Missing concrete implementation of 'getter ParentDataWidget.debugTypicalAncestorWidgetClass' • lib/main.dart:114:7 • non_abstract_class_inherits_abstract_member
  error • 'FrogJar' doesn't extend 'ParentData' • lib/main.dart:114:41 • type_argument_not_matching_bounds
```

Code before migration:

迁移前的代码：


```dart
class FrogSize extends ParentDataWidget<FrogJar> {
  FrogSize({
    Key key,
    required this.size,
    required Widget child,
  }) : assert(child != null),
        assert(size != null),
        super(key: key, child: child);

  final Size size;

  @override
  void applyParentData(RenderObject renderObject) {
    final FrogJarParentData parentData = renderObject.parentData;
    if (parentData.size != size) {
      parentData.size = size;
      final RenderFrogJar targetParent = renderObject.parent;
      targetParent.markNeedsLayout();
    }
  }
}

class FrogJarParentData extends ParentData {
  Size size;
}

class FrogJar extends RenderObjectWidget {
  // ...
}
```

Code after migration:

迁移后的代码：


```dart
class FrogSize extends ParentDataWidget<FrogJarParentData> { // FrogJar changed to FrogJarParentData
  FrogSize({
    Key key,
    required this.size,
    required Widget child,
  }) : assert(child != null),
        assert(size != null),
        super(key: key, child: child);

  final Size size;

  @override
  void applyParentData(RenderObject renderObject) {
    final FrogJarParentData parentData = renderObject.parentData;
    if (parentData.size != size) {
      parentData.size = size;
      final RenderFrogJar targetParent = renderObject.parent;
      targetParent.markNeedsLayout();
    }
  }

  @override
  Type get debugTypicalAncestorWidgetClass => FrogJar; // Newly added
}
```

The generic type of the `ParentDataWidget` superclass
changes from `FrogJar` (a `RenderObjectWidget`) to
`FrogJarParentData` (the `ParentData` type that
`FrogSize.applyParentData` wants to operate on).
Additionally, the new `debugTypicalAncestorWidgetClass`
is implemented for this `ParentDataWidget` subclass.
It returns the type of a typical ancestor `RenderObjectWidget`
for this `ParentDataWidget`. Most of the time,
you just want to return the old generic type here
(`FrogJar` in this example).

“ParentDataWidget”超类的通用类型从“FrogJar”（“RenderObjectWidget”）更改为“FrogJarParentData”（“FrogSize.applyParentData”想要操作的“ParentData”类型）。此外，还为此“ParentDataWidget”子类实现了新的“debugTypicalAncestorWidgetClass”。它返回此“ParentDataWidget”的典型祖先“RenderObjectWidget”的类型。大多数时候，你只想在此处返回旧的泛型类型（本例中为“FrogJar”）。


## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


API documentation:

API 文档：


* [`ParentDataWidget`][]

  [`ParentDataWidget`][]


Relevant PR:

相关公关：


* [Make ParentDataWidget usable with different ancestor RenderObjectWidget types][]

  [使 ParentDataWidget 可与不同祖先 RenderObjectWidget 类型一起使用][Make ParentDataWidget usable with different ancestor RenderObjectWidget types]



[Make ParentDataWidget usable with different ancestor RenderObjectWidget types]: {{site.repo.flutter}}/pull/48541
[`ParentDataWidget`]: {{site.api}}/flutter/widgets/ParentDataWidget-class.html
