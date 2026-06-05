---
# title: DevTools 2.9.2 release notes
title: DevTools 2.9.2 发布说明
# shortTitle: 2.9.2 release notes
shortTitle: 2.9.2 发布说明
breadcrumb: 2.9.2
# description: Release notes for Dart and Flutter DevTools version 2.9.2.
description: Dart 和 Flutter DevTools 2.9.2 版本发布说明。
showToc: false
ai-translated: true
---

The 2.9.2 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 的 2.9.2 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

* Take our 2022 DevTools survey! Provide your feedback and help us improve
  your development experience. This survey prompt will show up directly in
  DevTools sometime in mid-February.

  参加我们的 2022 DevTools 调查！提供你的反馈，帮助我们改进
  你的开发体验。此调查提示将在 2 月中旬
  直接显示在 DevTools 中。

  ![survey prompt](/assets/images/docs/tools/devtools/release-notes/images-2.9.2/image1.png "survey_prompt")

  *Note*: If you are having issues launching the survey, please make
  sure you have upgraded to the latest Flutter stable branch 2.10.
  There was a bug in DevTools (fixed in
  [#3574](https://github.com/flutter/devtools/pull/3574)) that
  prevented the survey from being able to be opened, and unless you
  are on Flutter 2.10, this bug will still be present._

  *注意*：如果你在启动调查时遇到问题，请确保
  你已升级到最新的 Flutter stable 分支 2.10。
  DevTools 中有一个 bug（已在
  [#3574](https://github.com/flutter/devtools/pull/3574) 中修复），
  该 bug 导致无法打开调查，除非你
  使用的是 Flutter 2.10，否则此 bug 仍然存在。_

* General bug fixes and improvements -
  [#3528](https://github.com/flutter/devtools/pull/3528),
  [#3531](https://github.com/flutter/devtools/pull/3531),
  [#3532](https://github.com/flutter/devtools/pull/3532),
  [#3539](https://github.com/flutter/devtools/pull/3539)

  常规 bug 修复和改进 -
  [#3528](https://github.com/flutter/devtools/pull/3528),
  [#3531](https://github.com/flutter/devtools/pull/3531),
  [#3532](https://github.com/flutter/devtools/pull/3532),
  [#3539](https://github.com/flutter/devtools/pull/3539)

## Performance updates

## 性能更新

* Added frame numbers to x-axis the Flutter frames chart -
  [#3526](https://github.com/flutter/devtools/pull/3526)

  在 Flutter 帧图表的 x 轴上添加了帧编号 -
  [#3526](https://github.com/flutter/devtools/pull/3526)

  ![frame numbers](/assets/images/docs/tools/devtools/release-notes/images-2.9.2/image2.png "frame_numbers")

## Debugger updates

## 调试器更新

* Fix a bug where the File Explorer in the Debugger did not show contents
  after a hot restart -
  [#3527](https://github.com/flutter/devtools/pull/3527)

  修复了调试器中的 File Explorer 在热重启后
  不显示内容的 bug -
  [#3527](https://github.com/flutter/devtools/pull/3527)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.9.1...v2.9.2).

要查看自上一版本以来的完整更改列表，请查看
[GitHub 上的差异](https://github.com/flutter/devtools/compare/v2.9.1...v2.9.2)。
