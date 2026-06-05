---
# title: Removal of v1 Android embedding Java APIs
title: 删除 v1 Android 嵌入 Java API
# description: >-
#   Learn how to account for the removal of the Android v1 embedding APIs.
description: >-
  了解如何考虑删除 Android v1 嵌入 API。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Android's v1 embedding has been removed in Flutter 3.29.0.
This follows the deprecation described in
[Android v1 embedding app and plugin creation deprecation][].
The following is a full list of classes removed.

Android 的 v1 嵌入已在 Flutter 3.29.0 中删除。这是继中描述的弃用之后的[Android v1 embedding app and plugin creation deprecation][]。以下是删除的类的完整列表。


```text
io.flutter.app.FlutterActivity
io.flutter.app.FlutterActivityDelegate
io.flutter.app.FlutterActivityEvents
io.flutter.app.FlutterApplication
io.flutter.app.FlutterFragmentActivity
io.flutter.app.FlutterPlayStoreSplitApplication
io.flutter.app.FlutterPluginRegistry

io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry
io.flutter.embedding.engine.plugins.shim.ShimRegistrar

io.flutter.view.FlutterMain
io.flutter.view.FlutterNativeView
io.flutter.view.FlutterView
```

If your project references any of the above classes, consult the following
list for instructions on migration.

如果你的项目引用上述任何类，请参阅以下列表以获取有关迁移的说明。


* `io.flutter.app.FlutterActivity` was

  `io.flutter.app.FlutterActivity` 是

   replaced with `io.flutter.embedding.android.FlutterActivity`.

替换为 `io.flutter.embedding.android.FlutterActivity`。

* `io.flutter.app.FlutterActivityDelegate` was

  `io.flutter.app.FlutterActivityDelegate` 是

   replaced with `io.flutter.embedding.android.FlutterActivityAndFragmentDelegate`.

替换为 `io.flutter.embedding.android.FlutterActivityAndFragmentDelegate`。

* `io.flutter.app.FlutterActivityEvents` was removed.

  `io.flutter.app.FlutterActivityEvents` 已被删除。

* `io.flutter.app.FlutterApplication` was removed.

  `io.flutter.app.FlutterApplication` 已删除。

   Flutter projects with custom `Application` implementations should
   instead extend the base `android.app.Application`.

具有自定义 `Application` 实现的 Flutter 项目应该扩展基本 `android.app.Application`。

* `io.flutter.app.FlutterFragmentActivity` was

  `io.flutter.app.FlutterFragmentActivity` 是

  replaced with `io.flutter.embedding.android.FlutterFragmentActivity`.

替换为 `io.flutter.embedding.android.FlutterFragmentActivity`。

* `io.flutter.app.FlutterPlayStoreSplitApplication` was

  `io.flutter.app.FlutterPlayStoreSplitApplication` 是

  replaced with `io.flutter.embedding.android.FlutterPlayStoreSplitApplication`.

替换为 `io.flutter.embedding.android.FlutterPlayStoreSplitApplication`。

* `io.flutter.app.FlutterPluginRegistry` was removed,

  `io.flutter.app.FlutterPluginRegistry` 被删除，

   as it only served to let plugins support apps using the v1 embedding.

因为它只是让插件支持使用 v1 嵌入的应用程序。

* `io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry` was removed,

  `io.flutter.embedding.engine.plugins.shim.ShimPluginRegistry` 已被删除，

   as it only served to support let plugins support apps using the v1 embedding.

因为它仅用于支持让插件支持使用 v1 嵌入的应用程序。

* `io.flutter.embedding.engine.plugins.shim.ShimRegistrar` was removed,

  `io.flutter.embedding.engine.plugins.shim.ShimRegistrar` 已被删除，

   as it only served to support let plugins support apps using the v1 embedding.

因为它仅用于支持让插件支持使用 v1 嵌入的应用程序。

* `io.flutter.view.FlutterMain` was

  `io.flutter.view.FlutterMain` 是

   replaced by `io.flutter.embedding.engine.loader.FlutterLoader`.

替换为 `io.flutter.embedding.engine.loader.FlutterLoader`。

* `io.flutter.view.FlutterNativeView` was

  `io.flutter.view.FlutterNativeView` 是

   replaced by `io.flutter.embedding.android.FlutterView`.

替换为 `io.flutter.embedding.android.FlutterView`。

* `io.flutter.view.FlutterView` was

  __PH_1294​​65e1__ 是

   replaced by `io.flutter.embedding.android.FlutterView`.

替换为 `io.flutter.embedding.android.FlutterView`。


[Android v1 embedding app and plugin creation deprecation]: /release/breaking-changes/android-v1-embedding-create-deprecation

## Plugin authors

## 插件作者


Plugins should remove the `registerWith` method from
their `FlutterPlugin` interface implementation:

插件应从其 `FlutterPlugin` 接口实现中删除 `registerWith` 方法：


```java
public static void registerWith(@NonNull io.flutter.plugin.common.PluginRegistry.Registrar registrar);
```

For an example of this migration,
check out the pull request to remove this method from the
Flutter team-owned plugins: [flutter/packages#6494][].

有关此迁移的示例，请查看拉取请求以从 Flutter 团队拥有的插件中删除此方法：[flutter/packages#6494][].


[flutter/packages#6494]: {{site.github}}/flutter/packages/pull/6494

## Timeline

## 时间线


Landed in version: 3.28.0-0.1.pre<br>
登陆版本：3.28.0-0.1.pre
In stable release: 3.29
稳定版本：3.29
