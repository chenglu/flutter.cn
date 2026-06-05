---
# title: DevTools 2.28.5 release notes
title: DevTools 2.28.5 版本说明
# shortTitle: 2.28.5 release notes
shortTitle: 2.28.5 版本说明
breadcrumb: 2.28.5
# description: Release notes for Dart and Flutter DevTools version 2.28.5.
description: Dart 和 Flutter DevTools 2.28.5 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.28.5 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.28.5 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

This was a cherry-pick release on top of DevTools 2.28.4.
To learn about the improvements included in DevTools 2.28.4, please read the
[release notes](/tools/devtools/release-notes/release-notes-2.28.4).

这是在 DevTools 2.28.4 之上的 cherry-pick 版本。
要了解 DevTools 2.28.4 中包含的改进，请阅读
[版本说明](/tools/devtools/release-notes/release-notes-2.28.4)。

## Inspector updates

## 检查器更新

* Only cache pub root directories added by the user. - [#6897](https://github.com/flutter/devtools/pull/6897)

  仅缓存用户添加的 pub 根目录。- [#6897](https://github.com/flutter/devtools/pull/6897)

* Remove Flutter pub root if it was accidentally cached. - [#6911](https://github.com/flutter/devtools/pull/6911)

  如果 Flutter pub 根目录被意外缓存，则将其移除。- [#6911](https://github.com/flutter/devtools/pull/6911)

## DevTools Extension updates

## DevTools 扩展更新

* Fixed a couple bugs preventing Dart server apps from connecting to DevTools extensions. - [#6982](https://github.com/flutter/devtools/pull/6982), [#6993](https://github.com/flutter/devtools/pull/6993)

  修复了阻止 Dart server 应用连接到 DevTools 扩展的几个 bug。- [#6982](https://github.com/flutter/devtools/pull/6982), [#6993](https://github.com/flutter/devtools/pull/6993)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.5).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.5)。
