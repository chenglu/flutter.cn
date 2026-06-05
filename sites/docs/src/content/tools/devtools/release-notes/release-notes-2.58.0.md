---
# title: DevTools 2.58.0 release notes
title: DevTools 2.58.0 发布说明
# shortTitle: 2.58.0 release notes
shortTitle: 2.58.0 发布说明
breadcrumb: 2.58.0
showToc: false
ai-translated: true
---

The 2.58.0 release of the Dart and Flutter DevTools
includes the following changes among other general improvements.
To learn more about DevTools, check out the
[DevTools overview](/tools/devtools).

Dart 和 Flutter DevTools 的 2.58.0 版本包含以下更改以及其他常规改进。
要了解更多关于 DevTools 的信息，请查看
[DevTools 概览](/tools/devtools)。

## Inspector updates

## 检查器更新

- Deleted the option to use the legacy inspector.
  [#9782](https://github.com/flutter/devtools/pull/9782)

  删除了使用旧版检查器的选项。
  [#9782](https://github.com/flutter/devtools/pull/9782)
- Fixed an issue where navigating the Inspector widget tree with the keyboard arrow keys did not update the selected widget in the connected Flutter app. [#9810](https://github.com/flutter/devtools/pull/9810)

  修复了使用键盘方向键导航 Inspector widget 树时
  未更新已连接 Flutter 应用中选定 widget 的问题。[#9810](https://github.com/flutter/devtools/pull/9810)
- Fixed an issue where clicking a widget row after collapsing a subtree with the left arrow key unexpectedly re-expanded the subtree. [#9810](https://github.com/flutter/devtools/pull/9810)

  修复了使用左方向键折叠子树后点击 widget 行
  会意外重新展开子树的问题。[#9810](https://github.com/flutter/devtools/pull/9810)
- Fixed an issue where collapsing the Inspector widget tree to a single row with the left arrow key caused a loading spinner to appear instead of showing the root node. [#9810](https://github.com/flutter/devtools/pull/9810)

  修复了使用左方向键将 Inspector widget 树折叠为单行时
  出现加载旋转器而不是显示根节点的问题。[#9810](https://github.com/flutter/devtools/pull/9810)

## Performance updates

## 性能更新

- Fixed an issue where 'More Debug Options' showed options as unselected in
profile mode even when selected. [#9813](https://github.com/flutter/devtools/issues/9813)

  修复了在 profile 模式下即使已选中，
  「More Debug Options」仍显示选项为未选中的问题。[#9813](https://github.com/flutter/devtools/issues/9813)

## Debugger updates

## 调试器更新

- Fixed an issue where long string values in the console/variables view would overflow and overlap with other elements. [#7112](https://github.com/flutter/devtools/issues/7112)

  修复了控制台/变量视图中长字符串值会溢出并与其他元素重叠的问题。[#7112](https://github.com/flutter/devtools/issues/7112)

## Network profiler updates

## 网络分析器更新

- Added response size column to the Network tab and displayed response size in the request inspector overview.  
  [#9744](https://github.com/flutter/devtools/pull/9744)

  在 Network 标签页中添加了响应大小列，并在请求检查器概览中显示响应大小。
  [#9744](https://github.com/flutter/devtools/pull/9744)

- Improved HTTP request status classification in the Network tab to better distinguish cancelled, completed, and in-flight requests (for example, avoiding some cases where cancelled requests appeared as pending). [#9683](https://github.com/flutter/devtools/pull/9683)

  改进了 Network 标签页中的 HTTP 请求状态分类，
  以更好地区分已取消、已完成和进行中的请求
  （例如，避免某些已取消请求显示为待处理的情况）。[#9683](https://github.com/flutter/devtools/pull/9683)

- Added a filter setting to hide HTTP-profiler socket data.  
  [#9698](https://github.com/flutter/devtools/pull/9698)

  添加了隐藏 HTTP-profiler socket 数据的过滤设置。
  [#9698](https://github.com/flutter/devtools/pull/9698)
  
## Logging updates

## 日志更新

- Fixed an issue where log messages containing newline characters were incorrectly split into multiple separate entries in the Logging screen. [#9757](https://github.com/flutter/devtools/pull/9757)

  修复了包含换行符的日志消息在 Logging 屏幕中
  被错误拆分为多个独立条目的问题。[#9757](https://github.com/flutter/devtools/pull/9757)

## Deep links tool updates

## 深层链接工具更新

- Pluralized "domain" and "path" in the validation summary notification titles when multiple errors are present. [#9790](https://github.com/flutter/devtools/pull/9790)

  当存在多个错误时，在验证摘要通知标题中将「domain」和「path」复数化。[#9790](https://github.com/flutter/devtools/pull/9790)

## Full commit history

## 完整提交历史

To find a complete list of changes in this release, check out the
[DevTools git log](https://github.com/flutter/devtools/tree/v2.58.0).

要查看此版本的完整更改列表，请查看
[DevTools git log](https://github.com/flutter/devtools/tree/v2.58.0)。
