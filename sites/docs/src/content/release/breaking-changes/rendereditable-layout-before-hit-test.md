---
# title: The RenderEditable needs to be laid out before hit testing
title: RenderEditable 需要在命中测试之前进行布局
# description: >
#   The hit testing of RenderEditable requires additional information
#   that is only available after the layout.
description: >
  RenderEditable 的命中测试需要仅在布局之后可用的附加信息。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Instances of `RenderEditable` must be laid out before processing hit
testing. Trying to hit-test a `RenderEditable` object before layout
results in an assertion such as the following:

必须在处理命中测试之前布置“RenderEditable”的实例。尝试在布局之前对“RenderEditable”对象进行命中测试会产生如下断言：


```plaintext
Failed assertion: line 123 pos 45: '!debugNeedsLayout': is not true.
```

## Context

## 背景


To support gesture recognizers in selectable text, the
`RenderEditable` requires the layout information for its
text spans to determine which text span receives the
pointer event. (Before this change, `RenderEditable` objects
didn't take their text into account when evaluating hit tests.)
To implement this, layout was made a prerequisite for performing
hit testing on a `RenderEditable` object.

为了支持可选文本中的手势识别器，“RenderEditable”需要其文本范围的布局信息来确定哪个文本范围接收指针事件。 （在此更改之前，“RenderEditable”对象在评估命中测试时不会考虑其文本。）为了实现这一点，布局是对“RenderEditable”对象执行命中测试的先决条件。


In practice, this is rarely an issue. The widget library
ensures that layout is performed before any hit test on all
render objects. This problem is only likely to be seen in
code that directly interacts with render objects, for
example in tests of custom render objects.

实际上，这很少是一个问题。widget 库确保在对所有渲染对象进行任何命中测试之前执行布局。此问题仅可能在直接与渲染对象交互的代码中出现，例如在自定义渲染对象的测试中。


## Migration guide

## 迁移指南


If you see the `'!debugNeedsLayout': is not true`
assertion error while hit testing the `RenderEditable`,
lay out the `RenderEditable` before doing so.

如果你在测试“RenderEditable”时看到“'!debugNeedsLayout': is not true”断言错误，请在执行此操作之前布局“RenderEditable”。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('attach and detach correctly handle gesture', () {
    final RenderEditable editable = RenderEditable(
      textDirection: TextDirection.ltr,
      offset: ViewportOffset.zero(),
      textSelectionDelegate: FakeEditableTextState(),
      startHandleLayerLink: LayerLink(),
      endHandleLayerLink: LayerLink(),
    );
    final PipelineOwner owner = PipelineOwner(onNeedVisualUpdate: () {});
    editable.attach(owner);
    // This throws an assertion error because
    // the RenderEditable hasn't been laid out.
    editable.handleEvent(const PointerDownEvent(),
        BoxHitTestEntry(editable, const Offset(10, 10)));
    editable.detach();
  });
}

class FakeEditableTextState extends TextSelectionDelegate {
  @override
  TextEditingValue textEditingValue;
  @override
  void hideToolbar() {}
  @override
  void bringIntoView(TextPosition position) {}
}
```

Code after migration:

迁移后的代码：


```dart
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main() {
  test('attach and detach correctly handle gesture', () {
    final RenderEditable editable = RenderEditable(
      textDirection: TextDirection.ltr,
      offset: ViewportOffset.zero(),
      textSelectionDelegate: FakeEditableTextState(),
      startHandleLayerLink: LayerLink(),
      endHandleLayerLink: LayerLink(),
    );
    // Lay out the RenderEditable first.
    editable.layout(BoxConstraints.loose(const Size(1000.0, 1000.0)));
    final PipelineOwner owner = PipelineOwner(onNeedVisualUpdate: () {});
    editable.attach(owner);
    editable.handleEvent(const PointerDownEvent(),
        BoxHitTestEntry(editable, const Offset(10, 10)));
    editable.detach();
  });
}

class FakeEditableTextState extends TextSelectionDelegate {
  @override
  TextEditingValue textEditingValue;
  @override
  void hideToolbar() {}
  @override
  void bringIntoView(TextPosition position) {}
}
```

## Timeline

## 时间轴


Landed in version: 1.18.0<br>
In stable release: 1.20

登陆版本：1.18.0<br>稳定版本：1.20


## References

## 参考


API documentation:

API 文档：


* [`RenderEditable`][]


Relevant issue:

相关问题：


* [Issue 43494][]: SelectableText.rich used along with

  [问题 43494][Issue 43494]：SelectableText.rich 与以下命令一起使用

TapGestureRecognizer isn't working

TapGestureRecognizer 无法工作


Relevant PR:

相关公关：


* [PR 54479: Enable gesture recognizer in selectable rich text][]


[Issue 43494]: {{site.repo.flutter}}/issues/43494
[`RenderEditable`]: {{site.api}}/flutter/rendering/RenderEditable-class.html
[PR 54479: Enable gesture recognizer in selectable rich text]: {{site.repo.flutter}}/pull/54479
