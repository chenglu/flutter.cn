---
# title: At least one clipboard data variant must be provided
title: 必须至少提供一种剪贴板数据变体
# description: >
#   In preparation for supporting multiple clipboard data variants,
#   at least one clipboard data variant must be provided.
description: >-
  为了准备支持多种剪贴板数据变体，必须至少提供一种剪贴板数据变体。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The [`ClipboardData constructor`][]'s `text` argument is no longer nullable.
Code that provides `null` to the `text` argument must be migrated to provide
an empty string `''`.

这[`ClipboardData constructor`][]的 `text` 参数不再可为空。必须迁移向 `text` 参数提供 `null` 的代码以提供空字符串 `''`。


## Context

## 背景


In preparation for supporting multiple clipboard data variants, the
`ClipboardData` constructor now requires that at least one data variant is
provided.

为了准备支持多种剪贴板数据变体，`ClipboardData` 构造函数现在要求至少提供一种数据变体。


Previously, platforms were inconsistent in how they handled `null`.
The behavior is now consistent across platforms. If you are interested
in the low-level details, see [PR 122446][].

以前，平台处理 `null` 的方式不一致。现在，该行为在各个平台上是一致的。如果你对底层细节感兴趣，请参阅[PR 122446][].


## Description of change

## 变更说明


The [`ClipboardData constructor`][]'s `text` argument is no longer nullable.

这[`ClipboardData constructor`][]的 `text` 参数不再可为空。


## Migration guide

## 迁移指南


To reset the text clipboard, use an empty string `''` instead of `null`.

要重置文本剪贴板，请使用空字符串 `''` 而不是 `null`。


Code before migration:

迁移前的代码：


```dart
void resetClipboard() {
  Clipboard.setData(ClipboardData(text: null));
}
```

Code after migration:

迁移后的代码：


```dart
void resetClipboard() {
  Clipboard.setData(ClipboardData(text: ''));
}
```

## Timeline

## 时间线


Landed in version: 3.10.0-9.0.pre<br>
登陆版本：3.10.0-9.0.pre
In stable release: 3.10.0
稳定版本：3.10.0

## References

## 参考资料


API documentation:

API 文档：


* [`Clipboard.setData`][]
* [`ClipboardData constructor`][]

Relevant PRs:

相关 PR：


* [Assert at least one clipboard data variant is provided][]

  [断言至少提供了一种剪贴板数据变体][Assert at least one clipboard data variant is provided]


[`ClipboardData constructor`]: {{site.api}}/flutter/services/ClipboardData/ClipboardData.html
[`Clipboard.setData`]: {{site.api}}/flutter/services/Clipboard/setData.html
[PR 122446]: {{site.repo.flutter}}/pull/122446
[Assert at least one clipboard data variant is provided]: {{site.repo.flutter}}/pull/122446
