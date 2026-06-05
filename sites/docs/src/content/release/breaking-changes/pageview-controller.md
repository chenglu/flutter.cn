---
# title: Make PageView.controller nullable
title: 将 PageView.controller 设为可空
# description: >-
#   PageView.controller is now nullable.
description: >-
  PageView.controller 现在可为 null。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

If a controller isn't provided in the constructor,
the `controller` member is `null`. This makes
`PageView` and its `controller` property consistent with other widgets.

如果构造函数中未提供 controller，`controller` 成员将为 `null`。这使 `PageView` 及其 `controller` 属性与其他 widget 保持一致。

## Migration guide

## 迁移指南

Before:

之前：

```dart
pageView.controller.page
```

After:

之后：

```dart
pageView.controller!.page
```

## Timeline

## 时间线

Landed in version: 3.19.0-12.0.pre<br>
In stable release: 3.22.0

合入版本：3.19.0-12.0.pre<br>
稳定版发布：3.22.0

## References

## 参考资料

Relevant issues:

相关问题：

* [PageView uses global controller, that is never disposed. (Issue 141119)][]

[PageView 使用全局 controller 且从未被释放（Issue 141119）][PageView uses global controller, that is never disposed. (Issue 141119)]

[PageView uses global controller, that is never disposed. (Issue 141119)]: {{site.repo.flutter}}/issues/141119
