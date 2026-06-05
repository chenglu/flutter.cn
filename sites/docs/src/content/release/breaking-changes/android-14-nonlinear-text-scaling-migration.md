---
# title: Android 14 nonlinear font scaling enabled
title: Android 14 启用非线性字体缩放
# description: >-
#   Android 14's new nonlinear font scaling feature is
#   enabled in Flutter after v3.14.
description: >-
  Android 14 的新非线性字体缩放功能在 v3.14 后的 Flutter 中启用。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Android 14 introduced nonlinear font scaling up to 200%.
It may change how your app looks when the user changes
the accessibility text scaling in system preferences.

Android 14 引入了高达 200% 的非线性字体缩放。当用户更改系统首选项中的辅助功能文本缩放比例时，它可能会改变你的应用程序的外观。


## Background

## 背景


The [Android 14 nonlinear font scaling][] feature prevents
excessive accessibility font scaling by scaling larger text at a lesser rate
when the user increases the text scaling value in system preferences.

这[Android 14 nonlinear font scaling][]当用户增加系统首选项中的文本缩放值时，该功能会以较小的速率缩放较大的文本，从而防止过度的可访问性字体缩放。


## Migration guide

## 迁移指南


As the
[Android 14 feature overview][Android 14 nonlinear font scaling] suggests,
test your UI with the maximum font size enabled (`200%`).
This should verify that your app can apply the font sizes correctly
and can accommodate larger font sizes without impacting usability.

正如 Android 14 功能概述 所建议的，在启用最大字体大小 (`200%`) 的情况下测试你的 UI。这应该验证你的应用程序可以正确应用字体大小，并且可以容纳更大的字体大小而不影响可用性。


To adopt nonlinear font scaling in your app and custom widgets,
consider migrating from `textScaleFactor` to `TextScaler`.
To learn how to migrate to `TextScaler`,
check out the
[Deprecate `textScaleFactor` in favor of `TextScaler`][] migration guide.

要在应用程序和自定义 widget 中采用非线性字体缩放，请考虑从 `textScaleFactor` 迁移到 `TextScaler`。要了解如何迁移到 `TextScaler`，请查看[Deprecate `textScaleFactor` in favor of `TextScaler`][]迁移指南。


**Temporarily Opting Out**

**暂时选择退出**


To opt-out of nonlinear text scaling on Android 14 until you migrate your app,
add a modified `MediaQuery` at the top of your app's widget tree:

要在迁移应用程序之前选择退出 Android 14 上的非线性文本缩放，请在应用程序的 widget 树的顶部添加修改后的 `MediaQuery`：


```dart
runApp(
  Builder(builder: (context) {
    final mediaQueryData = MediaQuery.of(context);
    final mediaQueryDataWithLinearTextScaling = mediaQueryData
      .copyWith(textScaler: TextScaler.linear(mediaQueryData.textScaler.textScaleFactor));
    return MediaQuery(data: mediaQueryDataWithLinearTextScaling, child: realWidgetTree);
  }),
);
```

This uses the deprecated `textScaleFactor` API.
It will stop working once that API is removed from the Flutter API.

这使用已弃用的 `textScaleFactor` API。一旦该 API 从 Flutter API 中删除，它将停止工作。


## Timeline

## 时间线


Landed in version: 3.14.0-11.0.pre<br>
登陆版本：3.14.0-11.0.pre
In stable release: 3.16
稳定版本：3.16

## References

## 参考资料


API documentation:

API 文档：


* [`TextScaler`][]

Relevant issues:

相关 issue：


* [New font scaling system (Issue 116231)][]

  [新的字体缩放系统（问题 116231）][New font scaling system (Issue 116231)]


Relevant PRs:

相关 PR：


* [Implementing TextScaler for nonlinear text scaling][]

  [实现 TextScaler 进行非线性文本缩放][Implementing TextScaler for nonlinear text scaling]


See also:

参见：


* [Deprecate `textScaleFactor` in favor of `TextScaler`][]

  [弃用 `textScaleFactor` 以支持 `TextScaler`][Deprecate `textScaleFactor` in favor of `TextScaler`]


[Android 14 nonlinear font scaling]: {{site.android-dev}}/about/versions/14/features#non-linear-font-scaling
[Deprecate `textScaleFactor` in favor of `TextScaler`]: /release/breaking-changes/deprecate-textscalefactor
[`TextScaler`]: {{site.api}}/flutter/painting/TextScaler-class.html
[New font scaling system (Issue 116231)]: {{site.repo.flutter}}/issues/116231
[Implementing TextScaler for nonlinear text scaling]: {{site.repo.engine}}/pull/44907
