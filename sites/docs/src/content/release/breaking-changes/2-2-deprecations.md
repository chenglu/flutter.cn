---
# title: Deprecated API removed after v2.2
title: v2.2 后删除了已弃用的 API
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
2.2 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 2.2 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration. A
[quick reference sheet][] is available as well.

所有受影响的 API 均已编译到此主要源中以帮助迁移。一个[quick reference sheet][]也可用。


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-2-2

## Changes

## Changes


This section lists the deprecations, listed by the affected class.

本节列出了弃用的内容，按受影响的类列出。


### `hasFloatingPlaceholder` of `InputDecoration` & `InputDecorationTheme`

### `hasFloatingPlaceholder` 的 `InputDecoration` 和 `InputDecorationTheme`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


`hasFloatingPlaceholder` was deprecated in v1.13.2.
Use `floatingLabelBehavior` instead.
Where `useFloatingPlaceholder` was true, replace with `FloatingLabelBehavior.auto`.
Where `useFloatingPlaceholder` was false, replace with `FloatingLabelBehavior.never`.
This change allows more behaviors to be specified beyond the original binary
choice, adding `FloatingLabelBehavior.always` as an additional option.

`hasFloatingPlaceholder` 在 v1.13.2 中已弃用。请使用 `floatingLabelBehavior` 代替。如果 `useFloatingPlaceholder` 为 true，则替换为 `FloatingLabelBehavior.auto`。如果 `useFloatingPlaceholder` 为 false，请替换为 `FloatingLabelBehavior.never`。此更改允许指定超出原始二进制选择的更多行为，添加 `FloatingLabelBehavior.always` 作为附加选项。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
// InputDecoration
// Base constructor
InputDecoration(hasFloatingPlaceholder: true);
InputDecoration(hasFloatingPlaceholder: false);

// collapsed constructor
InputDecoration.collapsed(hasFloatingPlaceholder: true);
InputDecoration.collapsed(hasFloatingPlaceholder: false);

// Field access
inputDecoration.hasFloatingPlaceholder;

// InputDecorationTheme
// Base constructor
InputDecorationTheme(hasFloatingPlaceholder: true);
InputDecorationTheme(hasFloatingPlaceholder: false);

// Field access
inputDecorationTheme.hasFloatingPlaceholder;

// copyWith
inputDecorationTheme.copyWith(hasFloatingPlaceholder: false);
inputDecorationTheme.copyWith(hasFloatingPlaceholder: true);
```

Code after migration:

迁移后的代码：


```dart
// InputDecoration
// Base constructor
InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.auto);
InputDecoration(floatingLabelBehavior: FloatingLabelBehavior.never);

// collapsed constructor
InputDecoration.collapsed(floatingLabelBehavior: FloatingLabelBehavior.auto);
InputDecoration.collapsed(floatingLabelBehavior: FloatingLabelBehavior.never);

// Field access
inputDecoration.floatingLabelBehavior;

// InputDecorationTheme
// Base constructor
InputDecorationTheme(floatingLabelBehavior: FloatingLabelBehavior.auto);
InputDecorationTheme(floatingLabelBehavior: FloatingLabelBehavior.never);

// Field access
inputDecorationTheme.floatingLabelBehavior;

// copyWith
inputDecorationTheme.copyWith(floatingLabelBehavior: FloatingLabelBehavior.never);
inputDecorationTheme.copyWith(floatingLabelBehavior: FloatingLabelBehavior.auto);
```

**References**

**参考**


API documentation:

API 文档：


* [`InputDecoration`][]
* [`InputDecorationTheme`][]
* [`FloatingLabelBehavior`][]

Relevant issues:

相关 issue：


* [InputDecoration: option to always float label][]

  [InputDecoration：始终浮动标签的选项][InputDecoration: option to always float label]


Relevant PRs:

相关 PR：


* Deprecated in [#46115][]

  已弃用于[#46115][]

* Removed in [#83923][]

  删除于[#83923][]


[`InputDecoration`]: {{site.api}}/flutter/material/InputDecoration-class.html
[`InputDecorationTheme`]: {{site.api}}/flutter/material/InputDecorationTheme-class.html
[`FloatingLabelBehavior`]: {{site.api}}/flutter/material/FloatingLabelBehavior-class.html
[InputDecoration: option to always float label]: {{site.repo.flutter}}/issues/30664
[#46115]: {{site.repo.flutter}}/pull/46115
[#83923]: {{site.repo.flutter}}/pull/83923

---

### `TextTheme`

### `TextTheme`


Supported by Flutter Fix: yes

由 Flutter 支持修复：是


Several `TextStyle` properties of `TextTheme` were deprecated in v1.13.8. They
are listed in the following table alongside the appropriate replacement in the
new API.

`TextTheme` 的多个 `TextStyle` 属性在 v1.13.8 中已弃用。下表列出了它们以及新 API 中的适当替换。


| <t>Deprecation</t><t>弃用</t> | <t>New API</t><t>新的API</t> |
|---|---|
| display4 | headline1 |
| 显示4 | 标题1 |
| display3 | headline2 |
| 显示3 | 标题2 |
| display2 | headline3 |
| 显示2 | 标题3 |
| display1 | headline4 |
| 显示1 | 标题4 |
| headline | headline5 |
| 标题 | 标题5 |
| title | headline6 |
| 标题 | 标题6 |
| subhead | subtitle1 |
| 小标题 | 副标题1 |
| body2 | bodyText1 |
| 身体2 | 正文文本1 |
| body1 | bodyText2 |
| 身体1 | 正文2 |
| subtitle | subtitle2 |
| 字幕 | 副标题2 |

**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
// TextTheme
// Base constructor
TextTheme(
  display4: displayStyle4,
  display3: displayStyle3,
  display2: displayStyle2,
  display1: displayStyle1,
  headline: headlineStyle,
  title: titleStyle,
  subhead: subheadStyle,
  body2: body2Style,
  body1: body1Style,
  caption: captionStyle,
  button: buttonStyle,
  subtitle: subtitleStyle,
  overline: overlineStyle,
);

// copyWith
TextTheme.copyWith(
  display4: displayStyle4,
  display3: displayStyle3,
  display2: displayStyle2,
  display1: displayStyle1,
  headline: headlineStyle,
  title: titleStyle,
  subhead: subheadStyle,
  body2: body2Style,
  body1: body1Style,
  caption: captionStyle,
  button: buttonStyle,
  subtitle: subtitleStyle,
  overline: overlineStyle,
);

// Getters
TextStyle style;
style = textTheme.display4;
style = textTheme.display3;
style = textTheme.display2;
style = textTheme.display1;
style = textTheme.headline;
style = textTheme.title;
style = textTheme.subhead;
style = textTheme.body2;
style = textTheme.body1;
style = textTheme.caption;
style = textTheme.button;
style = textTheme.subtitle;
style = textTheme.overline;
```

