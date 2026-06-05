---
# title: TextField FocusNode attach location change
title: TextField FocusNode 附着位置变更
# description: >
#   EditableText.focusNode is no longer attached to
#   EditableTextState's BuildContext.
description: >
  EditableText.focusNode 不再附着到
  EditableTextState 的 BuildContext。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

`EditableText.focusNode` is now attached to
a dedicated `Focus` widget below `EditableText`.

`EditableText.focusNode` 现在附着到
`EditableText` 下方专用的 `Focus` widget。

## Context

## 背景

A text input field widget (`TextField`, for example)
typically owns a `FocusNode`.
When that `FocusNode` is the primary focus of the app,
events (such as key presses) are sent to the `BuildContext`
to which the `FocusNode` is attached.

文本输入字段 widget（例如 `TextField`）通常拥有一个 `FocusNode`。
当该 `FocusNode` 是应用的主焦点时，
事件（如按键）会发送到 `FocusNode` 所附着的 `BuildContext`。

The `FocusNode` also plays a roll in shortcut handling:
The `Shortcuts` widget translates key sequences into an `Intent`, and
tries to find the first suitable handler for that `Intent` starting from
the `BuildContext` to which the `FocusNode` is attached, to
the root of the widget tree. This means an `Actions` widget (that provides
handlers for different `Intent`s) won't be able to
handle any shortcut `Intent`s when the `BuildContext` that
has the primary focus is above it in the tree.

`FocusNode` 在快捷键处理中也发挥作用：
`Shortcuts` widget 将按键序列转换为 `Intent`，
并尝试从 `FocusNode` 所附着的 `BuildContext` 开始，
沿 widget 树向上查找该 `Intent` 的第一个合适处理器。
这意味着当拥有主焦点的 `BuildContext` 位于树上方的位置时，
`Actions` widget（为不同 `Intent` 提供处理器）将无法处理任何快捷键 `Intent`。

Previously for `EditableText`, the `FocusNode` was attached to
the `BuildContext` of `EditableTextState`.
Any `Actions` widgets defined in `EditableTextState` (which will be inflated
below the `BuildContext` of the `EditableTextState`) couldn't handle
shortcuts even when that `EditableText` was focused, for
the reason stated above.

此前，对于 `EditableText`，`FocusNode` 附着到
`EditableTextState` 的 `BuildContext`。
在 `EditableTextState` 中定义的任何 `Actions` widget
（会在 `EditableTextState` 的 `BuildContext` 下方展开）
即使在该 `EditableText` 获得焦点时也无法处理快捷键，
原因如上所述。

## Description of change

## 变更说明

`EditableTextState` now creates a dedicated `Focus` widget to
host `EditableText.focusNode`.
This allows `EditableTextState`s to define handlers for shortcut `Intent`s.
For instance, `EditableText` now has a handler that
handles the "deleteCharacter" intent
when the <kbd>DEL</kbd> key is pressed.

`EditableTextState` 现在会创建专用的 `Focus` widget
来承载 `EditableText.focusNode`。
这使 `EditableTextState` 能够为快捷键 `Intent` 定义处理器。
例如，`EditableText` 现在有一个处理器，
在按下 <kbd>DEL</kbd> 键时处理 "deleteCharacter" intent。

This change does not involve any public API changes but
breaks codebases relying on that particular implementation detail to
tell if a `FocusNode` is associated with a text input field.

此变更不涉及任何公共 API 变更，
但会破坏依赖该实现细节来判断 `FocusNode` 是否与文本输入字段关联的代码库。

This change does not break any builds but can introduce runtime issues, or
cause existing tests to fail.

此变更不会破坏任何构建，但可能引发运行时问题，
或导致现有测试失败。

## Migration guide

## 迁移指南

The `EditableText` widget takes a `FocusNode` as a parameter, which was
previously attached to its `EditableText`'s `BuildContext`. If you are relying
on runtime typecheck to find out if a `FocusNode` is attached to a text input
field or a selectable text field like so:

`EditableText` widget 接受 `FocusNode` 作为参数，
此前该 `FocusNode` 附着到其 `EditableText` 的 `BuildContext`。
如果你依赖运行时类型检查来判断 `FocusNode` 是否附着到文本输入字段
或可选中文本字段，例如：

- `focusNode.context.widget is EditableText`
- `(focusNode.context as StatefulElement).state as EditableTextState`

Then please read on and consider following the migration steps to avoid breakages.

请继续阅读并考虑遵循迁移步骤以避免中断。

If you're not sure whether a codebase needs migration,
search for `is EditableText`, `as EditableText`, `is EditableTextState`, and
`as EditableTextState` and verify if any of the search results are doing
a typecheck or typecast on a `FocusNode.context`.
If so, then migration is needed.

如果不确定代码库是否需要迁移，
请搜索 `is EditableText`、`as EditableText`、`is EditableTextState` 和
`as EditableTextState`，
并验证搜索结果中是否有对 `FocusNode.context` 进行类型检查或类型转换。
如有，则需要迁移。

To avoid performing a typecheck, or downcasting
the `BuildContext` associated with the `FocusNode` of interest, and
depending on the actual capabilities the codebase is trying to
invoke from the given `FocusNode`, fire an `Intent` from that `BuildContext`.
For instance, if you wish to update the text of the currently focused
`TextField` to a specific value, see the following example:

为避免对感兴趣的 `FocusNode` 关联的 `BuildContext` 进行类型检查或向下转型，
并根据代码库试图从给定 `FocusNode` 调用的实际能力，
从该 `BuildContext` 触发 `Intent`。
例如，如果你希望将当前获得焦点的 `TextField` 的文本
更新为特定值，请参阅以下示例：

Code before migration:

迁移前的代码：

```dart
final Widget? focusedWidget = primaryFocus?.context?.widget;
if (focusedWidget is EditableText) {
  widget.controller.text = 'Updated Text';
}
```

Code after migration:

迁移后的代码：

```dart
final BuildContext? focusedContext = primaryFocus?.context;
if (focusedContext != null) {
  Actions.maybeInvoke(focusedContext, ReplaceTextIntent('UpdatedText'));
}
```

For a comprehensive list of `Intent`s supported by the `EditableText` widget,
refer to the documentation of the `EditableText` widget.

有关 `EditableText` widget 支持的 `Intent` 完整列表，
请参阅 `EditableText` widget 的文档。

## Timeline

## 时间线

Landed in version: 2.6.0-12.0.pre<br>
In stable release: 2.10.0

合入版本：2.6.0-12.0.pre<br>
稳定版发布：2.10.0

## References

## 参考资料

API documentation:

API 文档：

* [`EditableText`][]

Relevant PR:

相关 PR：

* [Move text editing Actions to EditableTextState][]

  [将文本编辑 Actions 移至 EditableTextState][Move text editing Actions to EditableTextState]

[`EditableText`]: {{site.api}}/flutter/widgets/EditableText-class.html
[Move text editing Actions to EditableTextState]: {{site.repo.flutter}}/pull/90684
