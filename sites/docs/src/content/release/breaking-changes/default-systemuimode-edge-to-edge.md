---
# title: Set default of `SystemUiMode` to edge-to-edge
title: 将 `SystemUiMode` 默认设置为边到边
# description: >-
#     By default, apps targeting Android SDK 15+ will opt
#     in to edge-to-edge mode.
description: >-
  默认情况下，面向 Android SDK 15+ 的应用程序将选择边缘到边缘模式。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Edge-to-edge mode is Android's default display behavior as of
Android version 15 and above. In Android 15, you could
opt out of this behavior but, as of Android 16, you can't.
To learn more about this change,
check out the [Android 16 release notes][].

自 Android 版本 15 及更高版本起，边到边模式是 Android 的默认显示行为。在 Android 15 中，你可以选择退出此行为，但从 Android 16 开始，你不能选择。要了解有关此更改的更多信息，请查看[Android 16 release notes][].


[Android 16 release notes]: {{site.android-dev}}/about/versions/16/behavior-changes-16#edge-to-edge

## Android 16 (or later)

## Android 16（或更高版本）


Using the mechanism to opt out of edge-to-edge on Android 16
or later might cause your app to crash, but you can avoid this
by using version-specific resources; for details,
visit the [migration guide](#migration-guide).

在 Android 16 或更高版本上使用该机制选择退出边缘到边缘可能会导致你的应用程序崩溃，但你可以通过使用特定于版本的资源来避免这种情况；有关详细信息，请访问[migration guide](#migration-guide).


To learn how to structure your app to avoid this,
we recommend that you visit the LeanCode article, [Mastering Edge-To-Edge in Flutter:
A Deep Dive Into the System Navigation Bar in Android][article].
You can also find more discussion in [Issue 168635][] on GitHub.

要了解如何构建你的应用程序以避免这种情况，我们建议你访问 LeanCode 文章 Mastering Edge-To-Edge in Flutter: A Deep Dive Into the System Navigation Bar in Android。你还可以在以下位置找到更多讨论[Issue 168635][]在 GitHub 上。


[article]: https://leancode.co/blog/mastering-edge-to-edge-in-flutter
[Issue 168635]: {{site.github}}/flutter/flutter/issues/168635#issuecomment-3485274018

## Android 15 (and below)

## Android 15（及以下）


If your Flutter app targets Android SDK version 15,
your app automatically displays in edge-to-edge mode,
as documented on the [`SystemUiMode`][] API page.
To maintain non edge-to-edge app behavior
(including an unset `SystemUiMode`),
follow the steps in the [migration guide](#migration-guide).

如果你的 Flutter 应用程序面向 Android SDK 版本 15，则你的应用程序会自动以边到边模式显示，如文档中所述[`SystemUiMode`][]API 页面。要保持非边缘到边缘的应用程序行为（包括未设置的 `SystemUiMode`），请按照[migration guide](#migration-guide).


[`SystemUiMode`]: {{site.api}}/flutter/services/SystemUiMode.html

## Context

## 背景


By default, Android enforces [edge-to-edge mode][] for all apps that
target Android 15 or later.
To learn more about this change, check out the [Android 15 release notes][].
This impacts devices running on Android SDK 15+ or API 35+.

默认情况下，Android 强制执行[edge-to-edge mode][]适用于所有面向 Android 15 或更高版本的应用。要了解有关此更改的更多信息，请查看[Android 15 release notes][]。这会影响在 Android SDK 15+ 或 API 35+ 上运行的设备。


Prior to Flutter 3.27, Flutter apps targeted Android 14 by default and
didn't opt into edge-to-edge mode automatically, but
your app _will_ be impacted when you choose to target Android 15.
If your app targets `flutter.targetSdkVersion` (as it does by default),
then it targets Android 15 starting with Flutter version 3.27,
automatically opting your app in to edge-to-edge.

在 Flutter 3.27 之前，Flutter 应用程序默认以 Android 14 为目标，并且不会自动选择进入边缘到边缘模式，但当你选择以 Android 15 为目标时，你的应用程序将受到影响。如果你的应用程序以 `flutter.targetSdkVersion` 为目标（如默认情况下是这样），然后它以 Flutter 版本 3.27 开头的 Android 15 为目标，自动将你的应用程序选择为边缘到边缘。


If your app explicitly sets `SystemUiMode.edgeToEdge` to run in
edge-to-edge mode by calling [`SystemChrome.setEnabledSystemUIMode`][],
then your app is already migrated. Apps needing more time to migrate to
edge-to-edge mode must use the following steps to opt out on
devices running Android SDK 15.

如果你的应用通过调用显式设置 `SystemUiMode.edgeToEdge` 以在边缘到边缘模式下运行[`SystemChrome.setEnabledSystemUIMode`][]，那么你的应用程序已经迁移。需要更多时间迁移到边缘到边缘模式的应用程序必须使用以下步骤在运行 Android SDK 15 的设备上选择退出。


Be aware of the following:

请注意以下事项：


 1. Android plans for the workaround detailed here to be temporary.

   Android 计划此处详细介绍的解决方法是临时的。

 2. Flutter plans to align with Android (and iOS) to

   Flutter 计划与 Android（和 iOS）保持一致

    support edge-to-edge by default within the year, so
    **migrate to edge-to-edge mode before the operating system
    removes the ability to opt out**.

一年内默认支持边缘到边缘，因此**在操作系统删除选择退出的功能之前迁移到边缘到边缘模式**。


[edge-to-edge mode]: {{site.android-dev}}/develop/ui/views/layout/edge-to-edge
[Android 15 release notes]: {{site.android-dev}}/about/versions/15/behavior-changes-15#edge-to-edge
[`SystemChrome.setEnabledSystemUIMode`]: {{site.api}}/flutter/services/SystemChrome/setEnabledSystemUIMode.html

## Migration guide

## 迁移指南


To opt out of edge-to-edge on Android SDK 15,
specify the new style attribute in each activity that requires it.
If you have a parent style that child styles need to opt out of,
you can modify the parent only. In the following example,
update the style configuration generated from `flutter create`.

要在 Android SDK 15 上选择退出边缘到边缘，请在需要它的每个活动中指定新的样式属性。如果你有一个父样式，而子样式需要选择退出，则可以仅修改父样式。在以下示例中，更新从 `flutter create` 生成的样式配置。


By default, the styles used in a Flutter app are set in
the Android manifest file (`your_app/android/app/src/main/AndroidManifest.xml`).
Generally, styles are denoted by `@style` and help theme your app.
Modify these default styles in your manifest file:

默认情况下，Flutter 应用程序中使用的样式在 Android 清单文件 (`your_app/android/app/src/main/AndroidManifest.xml`) 中设置。一般来说，样式由 `@style` 表示，并帮助你的应用程序主题化。在清单文件中修改这些默认样式：


```xml title="AndroidManifest.xml" highlightLines=5-8
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application ...>
        <activity ...>
            <!-- Style to modify: -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
            />
        </activity>
    </application>
</manifest>
```

Locate the style definition in:
`your_app/android/app/src/main/res/values/styles.xml`.

找到样式定义：`your_app/android/app/src/main/res/values/styles.xml`。


Add the following attribute to the appropriate styles:

将以下属性添加到适当的样式：


```xml title="styles.xml" highlightLines=6,12
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <style name="LaunchTheme" parent="@android:style/Theme.Light.NoTitleBar">
        ...
        <!-- Add the following line: -->
        <item name="android:windowOptOutEdgeToEdgeEnforcement">true</item>
    </style>
    ...
    <style name="NormalTheme" parent="@android:style/Theme.Light.NoTitleBar">
        ...
	      <!-- Add the following line: -->
        <item name="android:windowOptOutEdgeToEdgeEnforcement">true</item>
    </style>
</resources>
```

Make sure to apply the same change in the night mode styles file as well:
`your_app/android/app/src/main/res/values-night/styles.xml`.

确保在夜间模式样式文件中也应用相同的更改：`your_app/android/app/src/main/res/values-night/styles.xml`。


Ensure both styles are updated consistently in both files.

确保两个文件中的两种样式一致更新。


This modified style opts your app out of edge-to-edge for
apps targeting Android SDK 15.

对于面向 Android SDK 15 的应用程序，此修改后的样式会选择你的应用程序不采用边缘到边缘的方式。


:::note
If your app runs on Android 16 or above, to avoid crashes you can
create a `your_app/android/app/src/main/res/values-35` resource
directory that contains styles without the
`android:windowOptOutEdgeToEdgeEnforcement` attribute.

如果你的应用程序在 Android 16 或更高版本上运行，为避免崩溃，你可以创建一个 `your_app/android/app/src/main/res/values-35` 资源目录，其中包含不带 `android:windowOptOutEdgeToEdgeEnforcement` 属性的样式。

:::

## Timeline

## 时间线


Starting in Flutter 3.27, Flutter apps target Android 15 by default, so
if you wish to use this version and not manually set
a lower target SDK version for your Flutter app,
follow the preceding [migration steps](#migration-guide) to
maintain an unset or non-edge-to-edge `SystemUiMode`.

从 Flutter 3.27 开始，Flutter 应用程序默认以 Android 15 为目标，因此，如果你希望使用此版本而不是为 Flutter 应用程序手动设置较低的目标 SDK 版本，请按照前面的操作[migration steps](#migration-guide)保持未设置或非边到边 `SystemUiMode`。


Landed in version: 3.26.0-0.0.pre<br>
登陆版本：3.26.0-0.0.pre
Stable release: 3.27
稳定版本：3.27

## References

## 参考资料


* [The supported Flutter `SystemUiMode`s][]

  [支持的 Flutter `SystemUiMode`s][The supported Flutter `SystemUiMode`s]

* [The Android 15 edge-to-edge behavior changes guide][]

  [Android 15 边到边行为更改指南][The Android 15 edge-to-edge behavior changes guide]

* [The Android 16 edge-to-edge behavior changes guide][]

  [Android 16 边到边行为更改指南][The Android 16 edge-to-edge behavior changes guide]


[The supported Flutter `SystemUiMode`s]: {{site.api}}/flutter/services/SystemUiMode.html
[The Android 15 edge-to-edge behavior changes guide]: {{site.android-dev}}/about/versions/15/behavior-changes-15#edge-to-edge
[The Android 16 edge-to-edge behavior changes guide]: {{site.android-dev}}/about/versions/16/behavior-changes-16#edge-to-edge
[flutter#169810]: https://github.com/flutter/flutter/issues/169810
