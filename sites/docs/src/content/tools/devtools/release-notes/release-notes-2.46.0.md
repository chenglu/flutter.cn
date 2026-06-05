---
# title: DevTools 2.46.0 release notes
title: DevTools 2.46.0 发布说明
# shortTitle: 2.46.0 release notes
shortTitle: 2.46.0 发布说明
breadcrumb: 2.46.0
# description: Release notes for Dart and Flutter DevTools version 2.46.0.
description: Dart 和 Flutter DevTools 2.46.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.46.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.46.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

- Fixed a bug which caused web apps to remain paused after triggering a hot-restart from
  DevTools. - [#9125](https://github.com/flutter/devtools/pull/9125)

  修复了一个 bug，该 bug 导致 Web 应用在从
  DevTools 触发热重启后仍保持暂停状态。- [#9125](https://github.com/flutter/devtools/pull/9125)
- Landed a change to dismiss stale banner messages when the connected app state changes. - [#9148](https://github.com/flutter/devtools/pull/9148)

  落地了一项更改，在连接的应用状态更改时关闭过时的横幅消息。- [#9148](https://github.com/flutter/devtools/pull/9148)
- Fixed a focus traversal issue with search fields. [#9166](https://github.com/flutter/devtools/pull/9166)

  修复了搜索字段的焦点遍历问题。[#9166](https://github.com/flutter/devtools/pull/9166)

## Performance updates

## 性能更新

- Fixed a bug where the Performance page would hang when connected to a paused
  Flutter app. - [#9162](https://github.com/flutter/devtools/pull/9162)

  修复了连接到已暂停的
  Flutter 应用时性能页面会挂起的 bug。- [#9162](https://github.com/flutter/devtools/pull/9162)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.46.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.46.0)。