Code after migration:

迁移后的代码：


```dart
// TextTheme
// Base constructor
TextTheme(
  headline1: displayStyle4,
  headline2: displayStyle3,
  headline3: displayStyle2,
  headline4: displayStyle1,
  headline5: headlineStyle,
  headline6: titleStyle,
  subtitle1: subheadStyle,
  bodyText1: body2Style,
  bodyText2: body1Style,
  caption: captionStyle,
  button: buttonStyle,
  subtitle2: subtitleStyle,
  overline: overlineStyle,
);

TextTheme.copyWith(
  headline1: displayStyle4,
  headline2: displayStyle3,
  headline3: displayStyle2,
  headline4: displayStyle1,
  headline5: headlineStyle,
  headline6: titleStyle,
  subtitle1: subheadStyle,
  bodyText1: body2Style,
  bodyText2: body1Style,
  caption: captionStyle,
  button: buttonStyle,
  subtitle2: subtitleStyle,
  overline: overlineStyle,
);

TextStyle style;
style = textTheme.headline1;
style = textTheme.headline2;
style = textTheme.headline3;
style = textTheme.headline4;
style = textTheme.headline5;
style = textTheme.headline6;
style = textTheme.subtitle1;
style = textTheme.bodyText1;
style = textTheme.bodyText2;
style = textTheme.caption;
style = textTheme.button;
style = textTheme.subtitle2;
style = textTheme.overline;
```

**References**

**参考**


Design document:

设计文档：


* [Update the TextTheme API][]

  [更新 TextTheme API][Update the TextTheme API]


API documentation:

API 文档：


* [`TextTheme`][]

Relevant issues:

相关 issue：


* [Migrate TextTheme to 2018 APIs][]

  [将 TextTheme 迁移到 2018 API][Migrate TextTheme to 2018 APIs]


Relevant PRs:

相关 PR：


* Deprecated in [#48547][]

  已弃用于[#48547][]

* Removed in [#83924][]

  删除于[#83924][]


[Update the TextTheme API]: /go/update-text-theme-api
[`TextTheme`]: {{site.api}}/flutter/material/TextTheme-class.html
[Migrate TextTheme to 2018 APIs]: {{site.repo.flutter}}/issues/45745
[#48547]: {{site.repo.flutter}}/pull/48547
[#83924]: {{site.repo.flutter}}/pull/83924

---

### Default `Typography`

### 默认 `Typography`


Supported by Flutter Fix: no

由 Flutter 支持修复：否


The default `Typography` was deprecated in v1.13.8.
The prior default returned the text styles of the 2014 Material Design specification.
This will now result in `TextStyle`s reflecting the 2018 Material Design specification.
For the former, use the `material2014` constructor.

默认的 `Typography` 在 v1.13.8 中已弃用。之前的默认返回 2014 Material Design 规范的文本样式。现在，这将导致 `TextStyle`s 反映 2018 年材料设计规范。对于前者，请使用 `material2014` 构造函数。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
// Formerly returned 2014 TextStyle spec
Typography();
```

Code after migration:

迁移后的代码：


```dart
// Use 2018 TextStyle spec, either by default or explicitly.
Typography();
Typography.material2018();

// Use 2014 spec from former API
Typography.material2014();
```

**References**

**参考**


Design document:

设计文档：


* [Update the TextTheme API][]

  [更新 TextTheme API][Update the TextTheme API]


API documentation:

API 文档：


* [`Typography`][]

Relevant issues:

相关 issue：


* [Migrate TextTheme to 2018 APIs][]

  [将 TextTheme 迁移到 2018 API][Migrate TextTheme to 2018 APIs]


Relevant PRs:

相关 PR：


* Deprecated in [#48547][]

  已弃用于[#48547][]

* Removed in [#83924][]

  删除于[#83924][]


[Update the TextTheme API]: /go/update-text-theme-api
[`Typography`]: {{site.api}}/flutter/material/Typography-class.html
[Migrate TextTheme to 2018 APIs]: {{site.repo.flutter}}/issues/45745
[#48547]: {{site.repo.flutter}}/pull/48547
[#83924]: {{site.repo.flutter}}/pull/83924

---

## Timeline

## 时间线


In stable release: 2.5
稳定版本：2.5
