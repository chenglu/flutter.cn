---
# title: Updated EditableText scroll into view behavior
title: 更新 EditableText 滚动到可见区域的行为
# description: >
#   Improve EditableText selection scroll into view behavior to always
#   use the current selection extent.
description: >
  改进 EditableText 选区滚动到可见区域的行为，
  始终使用当前选区范围。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `Editable.onCaretChanged` callback is removed. With this change,
`EditableText` behavior for scrolling the selection into view
changes.

`Editable.onCaretChanged` 回调已被移除。
随着此变更，`EditableText` 将选区滚动到可见区域的行为也发生了变化。

## Context

## 背景

Previously, upon scrolling into view to show user updates, `EditableText`
used multiple mechanisms to determine the extent of the selection or the
caret location.

此前，在滚动到可见区域以显示用户更新时，`EditableText`
使用多种机制来确定选区范围或光标位置。

## Description of change

## 变更说明

By removing the `Editable.onCaretChanged` callback, `EditableText` will always
use the most up-to-date selection extent location when scrolling to show it.
Specifically, this improves scroll into view behavior after
changing selection from collapsed to non-collapsed using
`userUpdateTextEditingValue()`.

通过移除 `Editable.onCaretChanged` 回调，`EditableText` 在滚动显示选区时
将始终使用最新的选区范围位置。
具体而言，这改进了使用 `userUpdateTextEditingValue()` 将选区
从折叠状态变为非折叠状态后的滚动到可见区域行为。

## Timeline

## 时间线

Landed in version: 3.12.0-4.0.pre<br>
In stable release: 3.13.0

合入版本：3.12.0-4.0.pre<br>
稳定版发布：3.13.0

## References

## 参考资料

API documentation:

API 文档：

* [`EditableText`]({{site.api}}/flutter/widgets/EditableText-class.html)

Relevant PRs:

相关 PR：

* [109114: Remove Editable.onCaretChanged callback]({{site.repo.flutter}}/pull/109114)

  109114：移除 Editable.onCaretChanged 回调
