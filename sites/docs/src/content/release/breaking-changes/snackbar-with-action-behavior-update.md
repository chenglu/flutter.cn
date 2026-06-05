---
# title: SnackBar with action no longer auto-dismisses
title: 具有操作的 SnackBar 不再自动关闭
# description: >-
#   SnackBars with an action button now default to not auto-dismissing unless
#   manually dismissed by the user.
description: >
  带有操作按钮的 SnackBar 现在默认不会自动关闭，除非用户手动关闭。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


The default behavior of a [`SnackBar`][] with an action has changed.
Previously, a `SnackBar` with an action wouldn't
auto-dismiss if talkback was enabled.
Now, all `SnackBar` widgets with an action default to
a non-dismissible state until the user interacts with the action button.

具有操作的 [`SnackBar`][] 的默认行为已更改。以前，如果启用对讲，带有操作的“SnackBar”不会自动关闭。现在，所有具有操作的“SnackBar”widget 默认为不可关闭状态，直到用户与操作按钮交互。


## Context

## 背景


A `SnackBar` with an action button is now treated as
a more persistent notification that requires user interaction.
This change improves accessibility and user experience by ensuring that
critical notifications remain on the screen until they are acknowledged.

带有操作按钮的“SnackBar”现在被视为需要用户交互的更持久的通知。此更改可确保关键通知保留在屏幕上直至得到确认，从而提高了可访问性和用户体验。


## Description of change

## 变更说明


This change aligns with the Material 3 design specification for
the `SnackBar` component:

此更改符合“SnackBar”组件的 Material 3 设计规范：


* Old behavior: A `SnackBar` with an action button would auto-dismiss after a

  旧行为：带有操作按钮的“SnackBar”会在

duration unless talkback was enabled.

除非启用对讲，否则持续时间。

* New behavior: A `SnackBar` with an action button won't auto-dismiss;

  新行为：带有操作按钮的“SnackBar”不会自动关闭；

it remains on screen until dismissed by the user.

它保留在屏幕上，直到被用户关闭。


To override this behavior, an optional `persist` property has
been added to `SnackBar`.
When `persist` is `true`, the `SnackBar` won't auto-dismiss and
remains on screen until manually dismissed by the user.
When `false`, the `SnackBar` auto-dismisses after its standard duration,
regardless of the presence of an action.
When `null`, the `SnackBar` follows the default behavior,
which won't auto-dismiss if an action is present.

为了覆盖此行为，已将可选的“persist”属性添加到“SnackBar”。当“persist”为“true”时，“SnackBar”不会自动关闭并保留在屏幕上，直到用户手动关闭。当“false”时，“SnackBar”会在标准持续时间后自动关闭，无论是否存在操作。当“null”时，“SnackBar”遵循默认行为，如果存在操作，则不会自动关闭。


## Migration guide

## 迁移指南


To restore the old auto-dismiss behavior for a SnackBar with an action, set
`persist` to `false`.

要通过操作恢复 SnackBar 的旧自动关闭行为，请将“persist”设置为“false”。


Code before migration:

迁移前的代码：


```dart
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('This is a snackbar with an action.'),
    action: SnackBarAction(
      label: 'Action',
      onPressed: () {
        // Perform some action
      },
    ),
  ),
);
```

Code after migration:

迁移后的代码：


```dart highlightLines=4
ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: const Text('This is a snackbar with an action.'),
    persist: false, // Add this line to restore auto-dismiss behavior
    action: SnackBarAction(
      label: 'Action',
      onPressed: () {
        // Perform some action
      },
    ),
  ),
);
```

## Timeline

## 时间轴


Landed in version: 3.37.0-0.0.pre
In stable release: 3.38

登陆版本：3.37.0-0.0.pre 稳定版本：3.38


## References

## 参考


API documentation:

API 文档：


* [`SnackBar`][]


Relevant PRs:

相关 PR：


* [SnackBar with action no longer auto-dismisses][]

  [带有操作的 SnackBar 不再自动关闭][`SnackBar`]


[`SnackBar`]: {{site.api}}/flutter/material/SnackBar-class.html

[SnackBar with action no longer auto-dismisses]: {{site.repo.flutter}}/pull/173084
