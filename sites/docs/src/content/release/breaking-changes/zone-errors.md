---
# title: "\"Zone mismatch\" message"
title: “区域不匹配”消息
# description: >
#   When Flutter's bindings are initialized in a different zone
#   than the Zone used for `runApp`, a warning is printed to the console.
description: >-
  当 Flutter 的绑定在与 `runApp` 使用的区域不同的区域中初始化时，控制台会打印一条警告。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Starting with Flutter 3.10, the framework detects mismatches
when using Zones and reports them to the console in debug builds.

从 Flutter 3.10 开始，框架会在使用区域时检测不匹配情况，并在调试版本中将其报告给控制台。


## Background

## 背景


Zones are a mechanism for managing callbacks in Dart.
While primarily useful for overriding `print` and `Timer` logic in tests,
and for catching errors in tests,
they are sometimes used for scoping global variables
to certain parts of an application.

区域是 Dart 中管理回调的机制。虽然主要用于覆盖测试中的 `print` 和 `Timer` 逻辑以及捕获测试中的错误，但它们有时用于将全局变量的范围限定到应用程序的某些部分。


Flutter requires (and has always required)
that all framework code be run in the same zone.
Notably, this means that calls to
`WidgetsFlutterBinding.ensureInitialized()` should be run in the same zone
as calls to `runApp()`.

Flutter 要求（并且始终要求）所有框架代码都在同一区域中运行。值得注意的是，这意味着对 `WidgetsFlutterBinding.ensureInitialized()` 的调用应与对 `runApp()` 的调用在同一区域中运行。


Historically, Flutter has not detected such mismatches.
This sometimes leads to obscure and hard-to-debug issues.
For example,
a callback for keyboard input might be invoked
using a zone that does not have access to the `zoneValues` that it expects.
In our experience,
most if not all code that uses Zones
in a way that does not guarantee that all parts of
the Flutter framework are working in the same Zone
has some latent bug.
Often these bugs appear unrelated to the use of Zones.

从历史上看，Flutter 从未检测到此类不匹配。这有时会导致模糊且难以调试的 issues。例如，可以使用无法访问其所需的 `zoneValues` 的区域来调用键盘输入的回调。根据我们的经验，大多数（如果不是全部）使用区域的代码不能保证 Flutter 框架的所有部分都在同一个区域中工作，并且存在一些潜在的错误。通常，这些错误似乎与区域的使用无关。


To help developers who have accidentally violated this invariant,
starting with Flutter 3.10,
a non-fatal warning is printed in debug builds when a mismatch is detected.
The warning looks like the following:

为了帮助意外违反此不变式的开发人员，从 Flutter 3.10 开始，当检测到不匹配时，会在调试版本中打印非致命警告。该警告如下所示：


```plaintext
════════ Exception caught by Flutter framework ════════════════════════════════════
The following assertion was thrown during runApp:
Zone mismatch.

The Flutter bindings were initialized in a different zone than is now being used.
This will likely cause confusion and bugs as any zone-specific configuration will
inconsistently use the configuration of the original binding initialization zone or
this zone based on hard-to-predict factors such as which zone was active when a
particular callback was set.
It is important to use the same zone when calling `ensureInitialized` on the
binding as when calling `runApp` later.
To make this warning fatal, set BindingBase.debugZoneErrorsAreFatal to true before
the bindings are initialized (i.e. as the first statement in `void main() { }`).
[...]
═══════════════════════════════════════════════════════════════════════════════════
```

The warning can be made fatal by
setting [`BindingBase.debugZoneErrorsAreFatal`][] to `true`.
This flag might be changed to default to `true` in a future version of Flutter.

通过设置可以使警告变得致命[`BindingBase.debugZoneErrorsAreFatal`][]至 `true`。在 Flutter 的未来版本中，此标志可能会更改为默认为 `true`。


## Migration guide

## 迁移指南


The best way to silence this message is to
remove use of Zones from within the application.
Zones can be very hard to debug,
because they are essentially global variables,
and break encapsulation.
Best practice is to avoid global variables and zones.

