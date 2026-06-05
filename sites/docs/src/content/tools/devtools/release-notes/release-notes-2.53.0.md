---
# title: DevTools 2.53.0 release notes
title: DevTools 2.53.0 发布说明
# shortTitle: 2.53.0 release notes
shortTitle: 2.53.0 发布说明
breadcrumb: 2.53.0
showToc: false
ai-translated: true
---

# DevTools 2.53.0 release notes

# DevTools 2.53.0 发布说明

The 2.53.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools/overview).

Dart 和 Flutter DevTools 的 2.53.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools/overview)。

## General updates

## 常规更新

- Switched default compiler for DevTools to `dart2wasm`. -
  [#9530](https://github.com/flutter/devtools/pull/9530)

  将 DevTools 的默认编译器切换为 `dart2wasm`。-
  [#9530](https://github.com/flutter/devtools/pull/9530)

## Performance updates

## 性能更新

- Increased profile data limit from 64MB to 2GB, fixing issue where panel
  wouldn't load for large profiles. -
  [#9540](https://github.com/flutter/devtools/pull/9540)

  将配置文件数据限制从 64MB 增加到 2GB，修复了大型配置文件
  无法加载面板的问题。-
  [#9540](https://github.com/flutter/devtools/pull/9540)

## Advanced developer mode updates

## 高级开发者模式更新

- Fixed issue preventing CPU profiles from loading when "advanced developer
  mode" was enabled. - [#9528](https://github.com/flutter/devtools/pull/9528)

  修复了启用「advanced developer
  mode」时无法加载 CPU 配置文件的问题。- [#9528](https://github.com/flutter/devtools/pull/9528)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.53.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.53.0)。
