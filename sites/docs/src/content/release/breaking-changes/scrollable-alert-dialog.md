---
# title: Scrollable AlertDialog (No longer deprecated)
title: 可滚动警报对话框（不再弃用）
# description: AlertDialog should scroll automatically when it overflows.
description: AlertDialog 溢出时应自动滚动。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


:::note
`AlertDialog.scrollable` is no longer deprecated because there is
`AlertDialog.scrollable` 不再被弃用，因为

no backwards-compatible way to make `AlertDialog` scrollable by default.
默认情况下没有向后兼容的方式使“AlertDialog”可滚动。

Instead, the parameter will remain and you can set `scrollable`
相反，该参数将保留，你可以设置“scrollable”

to true if you want a scrollable `AlertDialog`.
如果你想要一个可滚动的“AlertDialog”，则为 true。

:::

An `AlertDialog` now scrolls automatically when it overflows.

现在，“AlertDialog”在溢出时会自动滚动。


## Context

## 背景


Before this change,
when an `AlertDialog` widget's contents were too tall,
the display overflowed, causing the contents to be clipped.
This resulted in the following issues:

在此更改之前，当“AlertDialog”widget 的内容太高时，显示会溢出，导致内容被裁剪。这导致了以下问题：


* There was no way to view the portion of the content that was clipped.

  无法查看被剪辑的内容部分。

* Most alert dialogs have buttons beneath the content to prompt users for

  大多数警报对话框在内容下方都有按钮来提示用户

actions. If the content overflowed, obscuring the buttons,
users might be unaware of their existence.

行动。如果内容溢出，遮盖了按钮，用户可能不会意识到它们的存在。


## Description of change

## 变更说明


The previous approach listed the title and content
widgets consecutively in a `Column` widget.

之前的方法在“Column”widget 中连续列出了标题和内容 widget。


```dart
Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    if (title != null)
      Padding(
        padding: titlePadding ?? EdgeInsets.fromLTRB(24, 24, 24, content == null ? 20 : 0),
        child: DefaultTextStyle(
          style: titleTextStyle ?? dialogTheme.titleTextStyle ?? theme.textTheme.title,
          child: Semantics(
          child: title,
          namesRoute: true,
          container: true,
          ),
        ),
      ),
    if (content != null)
      Flexible(
        child: Padding(
        padding: contentPadding,
        child: DefaultTextStyle(
          style: contentTextStyle ?? dialogTheme.contentTextStyle ?? theme.textTheme.subhead,
          child: content,
        ),
      ),
    ),
    // ...
  ],
);
```

The new approach wraps both widgets in a
`SingleChildScrollView` above the button bar,
making both widgets part of the same scrollable
and exposing the button bar at the bottom of the dialog.

新方法将两个 widget 包装在按钮栏上方的“SingleChildScrollView”中，使两个 widget 成为同一可滚动部件的一部分，并在对话框底部暴露按钮栏。


```dart
Column(
  mainAxisSize: MainAxisSize.min,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: <Widget>[
    if (title != null || content != null)
      SingleChildScrollView(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
         children: <Widget>[
           if (title != null)
             titleWidget,
             if (content != null)
             contentWidget,
         ],
       ),
     ),
   // ...
  ],
),
```

## Migration guide

## 迁移指南


You might see the following issues as a result of this change:

由于此更改，你可能会看到以下问题：


**Semantics tests might fail because of the addition of a `SingleChildScrollView`.**
: Manual testing of the `Talkback` and `VoiceOver` features
show that they still exhibit the same (correct)
behavior as before.

**由于添加了“SingleChildScrollView”，语义测试可能会失败。**：“Talkback”和“VoiceOver”功能的手动测试表明它们仍然表现出与以前相同（正确）的行为。


**Golden tests might fail.**
: This change might have caused diffs in (previously passing)
golden tests since the `SingleChildScrollView` now nests both the
title and content widgets.
Some Flutter projects have taken to creating semantics tests
by taking goldens of semantics nodes used in Flutter's debug build.

