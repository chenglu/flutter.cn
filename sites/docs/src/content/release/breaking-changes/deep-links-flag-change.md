---
# title: Deep links flag change
title: 深层链接标志更改
# description: >-
#   If you use a third party deep linking plugin package for mobile apps,
#   set Flutter's deep linking flag to false.
description: >-
  如果你为移动应用程序使用第三方深度链接插件包，请将 Flutter 的深度链接标志设置为 false。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


**This breaking change only affects mobile apps that
use a third party deep linking plugin package.**

**此重大更改仅影响使用第三方深度链接插件包的移动应用程序。**


The default value for Flutter's deep linking option has changed from
`false` to `true`, meaning that deep linking is now opt-in by default.

Flutter 的深度链接选项的默认值已从 `false` 更改为 `true`，这意味着现在默认选择深度链接。


## Migration guide

## 迁移指南


If you're using Flutter's default deep linking setup,
this isn't a breaking change for you.

如果你使用 Flutter 的默认深度链接设置，这对你来说并不是一个重大更改。


However, if you're using a third-party plugin for deep links,
such as the following, this update introduces a breaking change:

但是，如果你使用第三方插件进行深层链接（如下所示），则此更新引入了重大更改：


- [Firebase dynamic links](https://firebase.google.com/docs/dynamic-links)
- [`package:uni_link`]({{site.pub-pkg}}/uni_links)
- [`package:app_links`]({{site.pub-pkg}}/app_links)
- [`package:flutter_branch_sdk`]({{site.pub-pkg}}/flutter_branch_sdk)

In this case, you must manually reset the
Flutter deep linking option to `false`.

在这种情况下，你必须手动将 Flutter 深度链接选项重置为 `false`。


Within your app's `AndroidManifest.xml` file for Android:

在你应用程序的 Android 的 `AndroidManifest.xml` 文件中：


```xml title="AndroidManifest.xml" highlightLines=4
<manifest>
   <application
       <activity>
<meta-data android:name="flutter_deeplinking_enabled" android:value="false" />
       </activity>
   </application>
</manifest>
```

Within your app's `info.plist` file for iOS:

在应用程序的 iOS 的 `info.plist` 文件中：


```xml title="info.plist"
 <key>FlutterDeepLinkingEnabled</key>
 <false/>
```

## Timeline

## 时间线


Landed in version: 3.25.0-0.1.pre<br>
登陆版本：3.25.0-0.1.pre
Stable release: 3.27
稳定版本：3.27

## References

## 参考资料


Design document:

设计文档：


- [flutter.dev/go/deep-link-flag-migration]({{site.main-url}}/go/deep-link-flag-migration)

Relevant PR:

相关 PR：


* [Set deep linking flag to true by default]({{site.github}}/flutter/engine/pull/52350)
