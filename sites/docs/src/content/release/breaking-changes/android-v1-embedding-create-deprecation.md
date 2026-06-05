---
# title: Android v1 embedding app and plugin creation deprecation
title: Android v1 嵌入应用程序和插件创建弃用
# description: Gradual deprecation of the Android v1 embedding.
description: 逐渐弃用 Android v1 嵌入。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The `flutter create` templates for apps and plugins
no longer create Android wrapping based on the
v1 Android embedding as part of our gradual
Android v1 embedding deprecation process described in our
[Android Migration Summary][].

应用程序和插件的 `flutter create` 模板不再基于 v1 Android 嵌入创建 Android 包装，作为我们逐步 Android v1 嵌入弃用过程的一部分，请参阅我们的[Android Migration Summary][].


Application projects using the v1 Android embedding
are encouraged to migrate following the steps described in
[Upgrading pre 1.12 Android projects][].

鼓励使用 v1 Android 嵌入的应用程序项目按照中描述的步骤进行迁移[Upgrading pre 1.12 Android projects][].


Plugins targeting the v1 Android embedding are encouraged
to migrate following the instructions in
[Supporting the new Android plugins APIs][].

鼓励针对 v1 Android 嵌入的插件按照以下说明进行迁移[Supporting the new Android plugins APIs][].


[Android Migration Summary]: /go/android-migration-summary
[Upgrading pre 1.12 Android projects]: {{site.repo.flutter}}/blob/main/docs/platforms/android/Upgrading-pre-1.12-Android-projects.md
[Supporting the new Android plugins APIs]: /release/breaking-changes/plugin-api-migration

## Context

## 背景


In Flutter version 1.12, we launched a v2 set of
Android APIs based on the [`io.flutter.embedding`][]
package in order to enable the [add-to-app][] workflow
on Android.

在 Flutter 版本 1.12 中，我们推出了一组基于 Android API 的 v2 集[`io.flutter.embedding`][]包以启用[add-to-app][]Android 上的工作流程。


Over time, we gradually deprecated the older
v1 Android embeddings based on the
[`io.flutter.app`][] package.

随着时间的推移，我们逐渐弃用了基于以下内容的旧 v1 Android 嵌入：[`io.flutter.app`][]包裹。


As of Q2 2020, only 26% of applications used the v1 embeddings.

截至 2020 年第二季度，只有 26% 的应用程序使用 v1 嵌入。


Since the v2 embeddings were strongly established over
the 7 months since the launch of Flutter v1.12,
we disabled the creation of new app and plugin
projects using the v1 embeddings.

由于自 Flutter v1.12 发布以来的 7 个月内，v2 嵌入已牢固建立，因此我们禁止使用 v1 嵌入创建新的应用程序和插件项目。


[add-to-app]: /add-to-app
[`io.flutter.embedding`]: https://cs.opensource.google/flutter/engine/+/master:shell/platform/android/io/flutter/embedding/
[`io.flutter.app`]: https://cs.opensource.google/flutter/engine/+/master:shell/platform/android/io/flutter/app/.

## Description of change

## 变更说明


The `flutter config` command no longer has a
toggleable `enable-android-embedding-v2`
flag (which defaulted to true since v1.12).
All projects created with `flutter create`
and `flutter create -t plugin` exclusively use the
Android v2 embedding.

`flutter config` 命令不再具有可切换的 `enable-android-embedding-v2` 标志（自 v1.12 起默认为 true）。使用 `flutter create` 和 `flutter create -t plugin` 创建的所有项目都专门使用 Android v2 嵌入。


Existing v1 applications continue to work.

现有的 v1 应用程序可以继续运行。


Existing v1 applications consuming plugins now receive
a warning prompt to migrate to v2 embedding.

使用插件的现有 v1 应用程序现在会收到迁移到 v2 嵌入的警告提示。


Existing v1 applications consuming a plugin that targets
only the v2 embedding won't build and must migrate.
This has been the case since v1.12. However,
the likelihood of encountering this increases as
plugin developers create and publish v2 only plugins.

使用仅针对 v2 嵌入的插件的现有 v1 应用程序将无法构建，并且必须迁移。从 v1.12 开始就是这种情况。然而，随着插件开发人员创建和发布仅限 v2 的插件，遇到这种情况的可能性会增加。


Existing v2 applications continue to work with or without
plugins.

现有的 v2 应用程序无论有没有插件都可以继续工作。


Existing v2 applications consuming plugins that only
target the v1 embedding continue to receive a warning prompt.
The likelihood of encountering this decreases
as plugin developers create and publish v2 plugins.

使用仅针对 v1 嵌入的插件的现有 v2 应用程序会继续收到警告提示。随着插件开发人员创建和发布 v2 插件，遇到这种情况的可能性会降低。


## Migration guide

## 迁移指南


For more information,
see [Upgrading pre 1.12 Android projects][].

有关更多信息，请参阅[Upgrading pre 1.12 Android projects][].


## Timeline

## 时间线


Landed in version: 1.20.0-8.0<br>
登陆版本：1.20.0-8.0
In stable release: 1.22
稳定版本：1.22
