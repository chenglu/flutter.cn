---
# title: Adding 'linux' and 'windows' to TargetPlatform enum
title: 将“linux”和“windows”添加到 TargetPlatform 枚举
# description: >
#   Two new values were added to the TargetPlatform enum that could
#   require additional cases in switch statements that switch on a TargetPlatform.
description: >
  TargetPlatform 枚举中添加了两个新值，这可能需要在 switch 语句中添加额外的情况来切换 TargetPlatform。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Two new values were added to the [`TargetPlatform`][] enum
that could require additional cases in switch statements that
switch on a `TargetPlatform` and don't include a `default:` case.

[`TargetPlatform`][] 枚举中添加了两个新值，这可能需要在 switch 语句中添加额外的情况，以打开 `TargetPlatform` 并且不包含 `default:` 情况。


## Context

## 背景


Prior to this change, the `TargetPlatform` enum only contained four values,
and was defined like this:

在此更改之前，“TargetPlatform”枚举仅包含四个值，定义如下：


```dart
enum TargetPlatform {
  android,
  fuchsia,
  iOS,
  macOS,
}
```

A `switch` statement only needed to handle these cases,
and desktop applications that wanted to run on Linux or
Windows usually had a test like this in their
`main()` method:

“switch”语句只需要处理这些情况，想要在 Linux 或 Windows 上运行的桌面应用程序通常在其“main()”方法中进行如下测试：


```dart
// Sets a platform override for desktop to avoid exceptions. See
// https://docs.flutter.dev/desktop#target-platform-override for more info.
void _enablePlatformOverrideForDesktop() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux)) {
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }
}

void main() {
  _enablePlatformOverrideForDesktop();
  runApp(MyApp());
}
```

## Description of change

## 变更说明


The `TargetPlatform` enum is now defined as:

`TargetPlatform` 枚举现在定义为：


```dart
enum TargetPlatform {
  android,
  fuchsia,
  iOS,
  linux, // new value
  macOS,
  windows, // new value
}
```

And the platform test setting
[`debugDefaultTargetPlatformOverride`][] in `main()`
is no longer required on Linux and Windows.

Linux 和 Windows 上不再需要 `main()` 中的平台测试设置 [`debugDefaultTargetPlatformOverride`][]。


This can cause the Dart analyzer to give the
[`missing_enum_constant_in_switch`][] warning for
switch statements that don't include a `default` case.
Writing a switch without a `default:` case is the
recommended way to handle enums, since the analyzer
can then help you find any cases that aren't handled.

这可能会导致 Dart 分析器对不包含“default”情况的 switch 语句给出 [`missing_enum_constant_in_switch`][] 警告。编写不带“default:”情况的开关是处理枚举的推荐方法，因为分析器可以帮助你找到任何未处理的情况。


## Migration guide

## 迁移指南


In order to migrate to the new enum, and avoid the analyzer's
`missing_enum_constant_in_switch` error, which looks like:

为了迁移到新的枚举，并避免分析器的“missing_enum_constant_in_switch”错误，如下所示：


```plaintext
warning: Missing case clause for 'linux'. (missing_enum_constant_in_switch at [package] path/to/file.dart:111)
```

or:

或者：


```plaintext
warning: Missing case clause for 'windows'. (missing_enum_constant_in_switch at [package] path/to/file.dart:111)
```

Modify your code as follows:

修改你的代码如下：


Code before migration:

迁移前的代码：


```dart
void dance(TargetPlatform platform) {
  switch (platform) {
    case TargetPlatform.android:
      // Do Android dance.
      break;
    case TargetPlatform.fuchsia:
      // Do Fuchsia dance.
      break;
    case TargetPlatform.iOS:
      // Do iOS dance.
      break;
    case TargetPlatform.macOS:
      // Do macOS dance.
      break;
  }
}
```

Code after migration:

迁移后的代码：


```dart
void dance(TargetPlatform platform) {
  switch (platform) {
    case TargetPlatform.android:
      // Do Android dance.
      break;
    case TargetPlatform.fuchsia:
      // Do Fuchsia dance.
      break;
    case TargetPlatform.iOS:
      // Do iOS dance.
      break;
    case TargetPlatform.linux: // new case
      // Do Linux dance.
      break;
    case TargetPlatform.macOS:
      // Do macOS dance.
      break;
    case TargetPlatform.windows: // new case
      // Do Windows dance.
      break;
  }
}
```

Having `default:` cases in such switch statements isn't
recommended, because then the analyzer can't help you find
all the cases that need to be handled.

不建议在此类 switch 语句中使用“default:”情况，因为这样分析器无法帮助你找到需要处理的所有情况。


Also, any tests like the one referenced above that set the
`debugDefaultTargetPlatformOverride` are no longer needed
for Linux and Windows applications.

此外，Linux 和 Windows 应用程序不再需要任何类似上面提到的设置“debugDefaultTargetPlatformOverride”的测试。


## Timeline

## 时间轴


Landed in version: 1.15.4<br>
In stable release: 1.17

登陆版本：1.15.4<br>稳定版本：1.17


## References

## 参考


API documentation:

API 文档：


* [`TargetPlatform`][]


Relevant issues:

相关问题：


* [Issue #31366][]

  [问题 #31366][Issue #31366]


Relevant PR:

相关公关：


* [Add Windows, and Linux as TargetPlatforms][]

  [添加 Windows 和 Linux 作为目标平台][Add Windows, and Linux as TargetPlatforms]


[Add Windows, and Linux as TargetPlatforms]: {{site.repo.flutter}}/pull/51519
[`debugDefaultTargetPlatformOverride`]: {{site.api}}/flutter/foundation/debugDefaultTargetPlatformOverride.html
[Issue #31366]: {{site.repo.flutter}}/issues/31366
[`missing_enum_constant_in_switch`]: {{site.dart-site}}/tools/diagnostic-messages#missing_enum_constant_in_switch
[`TargetPlatform`]: {{site.api}}/flutter/foundation/TargetPlatform-class.html
