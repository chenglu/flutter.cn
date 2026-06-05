---
# title: Migrating Flutter Android projects to built-in Kotlin
title: 将 Flutter Android 项目迁移到内置 Kotlin
# description: >-
#   Update your Flutter Android Gradle files to use built-in Kotlin support.
#   Essential for migrating projects to Android Gradle Plugin 9 or later.
description: >
  更新你的 Flutter Android Gradle 文件以使用内置 Kotlin 支持。对于将项目迁移到 Android Gradle Plugin 9 或更高版本至关重要。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


To build a Flutter app for Android,
the Android Gradle Plugin (AGP) must be used.
To use AGP 9 and later, the following migrations are required.

要构建适用于 Android 的 Flutter 应用程序，必须使用 Android Gradle 插件 (AGP)。要使用 AGP 9 及更高版本，需要进行以下迁移。


First, built-in Kotlin is the default in AGP 9 and later.
Apps that use the `kotlin-android` plugin,
also known as the Kotlin Gradle Plugin (KGP),
will fail to build ([Issue #181383][]).
However, the Flutter team has added temporary support for the legacy
Kotlin Gradle Plugin in AGP 9 and later ([Issue #183909][]).
This allows app and plugin developers to safely build their projects
regardless of their migration state.

首先，内置 Kotlin 是 AGP 9 及更高版本中的默认设置。使用“kotlin-android”插件（也称为 Kotlin Gradle 插件 (KGP)）的应用程序将无法构建（[问题 #181383][Issue #181383]）。不过，Flutter 团队在 AGP 9 及更高版本中添加了对旧版 Kotlin Gradle 插件的临时支持（[问题 #183909][Issue #183909]）。这使得应用程序和插件开发人员能够安全地构建他们的项目，无论其迁移状态如何。


Second, AGP 9 and later only use the new AGP DSL interfaces.
This means any old DSL types will not be recognized.
The Flutter team is working on migrating old DSL types
to use the new DSL: [Issue #180137][].
In the meantime, the Flutter team has configured the AGP DSL
to be compatible with the legacy DSL types ([Issue #184838][]).
This ensures app and plugin developers can
safely upgrade to AGP 9 and later.

其次，AGP 9 及更高版本仅使用新的 AGP DSL 接口。这意味着任何旧的 DSL 类型都不会被识别。 Flutter 团队正在致力于迁移旧的 DSL 类型以使用新的 DSL：[问题 #180137][Issue #180137]。与此同时，Flutter 团队已将 AGP DSL 配置为与旧版 DSL 类型兼容（[问题 #184838][Issue #184838]）。这确保应用程序和插件开发人员可以安全地升级到 AGP 9 及更高版本。


To ensure compatibility,
manually migrate all apps and plugins
from the legacy KGP to built-in Kotlin.
Flutter plans to remove support for applying KGP
in a future version ([Issue #184837][]).

为了确保兼容性，请手动将所有应用程序和插件从旧版 KGP 迁移到内置 Kotlin。 Flutter 计划在未来版本中删除对应用 KGP 的支持（[问题 #184837][Issue #184837]）。


To learn more about Android Gradle Plugin,
see the [Android Gradle Plugin docs][AGP block].

要了解有关 Android Gradle 插件的更多信息，请参阅 Android Gradle 插件文档。


[AGP block]: {{site.android-dev}}/build/releases/gradle-plugin

## Migrate

## 迁移


**For app developers:**
Follow the [app developer migration guide][app-migration-guide].

**对于应用程序开发人员：** 请遵循应用程序开发人员迁移指南。


**For plugin authors:**
Follow the [plugin author migration guide][plugin-migration-guide].

**对于插件作者：** 请遵循插件作者迁移指南。


[app-migration-guide]: /release/breaking-changes/migrate-to-built-in-kotlin/for-app-developers
[plugin-migration-guide]: /release/breaking-changes/migrate-to-built-in-kotlin/for-plugin-authors

## Next steps

## 后续步骤


- **Remove support for KGP:**

  **删除对 KGP 的支持：**

In a future version of Flutter,
support for applying KGP will be removed ([Issue #184837][]).
Migrate apps, plugins, and host apps to keep them building.

在 Flutter 的未来版本中，将删除对应用 KGP 的支持（[问题 #184837][Issue #184837]）。迁移应用程序、插件和托管应用程序以保持它们的构建。


- **Remove the DSL Gradle property:**

  **删除 DSL Gradle 属性：**

Once the Flutter team completes the migration to the new AGP DSL,
it will remove support for the old DSL ([Issue #184839][]).

Flutter 团队完成向新 AGP DSL 的迁移后，将删除对旧 DSL 的支持（[问题 #184839][Issue #184839]）。


## Timeline

## 时间轴


Landed in version: 3.44.0-0.1.pre<br>
In stable release: 3.44

登陆版本：3.44.0-0.1.pre<br> 稳定版本：3.44


## References

## 参考


Relevant issues:

相关问题：


- [Issue #180137][]: Migrate from old to new AGP DSL

  [问题 #180137][Issue #180137]：从旧 AGP DSL 迁移到新 AGP DSL

- [Issue #181383][]: Flutter plugins should support AGP 9.0.0

  [问题 #181383][Issue #181383]：Flutter 插件应支持 AGP 9.0.0

- [Issue #183909][]: Add support for KGP in AGP+

  [问题 #183909][Issue #183909]：在 AGP+ 中添加对 KGP 的支持

- [Issue #184837][]: Remove support for KGP

  [问题 #184837][Issue #184837]：删除对 KGP 的支持

- [Issue #184838][]: Disable new AGP DSL flag by default

  [问题 #184838][Issue #184838]：默认禁用新的 AGP DSL 标志

- [Issue #184839][]: Remove support for old AGP DSL types

  [问题 #184839][Issue #184839]：删除对旧 AGP DSL 类型的支持


The Gradle build files in your app vary based on the Flutter version
used when your app was created.
Consider staying up to date with the latest version
of the build files by periodically running `flutter upgrade`
in your app's directory.

应用程序中的 Gradle 构建文件根据创建应用程序时使用的 Flutter 版本而有所不同。考虑通过定期在应用程序目录中运行“flutter Upgrade”来保持最新版本的构建文件。


[Issue #180137]: {{site.repo.flutter}}/issues/180137
[Issue #181383]: {{site.repo.flutter}}/issues/181383
[Issue #183909]: {{site.repo.flutter}}/issues/183909
[Issue #184837]: {{site.repo.flutter}}/issues/184837
[Issue #184838]: {{site.repo.flutter}}/issues/184838
[Issue #184839]: {{site.repo.flutter}}/issues/184839
