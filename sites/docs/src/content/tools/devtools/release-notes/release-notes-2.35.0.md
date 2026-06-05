---
# title: DevTools 2.35.0 release notes
title: DevTools 2.35.0 发布说明
# shortTitle: 2.35.0 release notes
shortTitle: 2.35.0 发布说明
breadcrumb: 2.35.0
# description: Release notes for Dart and Flutter DevTools version 2.35.0.
description: Dart 和 Flutter DevTools 2.35.0 版本发布说明。
showToc: false
ai-translated: true
---

The 2.35.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.35.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## General updates

## 常规更新

* Changed to a single button for starting and stopping
  recording on the Network screen and CPU profiler screen. - [#7573](https://github.com/flutter/devtools/pull/7573)

  在 Network 屏幕和 CPU profiler 屏幕上改为使用单个按钮来开始和停止录制。- [#7573](https://github.com/flutter/devtools/pull/7573)

  ![A screen shot of the CPU profiler tab, with the new recording button.](/assets/images/docs/tools/devtools/release-notes/images-2.35.0/profiler_recording.png)
  ![A screen shot of the network tab, with the new recording button.](/assets/images/docs/tools/devtools/release-notes/images-2.35.0/network_recording.png)

## Inspector updates

## 检查器更新

* Add a preference for the default inspector view - [#6949](https://github.com/flutter/devtools/pull/6949)

  添加了默认检查器视图的偏好设置 - [#6949](https://github.com/flutter/devtools/pull/6949)

## Memory updates

## 内存更新

* Replaced total size with reachable size in snapshot list. - [#7493](https://github.com/flutter/devtools/pull/7493)

  在快照列表中用可达大小替换了总大小。- [#7493](https://github.com/flutter/devtools/pull/7493)

## Debugger updates

## 调试器更新

* During a hot-restart, `pause_isolates_on_start` and only
  `resume` the app once breakpoints are set. - [#7234](https://github.com/flutter/devtools/pull/7234)

  在热重启期间，使用 `pause_isolates_on_start`，并且仅在设置断点后才 `resume` 应用。- [#7234](https://github.com/flutter/devtools/pull/7234)

## Network profiler updates

## 网络分析器更新

* Added text selection in text viewer for requests and responses. - [#7596](https://github.com/flutter/devtools/pull/7596)

  在请求和响应的文本查看器中添加了文本选择功能。- [#7596](https://github.com/flutter/devtools/pull/7596)
* Added a JSON copy experience to the JSON viewer. - [#7596](https://github.com/flutter/devtools/pull/7596)

  在 JSON 查看器中添加了 JSON 复制体验。- [#7596](https://github.com/flutter/devtools/pull/7596)

  ![The new JSON copy experience in the JSON viewer](/assets/images/docs/tools/devtools/release-notes/images-2.35.0/json_viewer_copy.png)

* Fixed a bug where stopping and starting network recording listed requests that
  happened while not recording. - [#7626](https://github.com/flutter/devtools/pull/7626)

  修复了一个 bug，即在停止和开始网络录制时会列出未录制期间发生的请求。- [#7626](https://github.com/flutter/devtools/pull/7626)

## Deep links tool updates

## 深层链接工具更新

* Improve layout for narrow screens. - [#7524](https://github.com/flutter/devtools/pull/7524)

  改进了窄屏幕的布局。- [#7524](https://github.com/flutter/devtools/pull/7524)
* Add error handling for missing schemes and domains - [#7559](https://github.com/flutter/devtools/pull/7559)

  添加了对缺少 scheme 和 domain 的错误处理 - [#7559](https://github.com/flutter/devtools/pull/7559)

## VS Code Sidebar updates

## VS Code 侧边栏更新

* Added a DevTools section with a list of tools and extensions that
  are available without a debug session. -
  [#7598](https://github.com/flutter/devtools/pull/7598), [#7604](https://github.com/flutter/devtools/pull/7604)

  添加了 DevTools 部分，其中列出了无需调试会话即可使用的工具和扩展。-
  [#7598](https://github.com/flutter/devtools/pull/7598), [#7604](https://github.com/flutter/devtools/pull/7604)

## DevTools Extension updates

## DevTools 扩展更新

* Support DevTools extensions that do not require a running app, and
  detect them from the user's IDE workspace. - [#7612](https://github.com/flutter/devtools/pull/7612)

  支持不需要运行应用的 DevTools 扩展，
  并从用户的 IDE 工作区中检测它们。- [#7612](https://github.com/flutter/devtools/pull/7612)
* Deprecate the `DevToolsExtension.requiresRunningApplication` field in
  favor of the new optional `requiresConnection` field that
  can be added to an extension's `config.yaml` file. -
  [#7611](https://github.com/flutter/devtools/pull/7611), [#7602](https://github.com/flutter/devtools/pull/7602)

  弃用 `DevToolsExtension.requiresRunningApplication` 字段，
  改用可添加到扩展 `config.yaml` 文件中的新可选 `requiresConnection` 字段。-
  [#7611](https://github.com/flutter/devtools/pull/7611), [#7602](https://github.com/flutter/devtools/pull/7602)
* Detect extensions for all types of run targets in a package. -
  [#7533](https://github.com/flutter/devtools/pull/7533), [#7535](https://github.com/flutter/devtools/pull/7535)

  检测包中所有类型的运行目标的扩展。-
  [#7533](https://github.com/flutter/devtools/pull/7533), [#7535](https://github.com/flutter/devtools/pull/7535)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.35.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.35.0)。
