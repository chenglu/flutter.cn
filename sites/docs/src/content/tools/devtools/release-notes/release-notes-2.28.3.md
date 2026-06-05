---
# title: DevTools 2.28.3 release notes
title: DevTools 2.28.3 版本说明
# shortTitle: 2.28.3 release notes
shortTitle: 2.28.3 版本说明
breadcrumb: 2.28.3
# description: Release notes for Dart and Flutter DevTools version 2.28.3.
description: Dart 和 Flutter DevTools 2.28.3 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.28.3 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.28.3 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

This was a cherry-pick release on top of DevTools 2.28.2.
To learn about the improvements included in DevTools 2.28.2, please read the
[release notes](/tools/devtools/release-notes/release-notes-2.28.2).

这是在 DevTools 2.28.2 之上的 cherry-pick 版本。
要了解 DevTools 2.28.2 中包含的改进，请阅读
[版本说明](/tools/devtools/release-notes/release-notes-2.28.2)。

## General updates

## 常规更新

* Added a link to the new "Dive in to DevTools" YouTube
  [video](https://www.youtube.com/watch?v=_EYk-E29edo) in the bottom status bar.
  This video provides a brief tutorial for each DevTools screen.
  [#6554](https://github.com/flutter/devtools/pull/6554)

  在底部状态栏中添加了指向新「Dive in to DevTools」YouTube
  [视频](https://www.youtube.com/watch?v=_EYk-E29edo) 的链接。
  该视频为每个 DevTools 屏幕提供了简要教程。
  [#6554](https://github.com/flutter/devtools/pull/6554)

  ![Link to watch a DevTools tutorial video](/assets/images/docs/tools/devtools/release-notes/images-2.28.3/watch_tutorial_link.png "Link to watch a DevTools tutorial video")

* Added a workaround to fix copy button functionality in VSCode. - [#6598](https://github.com/flutter/devtools/pull/6598)

  添加了变通方案以修复 VSCode 中的复制按钮功能。- [#6598](https://github.com/flutter/devtools/pull/6598)

## Performance updates

## 性能更新

* Disable the Raster Stats tool for the Impeller backend
  since it is not supported. - [#6616](https://github.com/flutter/devtools/pull/6616)

  由于不支持，为 Impeller 后端禁用了 Raster Stats 工具。- [#6616](https://github.com/flutter/devtools/pull/6616)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* When using VS Code with a light theme, the embedded sidebar provided by
  DevTools will now also show in the light theme. - [#6581](https://github.com/flutter/devtools/pull/6581)

  使用浅色主题的 VS Code 时，DevTools 提供的嵌入式侧边栏
  现在也会以浅色主题显示。- [#6581](https://github.com/flutter/devtools/pull/6581)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.3).

要查看此版本中的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.28.3)。
