---
# title: DevTools 2.22.2 release notes
title: DevTools 2.22.2 版本说明
# shortTitle: 2.22.2 release notes
shortTitle: 2.22.2 版本说明
breadcrumb: 2.22.2
# description: Release notes for Dart and Flutter DevTools version 2.22.2.
description: Dart 和 Flutter DevTools 2.22.2 版本的发布说明。
showToc: false
ai-translated: true
---

The 2.22.2 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](https://docs.flutter.dev/tools/devtools).

Dart 和 Flutter DevTools 2.22.2 版本
在各项常规改进之外，还包含以下更改。
要了解更多 DevTools 信息，请参阅
[DevTools 概览](https://docs.flutter.dev/tools/devtools)。

## General updates

## 常规更新

- Prevent crashes if there is no main isolate -
  [#5232](https://github.com/flutter/devtools/pull/5232)

  在没有 main isolate 时防止崩溃 -
  [#5232](https://github.com/flutter/devtools/pull/5232)

## CPU profiler updates

## CPU 性能分析器更新

- Display stack frame URI inline with method name to
  ensure the URI is always visible in deeply nested trees -
  [#5181](https://github.com/flutter/devtools/pull/5181)

  将堆栈帧 URI 与方法名内联显示，
  确保在深层嵌套树中 URI 始终可见 -
  [#5181](https://github.com/flutter/devtools/pull/5181)

  ![inline uri](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5181.png "inline uri")

- Add the ability to filter by method name or source URI -
  [#5204](https://github.com/flutter/devtools/pull/5204)

  添加了按方法名或源 URI 过滤的功能 -
  [#5204](https://github.com/flutter/devtools/pull/5204)

## Memory updates

## 内存更新

- Change filter default to show only project and 3rd party dependencies -
  [#5201](https://github.com/flutter/devtools/pull/5201).

  将过滤器默认值更改为仅显示项目和第三方依赖 -
  [#5201](https://github.com/flutter/devtools/pull/5201)。

  ![filter default](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5201.png "filter default")

- Support expression evaluation in console for running application -
  [#5248](https://github.com/flutter/devtools/pull/5248).

  为运行中的应用在控制台中支持表达式求值 -
  [#5248](https://github.com/flutter/devtools/pull/5248)。

  ![evaluation](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5248.png "evaluation")

- Add column `Persisted` for memory diffing -
  [#5290](https://github.com/flutter/devtools/pull/5290)

  为内存差异对比添加了 `Persisted` 列 -
  [#5290](https://github.com/flutter/devtools/pull/5290)

  ![persisted](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5290.png "persisted")

## Debugger updates

## 调试器更新

- Add support for browser navigation history when
  navigating using the File Explorer -
  [#4906](https://github.com/flutter/devtools/pull/4906)

  使用 File Explorer 导航时添加了浏览器导航历史支持 -
  [#4906](https://github.com/flutter/devtools/pull/4906)
- Designate positional fields for `Record` types
  with the getter syntax beginning at `$1` -
  [#5272](https://github.com/flutter/devtools/pull/5272)

  使用从 `$1` 开始的 getter 语法
  为 `Record` 类型指定位置字段 -
  [#5272](https://github.com/flutter/devtools/pull/5272)
- Fix variable inspection for `Map` and `List` instances -
  [#5320](https://github.com/flutter/devtools/pull/5320)

  修复了 `Map` 和 `List` 实例的变量检查 -
  [#5320](https://github.com/flutter/devtools/pull/5320)

  ![map and list](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5320.png "map and list")

- Fix variable inspection for `Set` instances -
  [#5323](https://github.com/flutter/devtools/pull/5323)

  修复了 `Set` 实例的变量检查 -
  [#5323](https://github.com/flutter/devtools/pull/5323)

  ![set](/assets/images/docs/tools/devtools/release-notes/images-2.22.2/5323.png "set")


## Network profiler updates

## 网络性能分析器更新

- Improve reliability and performance of the Network tab -
  [#5056](https://github.com/flutter/devtools/pull/5056)

  改进了 Network 标签页的可靠性和性能 -
  [#5056](https://github.com/flutter/devtools/pull/5056)

## Full commit history

## 完整提交历史

To find a complete list of changes since the previous release,
check out
[the diff on GitHub](https://github.com/flutter/devtools/compare/v2.21.1...v2.22.2).

要查看自上一版本以来的完整更改列表，
请查看
[GitHub 上的 diff](https://github.com/flutter/devtools/compare/v2.21.1...v2.22.2)。
