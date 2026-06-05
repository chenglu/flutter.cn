---
# title: Accessibility traversal order of tooltip changed
title: 工具提示的辅助功能遍历顺序已更改
# description: >-
#   The Tooltip widget's message now immediately follows the
#   Tooltip widget's child during accessibility traversal.
description: >
  现在，在辅助功能遍历期间，工具提示 widget 的消息立即跟随工具提示 widget 的子级。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


During accessibility focus traversal, `Tooltip.message` is
visited immediately after `Tooltip.child`.

在辅助功能焦点遍历期间，“Tooltip.message”在“Tooltip.child”之后立即被访问。


## Background

## 背景


The `Tooltip` widget usually wraps an interactive UI component such as a button,
and shows a help message when long pressed.
When the message is visible, assistive technologies should announce it after
the button.

“Tooltip”widget 通常包装交互式 UI 组件（例如按钮），并在长按时显示帮助消息。当消息可见时，辅助技术应在按钮后宣布该消息。


The `Tooltip` widget originally put `Tooltip.message` on
an `OverlayEntry` when long pressed.
As a result, `Tooltip.message` was not immediately after
`Tooltip.child` in the semantics tree.

“Tooltip”widget 最初在长按时将“Tooltip.message”放在“OverlayEntry”上。因此，在语义树中，“Tooltip.message”并不紧跟在“Tooltip.child”之后。


## Migration guide

## 迁移指南


This change moved the tooltip message in the semantics tree.
You might see accessibility test failures if
your tests expect a tooltip message to appear in a
specific location in the semantics tree, when it is visible.
Update any failing accessibility tests to adopt the new tooltip semantics order.

此更改移动了语义树中的工具提示消息。如果你的测试期望工具提示消息显示在语义树中的特定位置（当它可见时），你可能会看到可访问性测试失败。更新任何失败的可访问性测试以采用新的工具提示语义顺序。


For example, if you constructed the following widget tree in your test:

例如，如果你在测试中构建了以下 widget 树：


```dart
Directionality(
  textDirection: TextDirection.ltr,
  child: Overlay(
    initialEntries: <OverlayEntry>[
      OverlayEntry(
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              const Text('before'),
              Tooltip(
                key: tooltipKey,
                showDuration: const Duration(days: 365),
                message: 'message',
                child: const Text('child'),
              ),
              const Text('after'),
            ],
          );
        },
      ),
    ],
  ),
);
```

When the tooltip message is visible, the corresponding semantics tree before
this change should look like this:

当工具提示消息可见时，此更改之前相应的语义树应如下所示：


```dart
SemanticsNode#0
 │
 ├─SemanticsNode#1
 │ │
 │ └─SemanticsNode#5
 │   │ flags: hasImplicitScrolling
 │   │ scrollChildren: 3
 │   │
 │   ├─SemanticsNode#2
 │   │   tags: RenderViewport.twoPane
 │   │   label: `before`
 │   │   textDirection: ltr
 │   │
 │   ├─SemanticsNode#3
 │   │   tags: RenderViewport.twoPane
 │   │   label: `child`
 │   │   tooltip: `message`
 │   │   textDirection: ltr
 │   │
 │   └─SemanticsNode#4
 │       tags: RenderViewport.twoPane
 │       label: `after`
 │       textDirection: ltr
 │
 └─SemanticsNode#6
     label: `message`
     textDirection: ltr
```

After this change, the same widget tree generates a
slightly different semantics tree, as shown below.
Node #6 becomes a child of node #3, instead of node #0.

进行此更改后，相同的 widget 树会生成略有不同的语义树，如下所示。节点 #6 成为节点 #3 的子节点，而不是节点 #0。


```dart
SemanticsNode#0
 │
 └─SemanticsNode#1
   │
   └─SemanticsNode#5
     │ flags: hasImplicitScrolling
     │ scrollChildren: 3
     │
     ├─SemanticsNode#2
     │   tags: RenderViewport.twoPane
     │   label: `before`
     │   textDirection: ltr
     │
     ├─SemanticsNode#3
     │ │ tags: RenderViewport.twoPane
     │ │ label: `child`
     │ │ tooltip: `message`
     │ │ textDirection: ltr
     │ │
     │ └─SemanticsNode#6
     │     label: `message`
     │     textDirection: ltr
     │
     └─SemanticsNode#4
         tags: RenderViewport.twoPane
         label: `after`
         textDirection: ltr
```

## Timeline

## 时间轴


Landed in version: 3.16.0-11.0.pre<br>
In stable release: 3.19.0

登陆版本：3.16.0-11.0.pre<br> 稳定版本：3.19.0


## References

## 参考


API documentation:

API 文档：


* [`Tooltip`][]


Relevant PRs:

相关 PR：


* [OverlayPortal.overlayChild contributes semantics to OverlayPortal instead of Overlay][]

  [OverlayPortal.overlayChild 为 OverlayPortal 而不是 Overlay 贡献语义][OverlayPortal.overlayChild contributes semantics to OverlayPortal instead of Overlay]


[`Tooltip`]: {{site.api}}/flutter/material/Tooltip-class.html
[OverlayPortal.overlayChild contributes semantics to OverlayPortal instead of Overlay]: {{site.repo.flutter}}/pull/134921
