---
# title: Transition of platform channel test interfaces to flutter_test package
title: 平台通道测试接口过渡到 flutter_test 包
# description: >
#    The setMockMessageHandler method related APIs have
#    moved from package:flutter to package:flutter_test
description: >
  setMockMessageHandler 方法相关的 API 已从 package:flutter 移至 package:flutter_test
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


The following methods have been replaced by APIs
in the `flutter_test` package:

以下方法已被 `flutter_test` 包中的 API 替换：


* `BinaryMessenger.checkMessageHandler`

  `BinaryMessenger.checkMessageHandler`

* `BinaryMessenger.setMockMessageHandler`

  `BinaryMessenger.setMockMessageHandler`

* `BinaryMessenger.checkMockMessageHandler`

  `BinaryMessenger.checkMockMessageHandler`

* `BasicMessageChannel.setMockMessageHandler`

  `BasicMessageChannel.setMockMessageHandler`

* `MethodChannel.checkMethodCallHandler`

  `MethodChannel.checkMethodCallHandler`

* `MethodChannel.setMockMethodCallHandler`

  `MethodChannel.setMockMethodCallHandler`

* `MethodChannel.checkMockMethodCallHandler`

  `MethodChannel.checkMockMethodCallHandler`


The `onPlatformMessage` callback is no longer used
by the Flutter framework.

Flutter 框架不再使用“onPlatformMessage”回调。


## Context

## 背景


As part of a refactoring of the low-level plugin
communications architecture, we have moved from the
previous `onPlatformMessage`/`handlePlatformMessage`
logic to a per-channel buffering system implemented in
the engine in the `ChannelBuffers` class.
To maintain compatibility with existing code,
the existing `BinaryMessenger.setMessageHandler` API
has been refactored to use the new `ChannelBuffers` API.

作为低级插件通信架构重构的一部分，我们已从之前的“onPlatformMessage”/“handlePlatformMessage”逻辑转移到在“ChannelBuffers”类的引擎中实现的每通道缓冲系统。为了保持与现有代码的兼容性，现有的“BinaryMessenger.setMessageHandler” API 已被重构以使用新的“ChannelBuffers” API。


One difference between the `ChannelBuffers` API and the
previous API is that the new API is more consistent in
its approach to asynchrony. As a side-effect,
the APIs around message passing are now entirely asynchronous.

“ChannelBuffers” API 与之前的 API 之间的一个区别是，新 API 在异步方法上更加一致。副作用是，围绕消息传递的 API 现在完全是异步的。


This posed a problem for the implementation of the legacy
testing APIs which, for historical reasons,
were previously in the `flutter` package.
Since they relied on the underlying logic being partly synchronous,
they required refactoring.
To avoid adding even more test logic into the `flutter` package,
a decision was made to move this logic to the `flutter_test` package.

这给遗留测试 API 的实现带来了问题，由于历史原因，这些 API 以前位于“flutter”包中。由于它们依赖于部分同步的底层逻辑，因此需要重构。为了避免在“flutter”包中添加更多测试逻辑，决定将此逻辑移至“flutter_test”包中。


## Description of change

## 变更说明


Specifically, the following APIs were affected:

具体来说，以下 API 受到影响：


* `BinaryMessenger.checkMessageHandler`: Obsolete.

  `BinaryMessenger.checkMessageHandler`：已过时。

* `BinaryMessenger.setMockMessageHandler`: Replaced by

  `BinaryMessenger.setMockMessageHandler`：替换为

`TestDefaultBinaryMessenger.setMockMessageHandler`.

`TestDefaultBinaryMessenger.setMockMessageHandler`。

* `BinaryMessenger.checkMockMessageHandler`: Replaced

  `BinaryMessenger.checkMockMessageHandler`：已替换

by `TestDefaultBinaryMessenger.checkMockMessageHandler`.

通过“TestDefaultBinaryMessenger.checkMockMessageHandler”。

* `BasicMessageChannel.setMockMessageHandler`: Replaced

  `BasicMessageChannel.setMockMessageHandler`：已替换

by `TestDefaultBinaryMessenger.setMockDecodedMessageHandler`.

通过“TestDefaultBinaryMessenger.setMockDecodedMessageHandler”。

* `MethodChannel.checkMethodCallHandler`: Obsolete.

  `MethodChannel.checkMethodCallHandler`：已过时。

* `MethodChannel.setMockMethodCallHandler`: Replaced by

  `MethodChannel.setMockMethodCallHandler`：替换为

`TestDefaultBinaryMessenger.setMockMethodCallHandler`.

`TestDefaultBinaryMessenger.setMockMethodCallHandler`。

* `MethodChannel.checkMockMethodCallHandler`: Replaced

  `MethodChannel.checkMockMethodCallHandler`：已替换

by `TestDefaultBinaryMessenger.checkMockMessageHandler`.

通过“TestDefaultBinaryMessenger.checkMockMessageHandler”。


These replacements are only available to code using the
new `TestDefaultBinaryMessengerBinding`
(such as any code using `testWidgets` in a `flutter_test` test).
There is no replacement for production code that was using
these APIs, as they were not intended for production code use.

这些替换仅适用于使用新的“TestDefaultBinaryMessengerBinding”的代码（例如在“flutter_test”测试中使用“testWidgets”的任何代码）。使用这些 API 的生产代码无法替代，因为它们不适用于生产代码。


Tests using `checkMessageHandler` have no equivalent in the
new API, since message handler registration is handled
directly by the `ChannelBuffers` object, which does not
expose the currently registered listener for a channel.
(Tests verifying handler registration appear to be rare.)

使用“checkMessageHandler”的测试在新 API 中没有等效项，因为消息处理程序注册是由“ChannelBuffers”对象直接处理的，该对象不会公开当前注册的通道侦听器。 （验证处理程序注册的测试似乎很少。）


