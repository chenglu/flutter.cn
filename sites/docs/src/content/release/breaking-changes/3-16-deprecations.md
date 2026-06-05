---
# title: Deprecated API removed after v3.16
title: v3.16 后删除了已弃用的 API
# description: >-
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
3.16 stable release have been removed.

根据 Flutter 的[Deprecation Policy][]，在 3.16 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration.
To further aid your migration, check out this
[quick reference sheet][].

所有受影响的 API 均已编译到此主要源中以帮助迁移。为了进一步帮助你的迁移，请查看此[quick reference sheet][].


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-3-16

## Changes

## Changes


This section lists the deprecations by the package and affected class.

本节列出了包和受影响的类的弃用。


### Button `styleFrom` properties

### 按钮 `styleFrom` 属性


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


The `TextButton`, `ElevatedButton` and `OutlinedButton` widgets all have a
static `styleFrom` method for generating the `ButtonStyle`. The following color
properties of this method for each class were deprecated in v3.1:

`TextButton`、`ElevatedButton` 和 `OutlinedButton` widget 都具有用于生成 `ButtonStyle` 的静态 `styleFrom` 方法。每个类的此方法的以下颜色属性在 v3.1 中已弃用：


* `TextButton.styleFrom`

  `TextButton.styleFrom`

  * `primary`

    `primary`

  * `onSurface`

    `onSurface`

* `ElevatedButton.styleFrom`

  `ElevatedButton.styleFrom`

  * `primary`

    `primary`

  * `onPrimary`

    `onPrimary`

  * `onSurface`

    `onSurface`

* `OutlinedButton.styleFrom`

  `OutlinedButton.styleFrom`

  * `primary`

    `primary`

  * `onSurface`

    `onSurface`


These changes better aligned the API with updated Material Design
specifications. The changes also provided more clarity in how the colors would
be applied to the buttons, by replacing these properties with `backgroundColor`,
`foregroundColor`, and `disabledForegroundColor`.

这些更改更好地使 API 与更新的 Material Design 规范保持一致。通过将这些属性替换为 `backgroundColor`、`foregroundColor` 和 `disabledForegroundColor`，这些更改还使颜色应用于按钮的方式更加清晰。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
TextButton.styleFrom(
  primary: Colors.red,
  onSurface: Colors.black,
);
ElevatedButton.styleFrom(
  primary: Colors.red,
  onPrimary: Colors.blue,
  onSurface: Colors.black,
);
OutlinedButton.styleFrom(
  primary: Colors.red,
  onSurface: Colors.black,
);
```

Code after migration:

迁移后的代码：


```dart
TextButton.styleFrom(
  foregroundColor: Colors.red,
  disabledForegroundColor: Colors.black,
);
ElevatedButton.styleFrom(
  backgroundColor: Colors.red,
  foregroundColor: Colors.blue,
  disabledForegroundColor: Colors.black,
);
OutlinedButton.styleFrom(
  foregroundColor: Colors.red,
  disabledForegroundColor: Colors.black,
);
```

**References**

**参考**


API documentation:

API 文档：


* [`TextButton`][]
* [`ElevatedButton`][]
* [`OutlinedButton`][]
* [`ButtonStyle`][]

Relevant PRs:

相关 PR：


* Deprecated in [#105291][]

  已弃用于[#105291][]

* Removed in [#139267][]

  删除于[#139267][]


[`TextButton`]: {{site.api}}/flutter/material/TextButton-class.html
[`ElevatedButton`]: {{site.api}}/flutter/material/ElevatedButton-class.html
[`OutlinedButton`]: {{site.api}}/flutter/material/OutlinedButton-class.html
[`ButtonStyle`]: {{site.api}}/flutter/material/ButtonStyle-class.html

[#105291]: {{site.repo.flutter}}/pull/105291
[#139267]: {{site.repo.flutter}}/pull/139267

---

### ThemeData.selectedRowColor

### ThemeData.selectedRowColor


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


The `selectedRowColor` property of `ThemeData` was deprecated in v3.1.

`ThemeData` 的 `selectedRowColor` 属性在 v3.1 中已弃用。


The property was no longer used by the framework, as widgets using it migrated
to other component themes or no longer required it in the updated specification
for Material Design.

该属性不再被框架使用，因为使用它的 widgets 已迁移到其他组件主题，或者在更新的 Material Design 规范中不再需要它。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
ThemeData(
  // ...
  selectedRowColor: Colors.pink, // Would have no effect.
);
```

Code after migration:

迁移后的代码：


```dart
ThemeData(
  // ...
  // Remove uses.
);
```

**References**

**参考**


API documentation:

API 文档：


* [`ThemeData`][]

Relevant PRs:

相关 PR：