**黄金测试可能会失败。**：此更改可能会导致（之前通过的）黄金测试出现差异，因为“SingleChildScrollView”现在嵌套了标题和内容 widget。一些 Flutter 项目已经开始通过使用 Flutter 调试构建中使用的黄金语义节点来创建语义测试。


  <br>Any semantics golden updates that reflect the scrolling
container addition are expected and these diffs should be safe to accept.

预计会添加容器，并且这些差异应该可以安全地接受。


Sample resulting Semantics tree:

生成的语义树示例：


```plaintext
flutter:        ├─SemanticsNode#30 <-- SingleChildScrollView
flutter:          │ flags: hasImplicitScrolling
flutter:          │ scrollExtentMin: 0.0
flutter:          │ scrollPosition: 0.0
flutter:          │ scrollExtentMax: 0.0
flutter:          │
flutter:          ├─SemanticsNode#31 <-- title
flutter:          │   flags: namesRoute
flutter:          │   label: `Hello`
flutter:          │
flutter:          └─SemanticsNode#32 <-- contents
flutter:              label: "Huge content"
```

**Layout changes might result because of the scroll view.**
: If the dialog was already overflowing,
this change corrects the problem.
This layout change is expected.

**由于滚动视图，可能会导致布局更改。**：如果对话框已经溢出，此更改可以纠正问题。这种布局变化是预料之中的。


  <br>A nested `SingleChildScrollView` in `AlertDialog.content`
should work properly if left in the code,
but should be removed if unintended, since
it might cause confusion.

如果留在代码中应该可以正常工作，但如果无意，则应将其删除，因为它可能会导致混乱。


Code before migration:

迁移前的代码：


```dart
AlertDialog(
  title: Text(
    'Very, very large title that is also scrollable',
    textScaleFactor: 5,
  ),
  content: SingleChildScrollView( // won't be scrollable
    child: Text('Scrollable content', textScaleFactor: 5),
  ),
  actions: <Widget>[
    TextButton(child: Text('Button 1'), onPressed: () {}),
    TextButton(child: Text('Button 2'), onPressed: () {}),
  ],
)
```

Code after migration:

迁移后的代码：


```dart
AlertDialog(
  title: Text('Very, very large title', textScaleFactor: 5),
  content: Text('Very, very large content', textScaleFactor: 5),
  actions: <Widget>[
    TextButton(child: Text('Button 1'), onPressed: () {}),
    TextButton(child: Text('Button 2'), onPressed: () {}),
  ],
)
```

## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


Design doc:

设计文档：


* [Scrollable `AlertDialog`][]

  [可滚动 `AlertDialog`][`AlertDialog`]


API documentation:

API 文档：


* [`AlertDialog`][]


Relevant issue:

相关问题：


* [Overflow exceptions with maximum accessibility font size][]


Relevant PRs:

相关 PR：


* [Update to `AlertDialog.scrollable`][]

  [更新为 `AlertDialog.scrollable`][Update to `AlertDialog.scrollable`]

* [Original attempt to implement scrollable `AlertDialog`][]

  [最初尝试实现可滚动的 `AlertDialog`][`AlertDialog`]

* [Revert of original attempt to implement scrollable `AlertDialog`][]

  [恢复最初尝试实现可滚动的“AlertDialog”][`AlertDialog`]


[`AlertDialog`]: {{site.api}}/flutter/material/AlertDialog-class.html
[Original attempt to implement scrollable `AlertDialog`]: {{site.repo.flutter}}/pull/43226
[Overflow exceptions with maximum accessibility font size]: {{site.repo.flutter}}/issues/42696
[Revert of original attempt to implement scrollable `AlertDialog`]: {{site.repo.flutter}}/pull/44003
[Scrollable `AlertDialog`]: /go/scrollable-alert-dialog
[Update to `AlertDialog.scrollable`]: {{site.repo.flutter}}/pull/45079
