---
# title: Integration test default golden-file comparators changed on Android and iOS.
title: Android 和 iOS 上 integration test 默认 golden 文件比较器已更改。
# description: >-
#   When using `package:integration_test` to run a test _on_ an Android device or
#   emulator, or an iOS device or simulator, the default `goldenFileComparator`
#   has changed, and correctly uses the host filesystem.
description: >-
  使用 `package:integration_test` 在 Android 设备或模拟器，
  或 iOS 设备或模拟器上运行测试时，默认 `goldenFileComparator`
  已更改，并正确使用主机文件系统。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

Unless a user-defined [`goldenFileComparator`][] is set, either manually in a
test, or using a `flutter_test_config.dart` file, Android and iOS devices
and emulators/simulators have a new default that proxies to the local host
filesystem, fixing a long-standing bug ([#143299][Issue 143299]).

除非设置了用户定义的 [`goldenFileComparator`][]（在测试中手动设置，
或使用 `flutter_test_config.dart` 文件），
Android 和 iOS 设备及模拟器/仿真器有了新的默认值，
代理到本地主机文件系统，修复了一个长期存在的 bug（[#143299][Issue 143299]）。

## Background

## 背景

The package [`integration_test`][], and its integration with [`flutter_test`][]
has historically had a bug where using [`matchesGoldenFile`][] or similar APIs
where a `FileSystemException` was thrown.

[`integration_test`][] package 及其与 [`flutter_test`][] 的集成
历史上存在一个 bug，使用 [`matchesGoldenFile`][] 或类似 API 时
会抛出 `FileSystemException`。

Some users may have worked around this issue by writing and using a custom
[`goldenFileComparator`][]:

部分用户可能通过编写和使用自定义
[`goldenFileComparator`][] 来解决此问题：

```dart
import 'package:integration_test/integration_test.dart';
import 'package:my_integration_test/custom_golden_file_comparator.dart';

void main() {
  goldenFileComparator = CustomGoldenFileComparatorThatWorks();

  // ...
}
```

Such workarounds are no longer necessary, and if type checking the default,
will no longer work as before:

此类变通方案不再必要，如果对默认值进行类型检查，
将不再像之前那样工作：

```dart
if (goldenFileComparator is ...) {
  // The new default is a new (hidden) type that has not existed before.
}
```

## Migration guide

## 迁移指南

In most cases, we expect users to have to do nothing - this will be in a sense
_new_ functionality that replaced functionality that did not work and caused
an unhandled exception which would fail a test.

在大多数情况下，我们预计用户无需做任何事——这在某种意义上是
_新_功能，取代了不起作用并导致未处理异常从而使测试失败的功能。

In cases where users wrote custom test infrastructure and comparators, consider
instead removing the [`goldenFileComparator`][] overrides, and instead rely on
the (new) default which should work as expected:

在用户编写了自定义测试基础设施和比较器的情况下，
考虑移除 [`goldenFileComparator`][] 覆盖，
转而依赖（新的）默认值，它应该能按预期工作：

```dart diff
  import 'package:integration_test/integration_test.dart';
- import 'package:my_integration_test/custom_golden_file_comparator.dart';

  void main() {
-   goldenFileComparator = CustomGoldenFileComparatorThatWorks();

    // ...
  }
```

_Fun fact_: The existing code that was used for
the _web_ platform was [reused][PR 160484].

_趣闻_：用于 _web_ 平台的现有代码被[复用][PR 160484]。

## Timeline

## 时间线

Landed in version: 3.29.0-0.0.pre<br>
Stable release: 3.32

合入版本：3.29.0-0.0.pre<br>
稳定版发布：3.32

## References

## 参考资料

Relevant APIs:

相关 API：

- [`flutter_test`][], which talks about `flutter_test_config.dart` and its capabilities.

  [`flutter_test`][]，介绍 `flutter_test_config.dart` 及其功能。
- [`goldenFileComparator`][], which implements comparison, and is user-configurable.

  [`goldenFileComparator`][]，实现比较且可由用户配置。

Relevant Issues:

相关 issue：

- [Issue 143299][], one of many user reports about the long-standing bug.

  [Issue 143299][]，众多用户关于此长期 bug 的报告之一。
- [Issue 160043][], which explains in technical detail why [`matchesGoldenFile`][] failed.

  [Issue 160043][]，从技术细节解释 [`matchesGoldenFile`][] 失败的原因。

Relevant PRs:

相关 PR：

- [PR 160215][], where the web tool implementation was refactored to make it generic.

  [PR 160215][]，其中 web 工具实现被重构为通用形式。
- [PR 160484][], which uses the Dart VM service protocol to proxy between device and host.

  [PR 160484][]，使用 Dart VM 服务协议在设备和主机之间代理。

[`flutter_test`]: {{site.api}}/flutter/flutter_test
[`goldenFileComparator`]: {{site.api}}/flutter/flutter_test/goldenFileComparator.html
[`integration_test`]: {{site.api}}/flutter/package-integration_test_integration_test/
[Issue 143299]: {{site.repo.flutter}}/issues/143299
[Issue 160043]: {{site.repo.flutter}}/issues/160043
[`matchesGoldenFile`]: {{site.api}}/flutter/flutter_test/MatchesGoldenFile-class.html
[PR 160215]: {{site.repo.flutter}}/pull/160215
[PR 160484]: {{site.repo.flutter}}/pull/160484