Code that needs migrating may see errors such as the following:

需要迁移的代码可能会看到如下错误：


```plaintext
  error - The method 'setMockMessageHandler' isn't defined for the type 'BinaryMessenger' at test/sensors_test.dart:64:8 - (undefined_method)

  error • The method 'setMockMethodCallHandler' isn't defined for the type 'MethodChannel' • test/widgets/editable_text_test.dart:5623:30 • undefined_method

[error] The method 'setMockMessageHandler' isn't defined for the type 'BasicMessageChannel' (test/material/feedback_test.dart:37:36)
```

In addition, the `onPlatformMessage` callback,
which previously was hooked by the framework to
receive messages from plugins, is no longer used
(and will be removed in due course). As a result,
calling this callback to inject messages into the
framework no longer has an effect.

此外，不再使用“onPlatformMessage”回调（之前被框架挂钩以从插件接收消息）（并将在适当的时候删除）。因此，调用此回调将消息注入框架不再有效。


## Migration guide

## 迁移指南


The `flutter_test` package provides some shims so that
uses of the obsolete `setMock...` and `checkMock...`
methods will continue to work.
Tests that previously did not import
`package:flutter_test/flutter_test.dart` can
do so to enable these shims;
this should be sufficient to migrate most code.

`flutter_test` 包提供了一些垫片，以便过时的 `setMock...` 和 `checkMock...` 方法的使用将继续工作。之前没有导入 `package:flutter_test/flutter_test.dart` 的测试可以这样做来启用这些垫片；这应该足以迁移大多数代码。


These shim APIs are deprecated, however. Instead,
in code using `WidgetTester` (for example, using `testWidgets`),
it is recommended to use the following patterns to
replace calls to those methods
(where `tester` is the `WidgetTester` instance):

不过，这些 shim API 已被弃用。相反，在使用 `WidgetTester` 的代码中（例如，使用 `testWidgets`），建议使用以下模式来替换对这些方法的调用（其中 `tester` 是 `WidgetTester` 实例）：


```dart
// old code
ServicesBinding.defaultBinaryMessenger.setMockMessageHandler(...);
ServicesBinding.defaultBinaryMessenger.checkMockMessageHandler(...);
// new code
tester.binding.defaultBinaryMessenger.setMockMessageHandler(...);
tester.binding.defaultBinaryMessenger.checkMockMessageHandler(...);
```

```dart
// old code
myChannel.setMockMessageHandler(...);
myChannel.checkMockMessageHandler(...);
// new code
tester.binding.defaultBinaryMessenger.setMockDecodedMessageHandler(myChannel, ...);
tester.binding.defaultBinaryMessenger.checkMockMessageHandler(myChannel, ...);
```

```dart
// old code
myMethodChannel.setMockMethodCallHandler(...);
myMethodChannel.checkMockMethodCallHandler(...);
// new code
tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(myMethodChannel, ...);
tester.binding.defaultBinaryMessenger.checkMockMessageHandler(myMethodChannel, ...);
```

Tests that use `package:test` and `test()`
can be changed to use `package:flutter_test` and `testWidgets()`
to get access to a `WidgetTester`.

使用“package:test”和“test()”的测试可以更改为使用“package:flutter_test”和“testWidgets()”来访问“WidgetTester”。


Code that does not have access to a `WidgetTester` can refer to
`TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger`
instead of `tester.binding.defaultBinaryMessenger`.

无法访问“WidgetTester”的代码可以引用“TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger”，而不是“tester.binding.defaultBinaryMessenger”。


Tests that do not use the default test widgets binding
(`AutomatedTestWidgetsFlutterBinding`,
which is initialized by `testWidgets`) can mix the
`TestDefaultBinaryMessengerBinding` mixin into their
binding to get the same results.

不使用默认测试 widget 绑定（“AutomatedTestWidgetsFlutterBinding”，由“testWidgets”初始化）的测试可以将“TestDefaultBinaryMessengerBinding” mixin 混合到其绑定中以获得相同的结果。


Tests that manipulate `onPlatformMessage` will no longer
function as designed. To send mock messages to the framework,
consider using `ChannelBuffers.push`.
There is no mechanism to intercept messages from the plugins
and forward them to the framework in the new API.
If your use case requires such a mechanism, please file a bug.

操作“onPlatformMessage”的测试将不再按设计运行。要将模拟消息发送到框架，请考虑使用“ChannelBuffers.push”。新 API 中没有拦截来自插件的消息并将其转发到框架的机制。如果你的用例需要这样的机制，请提交错误。


## Timeline

## 时间轴


Landed in version: 2.3.0-17.0.pre.1<br>
In stable release: 2.5

登陆版本：2.3.0-17.0.pre.1<br> 稳定版本：2.5


## References

## 参考


API documentation:

API 文档：


* [`TestDefaultBinaryMessenger`][]

  [`TestDefaultBinaryMessenger`][]

* [`TestDefaultBinaryMessengerBinding`][]

  [`TestDefaultBinaryMessengerBinding`][]


Relevant PR:

相关公关：


* [PR #76288: Migrate to ChannelBuffers.push][]

  [PR #76288：迁移到 ChannelBuffers.push][PR #76288: Migrate to ChannelBuffers.push]


[`TestDefaultBinaryMessenger`]: {{site.api}}/flutter/flutter_test/TestDefaultBinaryMessenger-class.html
[`TestDefaultBinaryMessengerBinding`]: {{site.api}}/flutter/flutter_test/TestDefaultBinaryMessengerBinding-mixin.html

[PR #76288: Migrate to ChannelBuffers.push]: {{site.repo.flutter}}/pull/76288