* Deprecated in [#109070][]

  已弃用于[#109070][]

* Removed in [#139080][]

  删除于[#139080][]


[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html

[#109070]: {{site.repo.flutter}}/pull/109070
[#139080]: {{site.repo.flutter}}/pull/139080

---

### NavigatorState.focusScopeNode

### NavigatorState.focusScopeNode


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


The `focusScopeNode` property of `NavigatorState` was deprecated in v3.1.

`NavigatorState` 的 `focusScopeNode` 属性在 v3.1 中已弃用。


This change was made to resolve several issues stemming around the
`FocusScopeNode` introduced by the `Navigator`. Instead, the `FocusScope`
was moved to enclose the topmost `Navigator` in a `WidgetsApp`.
`NavigatorState` was changed to contain its own `FocusNode`, from where it can
refer to its `FocusNode.enclosingScope` to access the correct `FocusScopeNode`.

进行此更改是为了解决 `Navigator` 引入的 `FocusScopeNode` 周围的多个 issue。相反，`FocusScope` 被移动以将最上面的 `Navigator` 包含在 `WidgetsApp` 中。 `NavigatorState` 已更改为包含其自己的 `FocusNode`，从中可以引用其 `FocusNode.enclosingScope` 来访问正确的 `FocusScopeNode`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
Navigator.of(context).focusScopeNode;

```

Code after migration:

迁移后的代码：


```dart
Navigator.of(context).focusNode.enclosingScope!;
```

**References**

**参考**


API documentation:

API 文档：


* [`Navigator`][]
* [`NavigatorState`][]
* [`FocusScope`][]
* [`FocusScopeNode`][]
* [`FocusNode`][]

Relevant PRs:

相关 PR：


* Deprecated in [#109702][]

  已弃用于[#109702][]

* Removed in [#139260][]

  删除于[#139260][]


[`Navigator`]: {{site.api}}/flutter/widgets/Navigator-class.html
[`NavigatorState`]: {{site.api}}/flutter/widgets/NavigatorState-class.html
[`FocusScope`]: {{site.api}}/flutter/widgets/FocusScope-class.html
[`FocusScopeNode`]: {{site.api}}/flutter/widgets/FocusScopeNode-class.html
[`FocusNode`]: {{site.api}}/flutter/widgets/FocusNode-class.html

[#109702]: {{site.repo.flutter}}/pull/109702
[#139260]: {{site.repo.flutter}}/pull/139260

---

### PlatformMenuBar.body

### PlatformMenuBar.body


Package: flutter
Supported by Flutter Fix: yes

软件包：flutter 由 Flutter 支持 修复：是


The `body` property of `PlatformMenuBar` was deprecated in v3.1.

`PlatformMenuBar` 的 `body` 属性在 v3.1 中已弃用。


This change was made to align `PlatformMenuBar` with other widgets in the
framework, renaming it to `child`.

进行此更改是为了使 `PlatformMenuBar` 与框架中的其他 widget 保持一致，并将其重命名为 `child`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
PlatformMenuBar(
  body: myWidget,
);
```

Code after migration:

迁移后的代码：


```dart
PlatformMenuBar(
  child: myWidget,
);
```

**References**

**参考**


API documentation:

API 文档：


* [`PlatformMenuBar`][]

Relevant PRs:

相关 PR：


* Deprecated in [#104565][]

  已弃用于[#104565][]

* Removed in [#138509][]

  删除于[#138509][]


[`PlatformMenuBar`]: {{site.api}}/flutter/widgets/PlatformMenuBar-class.html

[#104565]: {{site.repo.flutter}}/pull/104565
[#138509]: {{site.repo.flutter}}/pull/138509

---

The [previously announced][] deprecations for `TextTheme`, `WidgetInspectorService`,
and `WidgetInspectorServiceExtensions` were not removed during this cycle.
The `WidgetInspectorService` and `WidgetInspectorServiceExtensions`
deprecation on `setPubRootDirectories` has been extended another year to allow
IDEs and other customer to migrate.
Expect the `TextTheme` deprecations to be removed in the next cycle, which will
be announced again when it comes.

这[previously announced][]在此周期中，未删除 `TextTheme`、`WidgetInspectorService` 和 `WidgetInspectorServiceExtensions` 的弃用。 `setPubRootDirectories` 上的 `WidgetInspectorService` 和 `WidgetInspectorServiceExtensions` 弃用已延长一年，以允许 IDE 和其他客户迁移。预计 `TextTheme` 弃用将在下一个周期中删除，届时将再次宣布。


[previously announced]: https://groups.google.com/g/flutter-announce/c/DLnuqZo714o

---

## Timeline

## 时间线


In stable release: 3.19.0
稳定版本：3.19.0
