---
# title: Dropping support for Android KitKat
title: 放弃对 Android KitKat 的支持
# description: >-
#   Flutter is raising the minimum supported Android version from
#   KitKat (API 19) to Lollipop (API 21).
description: >-
  Flutter 正在将支持的最低 Android 版本从 KitKat (API 19) 提高到 Lollipop (API 21)。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Flutter's minimum supported Android version is now Lollipop (API 21).
Beginning with Flutter's 3.22 stable release,
Flutter will no longer work on devices running Android KitKat (API 19).

Flutter 支持的最低 Android 版本现在是 Lollipop (API 21)。从 Flutter 的 3.22 稳定版本开始，Flutter 将不再在运行 Android KitKat (API 19) 的设备上运行。


## Context

## 背景


The context, purpose, and description of this deprecation can be found in
the [go/rfc-android-k-deprecation][] design document.

此弃用的上下文、目的和描述可以在[go/rfc-android-k-deprecation][]设计文件。


## Migration guide

## 迁移指南


Flutter developers targeting Android will need to increase the
`minSdkVersion` in their `build.gradle` and `AndroidManifest.xml` files
from `19` to at least `21`.

针对 Android 的 Flutter 开发人员需要将 `build.gradle` 和 `AndroidManifest.xml` 文件中的 `minSdkVersion` 从 `19` 增加到至少 `21`。


## Timeline

## 时间线


In stable release: 3.22
稳定版本：3.22

[go/rfc-android-k-deprecation]: {{site.main-url}}/go/rfc-android-k-deprecation
