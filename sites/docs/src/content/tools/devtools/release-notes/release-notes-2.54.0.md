---
# title: DevTools 2.54.0 release notes
title: DevTools 2.54.0 发布说明
# shortTitle: 2.54.0 release notes
shortTitle: 2.54.0 发布说明
breadcrumb: 2.54.0
showToc: false
ai-translated: true
---

The 2.54.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.54.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

- Dropped connections to DTD will now automatically be retried to improve the
  experience when your machine is resumed from sleep. -
  [#9587](https://github.com/flutter/devtools/pull/9587)

  断开的 DTD 连接现在会自动重试，以改善
  计算机从睡眠状态恢复时的体验。-
  [#9587](https://github.com/flutter/devtools/pull/9587)

## Inspector updates

## 检查器更新

- Added a warning banner that the legacy inspector
  will be removed in a future release. -
  [#9572](https://github.com/flutter/devtools/pull/9572)

  添加了警告横幅，提示旧版检查器
  将在未来版本中移除。-
  [#9572](https://github.com/flutter/devtools/pull/9572)

## Memory updates

## 内存更新

- Fixed an error preventing users from changing the zoom duration. -
  [#9573](https://github.com/flutter/devtools/pull/9573)

  修复了阻止用户更改缩放持续时间的错误。-
  [#9573](https://github.com/flutter/devtools/pull/9573)

## Deep links tool updates

## 深层链接工具更新

- Added a more informative dialog if the Deep Links tool is
  unable to find build options for the iOS or Android app. -
  [#9571](https://github.com/flutter/devtools/pull/9571)

  如果 Deep Links 工具
  无法找到 iOS 或 Android 应用的构建选项，则添加了更具信息量的对话框。-
  [#9571](https://github.com/flutter/devtools/pull/9571)
- Fixed null error when parsing universal link settings. -
  [#9581](https://github.com/flutter/devtools/pull/9581)

  修复了解析通用链接设置时的 null 错误。-
  [#9581](https://github.com/flutter/devtools/pull/9581)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.54.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.54.0)。
