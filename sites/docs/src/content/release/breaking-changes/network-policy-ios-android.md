---
# title: Insecure HTTP connections are disabled by default on iOS and Android
title: iOS 和 Android 上默认禁用不安全的 HTTP 连接
# description: >
#   Accessing a URL with HTTP protocol throws an exception unless
#   the domain is explicitly allowed by policy.
description: >
  除非策略明确允许该域，否则使用 HTTP 协议访问 URL 会引发异常。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


If your code tries to open an HTTP connection to a host
on iOS or Android, a `StateException` is now thrown with
the following message:

如果你的代码尝试在 iOS 或 Android 上打开与主机的 HTTP 连接，则会抛出“StateException”并显示以下消息：


```plaintext
Insecure HTTP is not allowed by platform: <host>
```

Use HTTPS instead.

请改用 HTTPS。


## Context

## 背景


Starting with Android [API 28][] and [iOS 9][],
these platforms disable insecure HTTP connections by default.

从 Android [API 28][] 和 [iOS 9][] 开始，这些平台默认禁用不安全的 HTTP 连接。


With this change Flutter also disables insecure connections on
mobile platforms. Other platforms (desktop, web, etc)
are not affected.

通过此更改，Flutter 还禁用了移动平台上的不安全连接。其他平台（桌面、网络等）不受影响。


You can override this behavior by following the
platform-specific guidelines to define a domain-specific
network policy. See the migration guide below for details.

你可以通过遵循特定于平台的准则来定义特定于域的网络策略来覆盖此行为。有关详细信息，请参阅下面的迁移指南。


[API 28]: {{site.android-dev}}/training/articles/security-config#CleartextTrafficPermitted
[iOS 9]: {{site.apple-dev}}/documentation/bundleresources/information_property_list/nsapptransportsecurity

:::important
The following only applies to platform native sockets (sockets owned
以下内容仅适用于平台本机套接字（拥有的套接字

by the Android and iOS platforms).
Android 和 iOS 平台）。


Flutter does not enforce any policy at socket level; you would be
Flutter 不会在套接字级别强制执行任何策略；你会的

responsible for securing the connection. If the socket is owned by
负责保护连接。如果套接字属于

Dart/Flutter, no policy will be enforced.
Dart/Flutter，不会执行任何策略。

:::

## Migration guide

## 迁移指南


On iOS, you can add [NSExceptionDomains][] to your
application's Info.plist.

在 iOS 上，你可以将 [NSExceptionDomains][] 添加到应用程序的 Info.plist 中。


On Android, you can add a [network security config][] XML.

在 Android 上，你可以添加 网络安全配置 XML。


### Allowing cleartext connection for debug builds

### 允许调试版本的明文连接


If you would like to allow HTTP connections for Android debug
builds, you can add the following snippet to your $project_path\android\app\src\debug\AndroidManifest.xml:

如果你希望允许 Android 调试版本使用 HTTP 连接，你可以将以下代码段添加到 $project_path\android\app\src\debug\AndroidManifest.xml 中：


```xml
<application android:networkSecurityConfig="@xml/network_security_config">
  ...
</application>
```

Then, add the network configuration to your $project_path/android/app/src/debug/res/xml/network_security_config.xml:

然后，将网络配置添加到 $project_path/android/app/src/debug/res/xml/network_security_config.xml 中：

```xml
<?xml version="1.0" encoding="utf-8"?>
<network-security-config>
    <base-config cleartextTrafficPermitted=`true` />
</network-security-config>
```

It is also possible to set the policy per domain.  See the Android
documentation for more information.

还可以为每个域设置策略。  请参阅 Android 文档以获取更多信息。


For iOS, you can follow [these instructions][] to create a `Info-debug.plist`
and put this in:

对于 iOS，你可以按照这些说明 创建一个 `Info-debug.plist` 并将其放入：


```xml
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
</dict>
```

We **do not** recommend you do this for your release builds.

我们**不**建议你对发布版本执行此操作。


## Additional Information

## 附加信息


* Build time configuration is the only way to change

  构建时配置是更改的唯一方法

network policy. It cannot be modified at runtime.

网络政策。它不能在运行时修改。


[network security config]: {{site.android-dev}}/training/articles/security-config#CleartextTrafficPermitted
[NSExceptionDomains]: {{site.apple-dev}}/documentation/bundleresources/information_property_list/nsapptransportsecurity/nsexceptiondomains

## Timeline

## 时间轴


Landed in version: 1.23<br>
In stable release: 2.0.0<br>
Reverted in version: 2.2.0 (proposed)

登陆版本：1.23<br>稳定版本：2.0.0<br>恢复版本：2.2.0（建议）


## References

## 参考


API documentation: There's no API for this change since
the modification to network policy is done through the
platform specific configuration as detailed above.

API 文档：没有用于此更改的 API，因为对网络策略的修改是通过如上所述的平台特定配置完成的。


Relevant PRs:

相关 PR：


* [PR 20218: Plumbing for setting domain network policy][]

  [PR 20218：设置域网络策略的管道][API 28]

* [Introduce per-domain policy for strict secure connections][]


[PR 20218: Plumbing for setting domain network policy]: {{site.repo.engine}}/pull/20218
[Introduce per-domain policy for strict secure connections]: {{site.github}}/dart-lang/sdk/commit/d878cfbf20375befa09f9bf85f0ba2b87b319427
[these instructions]: /add-to-app/ios/project-setup#local-network-permissions