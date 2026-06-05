---
# title: Deprecated API removed after v2.5
title: v2.5 后已删除已弃用的 API
# description: >
#   After reaching end of life, the following deprecated APIs
#   were removed from Flutter.
description: >-
  生命周期结束后，以下已弃用的 API 已从 Flutter 中删除。
ai-translated: true
---

## Summary

## 摘要


In accordance with Flutter's [Deprecation Policy][],
deprecated APIs that reached end of life after the
2.5 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 2.5 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。



[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-2-5

## Changes

## Changes


This section lists the deprecations by affected class.

本节列出了受影响类的弃用内容。


---

### `autovalidate` of `Form` & related classes

### `Form` 的 `autovalidate` 及相关课程


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


`autovalidate` was deprecated in v1.19.

`autovalidate` 在 v1.19 中已弃用。


Use `autovalidateMode` instead.
Where `autovalidate` was true, replace with `AutovalidateMode.always`.
Where `autovalidate` was false, replace with `AutovalidateMode.disabled`.
This change allows more behaviors to be specified beyond the original binary
choice, adding `AutovalidateMode.onUserInteraction` as an additional option.

请使用 `autovalidateMode` 代替。如果 `autovalidate` 为 true，则替换为 `AutovalidateMode.always`。如果 `autovalidate` 为 false，则替换为 `AutovalidateMode.disabled`。此更改允许指定超出原始二进制选择的更多行为，添加 `AutovalidateMode.onUserInteraction` 作为附加选项。


The following classes all have the same change of API:

以下类都具有相同的 API 更改：


- `Form`

  `Form`

- `FormField`

  `FormField`

- `DropdownButtonFormField`

  `DropdownButtonFormField`

- `TextFormField`

  `TextFormField`


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
const Form form = Form(autovalidate: true);
const Form form = Form(autovalidate: false);
final autoMode = form.autovalidate;

const FormField formField = FormField(autovalidate: true);
const FormField formField = FormField(autovalidate: false);
final autoMode = formField.autovalidate;

const TextFormField textFormField = TextFormField(autovalidate: true);
const TextFormField textFormField = TextFormField(autovalidate: false);

const DropdownButtonFormField dropDownButtonFormField = DropdownButtonFormField(autovalidate: true);
const DropdownButtonFormField dropdownButtonFormField = DropdownButtonFormField(autovalidate: false);
```

Code after migration:

迁移后的代码：


```dart
const Form form = Form(autovalidateMode: AutovalidateMode.always);
const Form form = Form(autovalidateMode: AutovalidateMode.disabled);
final autoMode = form.autovalidateMode;

const FormField formField = FormField(autovalidateMode: AutovalidateMode.always);
const FormField formField = FormField(autovalidateMode: AutovalidateMode.disabled);
final autoMode = formField.autovalidateMode;

const TextFormField textFormField = TextFormField(autovalidateMode: AutovalidateMode.always);
const TextFormField textFormField = TextFormField(autovalidateMode: AutovalidateMode.disabled);

const DropdownButtonFormField dropDownButtonFormField = DropdownButtonFormField(autovalidateMode: AutovalidateMode.always);
const DropdownButtonFormField dropdownButtonFormField = DropdownButtonFormField(autovalidateMode: AutovalidateMode.disabled);
```

[In-depth migration guide available]: /release/breaking-changes/form-field-autovalidation-api

**References**

**参考**


API documentation:

API 文档：


* [`Form`][]
* [`FormField`][]
* [`TextFormField`][]
* [`DropdownButtonFormField`][]
* [`AutovalidateMode`][]

Relevant issues:

相关 issue：


* [Issue 56363]({{site.repo.flutter}}/issues/56363)
* [Issue 18885]({{site.repo.flutter}}/issues/18885)
* [Issue 15404]({{site.repo.flutter}}/issues/15404)
* [Issue 36154]({{site.repo.flutter}}/issues/36154)
* [Issue 48876]({{site.repo.flutter}}/issues/48876)

Relevant PRs:

相关 PR：


* Deprecated in [#59766]({{site.repo.flutter}}/pull/59766)

  已弃用于[#59766]({{site.repo.flutter}}/pull/59766)

* Removed in [#90292]({{site.repo.flutter}}/pull/90292)

  删除于[#90292]({{site.repo.flutter}}/pull/90292)


[`Form`]: {{site.api}}/flutter/widgets/Form-class.html
[`FormField`]: {{site.api}}/flutter/widgets/FormField-class.html
[`TextFormField`]: {{site.api}}/flutter/material/TextFormField-class.html
[`DropdownButtonFormField`]: {{site.api}}/flutter/material/DropdownButtonFormField-class.html
[`AutovalidateMode`]: {{site.api}}/flutter/widgets/AutovalidateMode-class.html

---

### `FloatingHeaderSnapConfiguration.vsync`

### `FloatingHeaderSnapConfiguration.vsync`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The `TickerProvider` `vsync` property of `FloatingHeaderSnapConfiguration` was
deprecated in v1.19.

`FloatingHeaderSnapConfiguration` 的 `TickerProvider` `vsync` 属性已在 v1.19 中弃用。


The `vsync` for the animation should instead be specified using
`SliverPersistentHeaderDelegate.vsync`.

动画的 `vsync` 应改为使用 `SliverPersistentHeaderDelegate.vsync` 指定。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration(vsync: myTickerProvider);
}
```

Code after migration:

迁移后的代码：


```dart
class MySliverPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  FloatingHeaderSnapConfiguration? get snapConfiguration => FloatingHeaderSnapConfiguration();
  TickerProvider? get vsync => myTickerProvider;
}

```

**References**

**参考**


Design document:

设计文档：


* [Control SliverPersistentHeader's showOnScreen Behavior][]

  [控制 SliverPersistentHeader 的 showOnScreen 行为][Control SliverPersistentHeader's showOnScreen Behavior]


API documentation:

API 文档：


* [`FloatingHeaderSnapConfiguration`][]
* [`SliverPersistentHeaderDelegate`][]
* [`TickerProvider`][]

Relevant issues:

相关 issue：


* [Issue 25507]({{site.repo.flutter}}/issues/25507)

Relevant PRs:

相关 PR：


* Deprecated in [#56413]({{site.repo.flutter}}/pull/56413)

  已弃用于[#56413]({{site.repo.flutter}}/pull/56413)

* Removed in [#90293]({{site.repo.flutter}}/pull/90293)

  删除于[#90293]({{site.repo.flutter}}/pull/90293)


[Control SliverPersistentHeader's showOnScreen Behavior]: https://docs.google.com/document/d/1BZhxy176uUnqOCnXdnHM1XetS9mw9WIyUAOE-dgVdUM/edit?usp=sharing
[`FloatingHeaderSnapConfiguration`]: {{site.api}}/flutter/rendering/FloatingHeaderSnapConfiguration-class.html
[`SliverPersistentHeaderDelegate`]: {{site.api}}/flutter/widgets/SliverPersistentHeaderDelegate-class.html
[`TickerProvider`]: {{site.api}}/flutter/scheduler/TickerProvider-class.html

---

### `AndroidViewController` & subclasses' `id`

### `AndroidViewController` 和子类' `id`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The `id` of `AndroidViewController`, `TextureAndroidViewController`, and
`SurfaceAndroidViewController`, was deprecated in v1.20.

`AndroidViewController`、`TextureAndroidViewController` 和 `SurfaceAndroidViewController` 的 `id` 在 v1.20 中已弃用。


For all of these use cases, `viewId` should be used instead.

对于所有这些用例，应改用 `viewId`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
final SurfaceAndroidViewController surfaceController = SurfaceAndroidViewController(
  viewId: 10,
  viewType: 'FixTester',
  layoutDirection: TextDirection.ltr,
);
int viewId = surfaceController.id;
final SurfaceAndroidViewController surfaceController = SurfaceAndroidViewController(
  error: '',
);
final TextureAndroidViewController textureController = TextureAndroidViewController(
  error: '',
);
final TextureAndroidViewController textureController = TextureAndroidViewController(
  viewId: 10,
  viewType: 'FixTester',
  layoutDirection: TextDirection.ltr,
);
viewId = textureController.id;
```

Code after migration:

迁移后的代码：


```dart
final SurfaceAndroidViewController surfaceController = SurfaceAndroidViewController(
  viewId: 10,
  viewType: 'FixTester',
  layoutDirection: TextDirection.ltr,
);
int viewId = surfaceController.viewId;
final SurfaceAndroidViewController surfaceController = SurfaceAndroidViewController(
  error: '',
);
final TextureAndroidViewController textureController = TextureAndroidViewController(
  error: '',
);
final TextureAndroidViewController textureController = TextureAndroidViewController(
  viewId: 10,
  viewType: 'FixTester',
  layoutDirection: TextDirection.ltr,
);
viewId = textureController.viewId;
```

**References**

**参考**


Design document:

设计文档：


* [Flutter Hybrid Composition][]

  [Flutter 混合成分][Flutter Hybrid Composition]


API documentation:

API 文档：


* [`AndroidViewController`][]
* [`TextureAndroidViewController`][]
* [`SurfaceAndroidViewController`][]

Relevant issues:

相关 issue：


* [Issue 55218]({{site.repo.flutter}}/issues/55218)

Relevant PRs:

相关 PR：


* Deprecated in [#60320]({{site.repo.flutter}}/issues/60320)

  已弃用于[#60320]({{site.repo.flutter}}/issues/60320)

* Removed in [#90294]({{site.repo.flutter}}/issues/90294)

  删除于[#90294]({{site.repo.flutter}}/issues/90294)


[Flutter Hybrid Composition]: {{site.repo.flutter}}/blob/main/docs/platforms/Hybrid-Composition.md
[`AndroidViewController`]: {{site.api}}/flutter/services/AndroidViewController-class.html
[`TextureAndroidViewController`]: {{site.api}}/flutter/services/TextureAndroidViewController-class.html
[`SurfaceAndroidViewController`]: {{site.api}}/flutter/services/SurfaceAndroidViewController-class.html

---

### `BlacklistingTextInputFormatter` & `WhitelistingTextInputFormatter`

### `BlacklistingTextInputFormatter` 和 `WhitelistingTextInputFormatter`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The entire classes of `BlacklistingTextInputFormatter` and
`WhitelistingTextInoutFormatter` were deprecated in v1.20.

`BlacklistingTextInputFormatter` 和 `WhitelistingTextInoutFormatter` 的整个类在 v1.20 中已弃用。


Their functionality has been rewritten into a single class,
`FilteringTextInputFormatter`.

它们的功能已被重写为单个类 `FilteringTextInputFormatter`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
formatter = BlacklistingTextInputFormatter(pattern, replacementString: 'replacedPattern');
formatter = BlacklistingTextInputFormatter.singleLineFormatter;
pattern = formatter.blacklistedPattern;
formatter = WhitelistingTextInputFormatter(pattern);
formatter = WhitelistingTextInputFormatter.digitsOnly;
pattern = formatter.whitelistedPattern;
```

Code after migration:

迁移后的代码：


```dart
formatter = FilteringTextInputFormatter.deny(pattern, replacementString: 'replacedPattern');
formatter = FilteringTextInputFormatter.singleLineFormatter;
pattern = formatter.filterPattern;
formatter = FilteringTextInputFormatter.allow(pattern);
formatter = FilteringTextInputFormatter.digitsOnly;
pattern = formatter.filterPattern;
```

**References**

**参考**


API documentation:

API 文档：


* [`FilteringTextInputFormatter`][]

Relevant PRs:

相关 PR：


* Deprecated in [#59120]({{site.repo.flutter}}/issues/59120)

  已弃用于[#59120]({{site.repo.flutter}}/issues/59120)

* Removed in [#90296]({{site.repo.flutter}}/issues/90296)

  删除于[#90296]({{site.repo.flutter}}/issues/90296)


[`FilteringTextInputFormatter`]: {{site.api}}/flutter/services/FilteringTextInputFormatter-class.html

---

### `BottomNavigationBarItem.title`

### `BottomNavigationBarItem.title`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


The `title` of `BottomNavigationBarItem` was deprecated in v1.19.
The `label` property should be used instead. This migration allows for better
text scaling, and presents built-in `Tooltip`s for the `BottomNavigationBarItem`
in the context of a `BottomNavigationBar`.

`BottomNavigationBarItem` 的 `title` 在 v1.19 中已弃用。应改用 `label` 属性。此迁移允许更好的文本缩放，并在 `BottomNavigationBar` 的上下文中为 `BottomNavigationBarItem` 提供内置 `Tooltip`s。


**Migration guide**

**迁移指南**


[In-depth migration guide available][]

Code before migration:

迁移前的代码：


```dart
const BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(title: myTitle);
const BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem();
bottomNavigationBarItem.title;
```

Code after migration:

迁移后的代码：


```dart
const BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem(label: myTitle);
const BottomNavigationBarItem bottomNavigationBarItem = BottomNavigationBarItem();
bottomNavigationBarItem.label;
```

**References**

**参考**


Design document:

设计文档：

* [BottomNavigationBarItem title][]

  [BottomNavigationBarItem 标题][BottomNavigationBarItem title]


API documentation:

API 文档：


* [`BottomNavigationBarItem`][]
* [`BottomNavigationBar`][]
* [`Tooltip`][]

Relevant PRs:

相关 PR：


* Deprecated in [#59127]({{site.repo.flutter}}/issues/59127)

  已弃用于[#59127]({{site.repo.flutter}}/issues/59127)

* Removed in [#90295]({{site.repo.flutter}}/issues/90295)

  删除于[#90295]({{site.repo.flutter}}/issues/90295)


[In-depth migration guide available]: /release/breaking-changes/bottom-navigation-title-to-label
[BottomNavigationBarItem title]: /go/bottom-navigation-bar-title-deprecation
[`BottomNavigationBarItem`]: {{site.api}}/flutter/widgets/BottomNavigationBarItem-class.html
[`BottomNavigationBar`]: {{site.api}}/flutter/material/BottomNavigationBar-class.html
[`Tooltip`]: {{site.api}}/flutter/material/Tooltip-class.html

---

### `packageRoot` in `dart:core`, `dart:isolate`, and `package:platform`

### `dart:core`、`dart:isolate` 和 `package:platform` 中的 `packageRoot`


The following APIs have been removed:

以下 API 已被删除：


* [`Platform.packageRoot`][] in `dart:core`

  [`Platform.packageRoot`][]在 `dart:core`

* [`Isolate.packageRoot`][] in `dart:isolate`

  [`Isolate.packageRoot`][]在 `dart:isolate`

* [`Platform.packageRoot`][] in `package:platform`

  [`Platform.packageRoot`][]在 `package:platform`


These APIs were marked deprecated [in Dart 2.0][dart-deprecated], and did not
work correctly in any Dart 2.x release.

这些 API 已被标记为已弃用 [在 Dart 2.0 中][dart-deprecated]，并且在任何 Dart 2.x 版本中都无法正常工作。


**Migration guide**

**迁移指南**


These `packageRoot` APIs have been replaced by a new set of `packageConfig` APIs,
which you should migrate to.

这些 `packageRoot` API 已被一组新的 `packageConfig` API 取代，你应该迁移到这些 API。


* [`Platform.packageConfig`][] in `dart:core`

  [`Platform.packageConfig`][]在 `dart:core`

* [`Isolate.packageConfig`][] in `dart:isolate`

  [`Isolate.packageConfig`][]在 `dart:isolate`

* [`Platform.packageConfig`][] in `package:platform`

  [`Platform.packageConfig`][]在 `package:platform`


If you are using the `package:platform` package, note that regardless of whether
you are using the `packageRoot` API or not, older versions of that package are
not compatible with Dart 2.16 and later, as they depend on the now removed
`packageRoot` API. You may see an error like this when attempting to run your
app:

如果你使用 `package:platform` 软件包，请注意，无论你是否使用 `packageRoot` API，该软件包的旧版本均与 Dart 2.16 及更高版本不兼容，因为它们依赖于现已删除的 `packageRoot` API。尝试运行应用程序时，你可能会看到如下错误：


```plaintext
../../.pub-cache/hosted/pub.dartlang.org/platform-3.0.0/
  lib/src/interface/local_platform.dart:46:19:
  Error: Member not found: 'packageRoot'.
      io.Platform.packageRoot; // ignore: deprecated_member_use
                  ^^^^^^^^^^^
```

To resolve that, upgrade to version `3.1.0` or later of `package:platform` by
upgrading the constraint in your `pubspec.yaml` file:

要解决此问题，请通过升级 `pubspec.yaml` 文件中的约束来升级到版本 `3.1.0` 或更高版本的 `package:platform`：


```yaml
dependencies:
  platform: ^3.1.0
```

**References**

**参考**


Relevant PRs:

相关 PR：


* Removed from the Dart libraries in [#47769][]

  从 Dart 库中删除[#47769][]

* Removed from `package:platform` in [PR #38][]

  从 `package:platform` 中删除[PR #38][]

* Updated Flutter to use `package:platform` 3.1.0 in [PR #94603][]

  更新了 Flutter 以使用 `package:platform` 3.1.0[PR #94603][]


[`Platform.packageRoot`]: {{site.dart.api}}/stable/2.15.1/dart-io/Platform/packageRoot.html
[`Isolate.packageRoot`]: {{site.dart.api}}/stable/2.15.1/dart-isolate/Isolate/packageRoot.html
[`Platform.packageRoot`]: {{site.pub-api}}/platform/3.0.0/platform/Platform/packageRoot.html
[dart-deprecated]: https://dart-review.googlesource.com/c/sdk/+/59100/16/CHANGELOG.md
[`Platform.packageConfig`]: {{site.dart.api}}/stable/2.15.1/dart-io/Platform/packageConfig.html
[`Isolate.packageConfig`]: {{site.dart.api}}/stable/2.15.1/dart-isolate/Isolate/packageConfig.html
[`Platform.packageConfig`]: {{site.pub-api}}/platform/3.0.0/platform/Platform/packageConfig.html
[#47769]: {{site.github}}/dart-lang/sdk/issues/47769
[PR #38]: {{site.github}}/google/platform.dart/pull/38
[PR #94603]: {{site.repo.flutter}}/pull/94603

---

## Timeline

## 时间线


In stable release: 2.10
稳定版本：2.10
