---
# title: Flutter now sets default `abiFilters` in Android builds
title: Flutter 现在在 Android 版本中设置默认 `abiFilters`
# description: >-
#   The Flutter Gradle Plugin now automatically configures abiFilters
#   for Android builds, which might break custom abiFilters settings.
description: >-
  Flutter Gradle 插件现在会自动为 Android 构建配置 abiFilters，这可能会破坏自定义 abiFilters 设置。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Starting in Flutter 3.35, the Flutter Gradle Plugin automatically sets
[`abiFilters`][] for Android builds to prevent the inclusion of unsupported
architectures in release APKs. This change can break custom
`abiFilters` specified in your app's `build.gradle` file.

从 Flutter 3.35 开始，Flutter Gradle 插件自动设置[`abiFilters`][]对于 Android 构建，以防止在发布的 APK 中包含不受支持的架构。此更改可能会破坏应用程序的 `build.gradle` 文件中指定的自定义 `abiFilters` 。


## Context

## 背景


This change was introduced to solve an issue where third-party
dependencies with x86 native libraries would cause Google Play to
incorrectly identify Flutter apps as supporting x86 devices. When users
with x86 devices installed these apps, they would crash at runtime
because Flutter's native libraries aren't available for x86.

引入此更改是为了解决 issue 问题，其中第三方对 x86 本机库的依赖性会导致 Google Play 错误地将 Flutter 应用程序识别为支持 x86 设备。当使用 x86 设备的用户安装这些应用程序时，它们会在运行时崩溃，因为 Flutter 的本机库不适用于 x86。


The Flutter Gradle Plugin now automatically configures `abiFilters` to
include only the architectures that Flutter supports. This prevents
Google Play from making apps available to incompatible devices.

Flutter Gradle 插件现在自动配置 `abiFilters` 以仅包含 Flutter 支持的架构。这会阻止 Google Play 向不兼容的设备提供应用程序。


## Description of change

## 变更说明


The Flutter Gradle Plugin now programmatically sets `abiFilters` for
non-debuggable builds when the `--splits-per-abi` option is not enabled
by default to:

当默认情况下未启用 `--splits-per-abi` 选项时，Flutter Gradle 插件现在可以通过编程方式为不可调试构建设置 `abiFilters`：

- `armeabi-v7a`

  `armeabi-v7a`

- `arm64-v8a`

  `arm64-v8a`

- `x86_64`

  `x86_64`


Because this automatic configuration happens before your `build.gradle` files
are processed, it might break custom `abiFilters` settings that depend on the
set being empty.

由于此自动配置发生在处理 `build.gradle` 文件之前，因此可能会破坏依赖于空集的自定义 `abiFilters` 设置。


## Migration guide

## 迁移指南

If your app doesn't customize `abiFilters`, no changes are required.

如果你的应用未自定义 `abiFilters`，则无需进行任何更改。


If your app needs to customize which architectures are included, you have
several options:

如果你的应用程序需要自定义包含哪些架构，你有多种选择：


### Option 1: Use the splits-per-abi flag

### 选项 1：使用 splits-per-abi 标志


If you want to control architecture inclusion, use Flutter's built-in
`--splits-per-abi` option instead of manually configuring `abiFilters`:

如果要控制架构包含，请使用 Flutter 的内置 `--splits-per-abi` 选项，而不是手动配置 `abiFilters`：


```console
flutter build apk --splits-per-abi
```

This creates separate APKs for each architecture and automatically disables
the automatic `abiFilters` configuration.

这会为每个架构创建单独的 APK，并自动禁用自动 `abiFilters` 配置。


### Option 2: Clear and reconfigure abiFilters

### 选项 2：清除并重新配置 abiFilters


If you must use a single APK with custom architecture filters, clear the
automatically set filters and configure your own in your `build.gradle`.
For example:

如果你必须使用带有自定义架构过滤器的单个 APK，请清除自动设置的过滤器并在 `build.gradle` 中配置你自己的过滤器。例如：


```kotlin
android {
    buildTypes {
        release {
            // Clear the automatically set filters.
            ndk.abiFilters.clear()
            // Set your custom filters.
            ndk.abiFilters.addAll(listOf("arm64-v8a"))
        }
    }
}
```

### Disabling abiFIlters ###

### 禁用 abiFIlters ###

It is possible, but not recommended, to disable this abi filtering. Pass the `-Pdisable-abi-filtering`flag when running `flutter build`
or `flutter run`.

可以但不建议禁用此 abi 过滤。运行 `flutter build` 或 `flutter run` 时传递 `-Pdisable-abi-filtering`flag。


## Timeline

## 时间线


Landed in version: 3.35.0<br>
登陆版本：3.35.0
In stable release: 3.35
稳定版本：3.35

Relevant issues:

相关 issue：

* [Issue #174004]({{site.repo.flutter}}/issues/174004)
* [Issue #153476]({{site.repo.flutter}}/issues/153476)
* [Issue #175845]({{site.repo.flutter}}/issues/175845)

Relevant PRs:

相关 PR：

* [PR #168293]({{site.repo.flutter}}/pull/168293)
* [PR #177753]({{site.repo.flutter}}/pull/177753)

[`abiFilters`]: https://developer.android.com/reference/tools/gradle-api/8.7/com/android/build/api/dsl/Ndk#abiFilters()
