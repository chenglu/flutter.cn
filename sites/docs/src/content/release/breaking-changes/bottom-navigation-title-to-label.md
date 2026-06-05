---
# title: Bottom Navigation Title To Label
title: 底部导航标题到标签
# description: >
#   Deprecated BottomNavigationBarItem's title (a Widget) in
#   favor of label (a String).
description: >-
  已弃用 BottomNavigationBarItem 的标题（Widget），改用标签（字符串）。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`BottomNavigationBarItem.title` gives a deprecation warning,
or no longer exists when referenced in code.

`BottomNavigationBarItem.title` 给出弃用警告，或者在代码中引用时不再存在。


## Context

## 背景


`BottomNavigationBarItem`s `title` parameter was deprecated
in favor of `label`. This change was necessary to improve
the user experience of `BottomNavigationBar`s when the text
scale factor is increased. Items in a `BottomNavigationBar`
now show tooltips on long press. Accomplishing this
requires a `String` parameter on `BottomNavigationBarItem`s.

`BottomNavigationBarItem`s `title` 参数已弃用，取而代之的是 `label`。当文本比例因子增加时，为了改善 `BottomNavigationBar`s 的用户体验，此更改是必要的。 `BottomNavigationBar` 中的项目现在在长按时显示工具提示。完成此操作需要 `BottomNavigationBarItem`s 上的 `String` 参数。


## Description of change

## 变更说明


The `BottomNavigationBarItem` class has a `title` parameter,
which is a `Widget`. This made it impossible for the
`BottomNavigationBar` to show `Tooltip` widgets,
a change that was necessary to improve the accessibility experience.
Now, instead of building the `BottomNavigationBarItem.title`
widget, the BottomNavigationBar wraps the
`BottomNavigationBarItem.label` in a Text widget and builds that.

`BottomNavigationBarItem` 类有一个 `title` 参数，它是 `Widget`。这使得 `BottomNavigationBar` 无法显示 `Tooltip` widgets，这是改善辅助功能体验所必需的更改。现在，BottomNavigationBar 将 `BottomNavigationBarItem.label` 包装在文本 widget 中并构建它，而不是构建 `BottomNavigationBarItem.title` widget 。


## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```dart
BottomNavigationBarItem(
  icon: Icons.add,
  title: Text('add'),
)
```

Code after migration:

迁移后的代码：


```dart
BottomNavigationBarItem(
  icon: Icons.add,
  label: 'add',
)
```

## Timeline

## 时间线


Landed in version: 1.22.0<br>
登陆版本：1.22.0
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


API documentation:

API 文档：


* [`BottomNavigationBarItem`][]

Relevant PRs:

相关 PR：


* [PR 60655][]: Clean up hero controller scope

  [PR 60655][]：清理英雄控制器范围

* [PR 59127][]: Update BottomNavigationBar to show tooltips on long press.

  [PR 59127][]：更新 BottomNavigationBar 以在长按时显示工具提示。


Breaking change proposal:

重大变更提案：


* [Breaking Change: Bottom Navigation Item Title][]

  [重大变化：底部导航项目标题][Breaking Change: Bottom Navigation Item Title]



[`BottomNavigationBarItem`]: {{site.api}}/flutter/widgets/BottomNavigationBarItem-class.html
[Breaking Change: Bottom Navigation Item Title]: /go/bottom-navigation-bar-title-deprecation
[PR 59127]: {{site.repo.flutter}}/pull/59127
[PR 60655]: {{site.repo.flutter}}/pull/60655
