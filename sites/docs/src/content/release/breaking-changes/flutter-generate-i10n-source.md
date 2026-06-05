---
# title: Localized messages are generated into source, not a synthetic package.
title: 本地化消息生成到源码中，而非合成 package。
# description: >-
#   When using `package:flutter_localizations`, the default generated location
#   (and eventually, only possible location) is within your source (`lib/`)
#   directory, and not the synthetic package `package:flutter_gen`.
description: >-
  使用 `package:flutter_localizations` 时，默认生成位置
  （并最终成为唯一可能的位置）在你的源码（`lib/`）目录中，
  而非合成 package `package:flutter_gen`。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要

The `flutter` tool will no longer generate a synthetic `package:flutter_gen`
or modify the `package_config.json` of the app.

`flutter` 工具将不再生成合成的 `package:flutter_gen`，
也不会修改应用的 `package_config.json`。

Applications or tools that referenced `package:flutter_gen` should instead
reference source files generated into the app's source directory directly.

引用 `package:flutter_gen` 的应用或工具应改为
直接引用生成到应用源码目录中的源文件。

In addition, the property `generate: true` is now required when using generated
l10n source.

此外，使用生成的 l10n 源码时现在需要 `generate: true` 属性。

## Background

## 背景

`flutter_gen` is a virtual (synthetic) package that is
created by the `flutter` command-line tool to allow developers to
import that package to access generated symbols and functionality,
such as for [internationalization][].
As the package isn't listed in an app's `pubspec.yaml`, and
is created via re-writing the generated `package_config.json` file,
many problems have been created.

`flutter_gen` 是由 `flutter` 命令行工具创建的虚拟（合成）package，
让开发者可以导入该 package 以访问生成的符号和功能，
例如[国际化][internationalization]。
由于该 package 未列在应用的 `pubspec.yaml` 中，
且通过重写生成的 `package_config.json` 文件创建，
已产生许多问题。

## Migration guide

## 迁移指南

This change only affects apps that have the
following entry in their `pubspec.yaml`:

此变更仅影响在 `pubspec.yaml` 中有以下条目的应用：

```yaml
flutter:
  generate: true
```

If your app previously used `gen-l10n` without this property, it is now
required.

如果你的应用先前使用 `gen-l10n` 但没有此属性，现在为必填项。

A synthetic package (`package:flutter_gen`) is
created and referenced by the app:

创建了合成 package（`package:flutter_gen`）并由应用引用：

```dart
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// ...
const MaterialApp(
  title: 'Localizations Sample App',
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
);
```

There is one way to migrate away from importing `package:flutter_gen`:

有一种方式可以迁移离开 `package:flutter_gen` 的导入：

 1. Specify `synthetic-package: false` in the accompanying [`l10n.yaml`][] file:

    在配套的 [`l10n.yaml`][] 文件中指定 `synthetic-package: false`：

    ```yaml title="l10n.yaml"
    synthetic-package: false

    # The files are generated into the path specified by `arb-dir`
    arb-dir: lib/i18n

    # Or, specifically provide an output path:
    output-dir: lib/src/generated/i18n
    ```

## Timeline

## 时间线

Landed in version: 3.28.0-0.0.pre<br>
Stable release: 3.32.0

合入版本：3.28.0-0.0.pre<br>
稳定版发布：3.32.0

**In the next stable release after this change lands,
`package:flutter_gen` support will be removed.**

**在此变更合入后的下一个稳定版发布中，
将移除对 `package:flutter_gen` 的支持。**

## References

## 参考资料

Relevant Issues:

相关 issue：

- [Issue 73870][], where `package:flutter_gen` pub problems are first found.

  [Issue 73870][]，其中首次发现 `package:flutter_gen` pub 问题。
- [Issue 102983][], where `package:flutter_gen` problems are outlined.

  [Issue 102983][]，其中概述了 `package:flutter_gen` 问题。
- [Issue 157819][], where `--implicit-pubspec-resolution` is discussed.

  [Issue 157819][]，其中讨论了 `--implicit-pubspec-resolution`。

Relevant Articles:

相关文章：

- [Internationalizing Flutter apps][internationalization],
  the canonical documentation for the feature.

- [国际化 Flutter 应用][internationalization]，
  该功能的权威文档。

[`l10n.yaml`]: /ui/internationalization#configuring-the-l10n-yaml-file
[Issue 73870]: {{site.repo.flutter}}/issues/73870
[Issue 102983]: {{site.repo.flutter}}/issues/102983
[Issue 157819]: {{site.repo.flutter}}/issues/157819
[internationalization]: /ui/internationalization#adding-your-own-localized-messages
