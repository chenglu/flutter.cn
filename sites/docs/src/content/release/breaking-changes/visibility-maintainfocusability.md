---
# title: The Visibility widget is no longer focusable by default when maintainState is enabled
title: 当启用 MaintenanceState 时，默认情况下 Visibility widget 不再可聚焦
# description: >-
#   The Visibility widget by default no longer implicitly retains focusability
#   for its child when maintainState is enabled.
description: >-
  当启用维护状态时， Visibility widget 默认情况下不再隐式保留其子级的可聚焦性。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

This change was introduced to fix an issue
where an `IndexedStack`s hidden children would be focusable with keyboard events
(see [issue](https://github.com/flutter/flutter/issues/114213))
due to the underlying `Visibility` widgets default behavior.

引入此更改是为了修复 issue，其中 `IndexedStack`s 隐藏的子项可以通过键盘事件获得焦点（请参阅[issue](https://github.com/flutter/flutter/issues/114213)）由于底层 `Visibility` widgets 默认行为。


## Description of change

## 变更说明

The core change is the `Visibility` widget is no longer focusable by default
when `maintainState` is enabled.
A new flag, `maintainFocusability`, must be set to true with `maintainState`
for a hidden widget to remain focusable.

核心更改是当启用 `maintainState` 时，默认情况下 `Visibility` widget 不再可聚焦。新标志 `maintainFocusability` 必须使用 `maintainState` 设置为 true，隐藏的 widget 才能保持可聚焦。


## Migration guide

## 迁移指南

If your app has a `Visibility` widget that does not set `maintainState` to true,
then no changes are required.

如果你的应用程序具有 `Visibility` widget 且未将 `maintainState` 设置为 true，则无需进行任何更改。


If your app has a `Visibility` widget that sets `maintainState` to true
and you relied on the previous default behavior
that allowed you to focus your hidden widget,
you will need to set `maintainFocusability` to true.

如果你的应用程序有 `Visibility` widget 将 `maintainState` 设置为 true，并且你依赖于之前可以让隐藏 widget 获取焦点的默认行为，则需要将 `maintainFocusability` 设置为 true。


Code before migration:

迁移前的代码：


```dart
child: Visibility(
    maintainState: true,
    child: SomeWidget(),
)
```

Code after migration:

迁移后的代码：


```dart
child: Visibility(
    maintainState: true,
    maintainFocusability: true,
    child: SomeWidget(),
)
```

## Timeline

## 时间线


Landed in version: 3.34.0-pre<br>
登陆版本：3.34.0-pre
In stable release: 3.35
稳定版本：3.35

## References

## 参考资料


API documentation:

API 文档：


* [`Visibility`]({{site.api}}/flutter/widgets/Visibility-class.html)

Relevant issues:

相关 issue：


* [Issue 114213]({{site.repo.flutter}}/issues/114213)

Relevant PRs:

相关 PR：


* [PR 159133: Add flag to exclude focus for hidden children in Visibility, maintainFocusability. Set maintainFocusability to false in IndexedStack]({{site.repo.flutter}}/pull/159133)