消除此消息的最佳方法是从应用程序内删除对区域的使用。区域可能很难调试，因为它们本质上是全局变量，并且破坏了封装。最佳实践是避免全局变量和区域。


If removing zones is not an option
(for example because the application depends on a third-party library
that relies on zones for its configuration),
then the various calls into the Flutter framework
should be moved to all be in the same zone.
Typically, this means moving the call to
`WidgetsFlutterBinding.ensureInitialized()` to the
same closure as the call to `runApp()`.

如果无法删除区域（例如，因为应用程序依赖于依赖区域进行配置的第三方库），则应将对 Flutter 框架的各种调用移至同一区域中。通常，这意味着将对 `WidgetsFlutterBinding.ensureInitialized()` 的调用移至与对 `runApp()` 的调用相同的闭包。


This can be awkward when the zone in which `runApp` is run
is being initialized with `zoneValues` obtained from a plugin
(which requires `WidgetsFlutterBinding.ensureInitialized()`
to have been called).

当运行 `runApp` 的区域使用从插件获取的 `zoneValues` 进行初始化时（需要调用 `WidgetsFlutterBinding.ensureInitialized()`），这可能会很尴尬。


One option in this kind of scenario is to
place a mutable object in the `zoneValues`, and
update that object with the value once the value is available.

这种情况下的一种选择是在 `zoneValues` 中放置一个可变对象，并在该值可用时使用该值更新该对象。


```dart
import 'dart:async';
import 'package:flutter/material.dart';

class Mutable<T> {
  Mutable(this.value);
  T value;
}

void main() {
  var myValue = Mutable<double>(0.0);
  Zone.current.fork(
    zoneValues: {
      'myKey': myValue,
    }
  ).run(() {
    WidgetsFlutterBinding.ensureInitialized();
    var newValue = ...; // obtain value from plugin
    myValue.value = newValue; // update value in Zone
    runApp(...);
  });
}
```

In code that needs to use `myKey`,
it can be obtained indirectly using `Zone.current['myKey'].value`.

在需要使用`myKey`的代码中，可以使用`Zone.current['myKey'].value`间接获取。


When such a solution does not work
because a third-party dependency requires the use
of a specific type for a specific `zoneValues` key,
all calls into the dependency can be
wrapped in `Zone` calls that provide suitable values.

当此类解决方案因第三方依赖项要求对特定 `zoneValues` 键使用特定类型而不起作用时，对依赖项的所有调用都可以包装在提供合适值的 `Zone` 调用中。


It is strongly recommended that packages that use zones in this way
migrate to more maintainable solutions.

强烈建议以这种方式使用区域的软件包迁移到更易于维护的解决方案。


## Timeline

## 时间线


Landed in version: 3.9.0-9.0.pre<br>
登陆版本：3.9.0-9.0.pre
In stable release: 3.10.0
稳定版本：3.10.0

## References

## 参考资料


API documentation:

API 文档：


* [`Zone`][]
* [`BindingBase.debugZoneErrorsAreFatal`][]

Relevant issues:

相关 issue：


* [Issue 94123][]: Flutter framework does not warn when ensureInitialized

  [Issue 94123][]：Flutter 框架在 ensureInitialized 时不会发出警告

  is called in a different zone than runApp

在与 runApp 不同的区域中调用


Relevant PRs:

相关 PR：


* [PR 122836][]: Assert that runApp is called

  [PR 122836][]: 断言 runApp 被调用

  in the same zone as binding.ensureInitialized

与 binding.ensureInitialized 位于同一区域


[`Zone`]: {{site.api}}/flutter/dart-async/Zone-class.html
[`BindingBase.debugZoneErrorsAreFatal`]: {{site.api}}/flutter/foundation/BindingBase/debugZoneErrorsAreFatal.html
[Issue 94123]: {{site.repo.flutter}}/issues/94123
[PR 122836]: {{site.repo.flutter}}/pull/122836
