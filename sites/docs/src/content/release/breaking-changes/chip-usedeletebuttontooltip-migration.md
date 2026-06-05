---
# title: Migrate useDeleteButtonTooltip to deleteButtonTooltipMessage of Chips
title: 迁移useDeleteButtonTooltip到Chips的deleteButtonTooltipMessage
# description: >
#   Deprecated useDeleteButtonTooltip of chips that have
#   a delete button in favor of deleteButtonTooltipMessage.
description: >-
  已弃用具有删除按钮的芯片的 useDeleteButtonTooltip，改为使用 deleteButtonTooltipMessage。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Using `useDeleteButtonTooltip` of any chip that has a delete button gives a
deprecation warning, or no longer exists when referenced. This includes the
`Chip`, `InputChip`, and `RawChip` widgets.

使用任何具有删除按钮的芯片的 `useDeleteButtonTooltip` 会发出弃用警告，或者在引用时不再存在。这包括 `Chip`、`InputChip` 和 `RawChip` widgets。


## Context

## 背景


The `useDeleteButtonTooltip` of `Chip`, `InputChip`, and `RawChip` widgets is
deprecated in favor of `deleteButtonTooltipMessage`, as the latter can be used
to disable the tooltip of the chip's delete button.

`Chip`、`InputChip` 和 `RawChip` widgets 的 `useDeleteButtonTooltip` 已弃用，取而代之的是 `deleteButtonTooltipMessage`，因为后者可用于禁用芯片删除按钮的工具提示。


## Description of change

## 变更说明


The `deleteButtonTooltipMessage` property provides a message to the
tooltip on the delete button of the chip widgets.
Subsequently, a change was made such that providing an empty string to this
property disables the tooltip.

`deleteButtonTooltipMessage` 属性向芯片 widgets 的删除按钮上的工具提示提供消息。随后，进行了更改，为此属性提供空字符串会禁用工具提示。


To avoid redundancy of the API, this change deprecated `useDeleteButtonTooltip`,
which was introduced for this exact functionality. A [Flutter fix][] is
available to help you migrate existing code from `useDeleteButtonTooltip` to
`deleteButtonTooltipMessage`, if you explicitly disabled the tooltip.

为了避免 API 冗余，此更改弃用了 `useDeleteButtonTooltip`，而该函数正是为此功能而引入的。一个[Flutter fix][]如果你明确禁用了工具提示，则可帮助你将现有代码从 `useDeleteButtonTooltip` 迁移到 `deleteButtonTooltipMessage`。


## Migration guide

## 迁移指南


By default, the tooltip of the delete button is always enabled.
To explicitly disable the tooltip, provide an empty string to the
`deleteButtonTooltipMessage` property.
The following code snippets show the migration changes, which are applicable for
`Chip`, `InputChip`, and `RawChip` widgets:

默认情况下，删除按钮的工具提示始终处于启用状态。要显式禁用工具提示，请向 `deleteButtonTooltipMessage` 属性提供一个空字符串。以下代码片段显示了迁移更改，这些更改适用于 `Chip`、`InputChip` 和 `RawChip` widgets：


Code before migration:

迁移前的代码：


```dart
Chip(
  label: const Text('Disabled delete button tooltip'),
  onDeleted: _handleDeleteChip,
  useDeleteButtonTooltip: false,
);

RawChip(
  label: const Text('Enabled delete button tooltip'),
  onDeleted: _handleDeleteChip,
  useDeleteButtonTooltip: true,
);
```

Code after migration:

迁移后的代码：


```dart
Chip(
  label: const Text('Disabled delete button tooltip'),
  onDeleted: _handleDeleteChip,
  deleteButtonTooltipMessage: '',
);

RawChip(
  label: const Text('Enabled delete button tooltip'),
  onDeleted: _handleDeleteChip,
);
```

## Timeline

## 时间线


Landed in version: 2.11.0-0.1.pre<br>
登陆版本：2.11.0-0.1.pre
In stable release: 3.0.0
稳定版本：3.0.0

## References

## 参考资料


API documentation:

API 文档：


* [`Chip`][]
* [`InputChip`][]
* [`RawChip`][]

Relevant PR:

相关 PR：


* [Deprecate `useDeleteButtonTooltip` for Chips][]

  [弃用芯片的 `useDeleteButtonTooltip`][Deprecate `useDeleteButtonTooltip` for Chips]


[`Chip`]: {{site.api}}/flutter/material/Chip-class.html
[`InputChip`]: {{site.api}}/flutter/material/InputChip-class.html
[`RawChip`]: {{site.api}}/flutter/material/RawChip-class.html

[Deprecate `useDeleteButtonTooltip` for Chips]: {{site.repo.flutter}}/pull/96174
[Flutter fix]: /tools/flutter-fix
