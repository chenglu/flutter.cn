---
# title: TextField requires a MaterialLocalizations widget
title: TextField 需要 MaterialLocalizations widget
# description: >
#   TextField now throws an assert error if there is
#   no MaterialLocalizations widget in the widget tree.
description: >
  如果 widget 树中没有 MaterialLocalizations widget，TextField 现在会引发断言错误。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Instances of `TextField` must have a
`MaterialLocalizations` present in the widget tree.
Trying to instantiate a `TextField` without the proper localizations
results in an assertion such as the following:

“TextField”的实例必须在 widget 树中具有“MaterialLocalizations”。尝试在没有正确本地化的情况下实例化“TextField”会导致如下断言：


```plaintext
No MaterialLocalizations found.
TextField widgets require MaterialLocalizations to be provided by a Localizations widget ancestor.
The material library uses Localizations to generate messages, labels, and abbreviations.
To introduce a MaterialLocalizations, either use a MaterialApp at the root of your application to
include them automatically, or add a Localization widget with a MaterialLocalizations delegate.
The specific widget that could not find a MaterialLocalizations ancestor was:
  TextField
```

## Context

## 背景


If the `TextField` descends from a `MaterialApp`, the
`DefaultMaterialLocalizations` is already instantiated
and won't require any changes to your existing code.

如果“TextField”源自“MaterialApp”，则“DefaultMaterialLocalizations”已实例化，不需要对现有代码进行任何更改。


If the `TextField` doesn't descend from `MaterialApp`,
you can use a `Localizations` widget to
provide your own localizations.

如果“TextField”不是从“MaterialApp”继承的，你可以使用“Localizations”widget 来提供你自己的本地化。


## Migration guide

## 迁移指南


If you see an assertion error, make sure that
locale information is available to the `TextField`,
either through an ancestor `MaterialApp`
(that automatically provides `Localizations`), or
by creating your own `Localizations` widget.

如果你看到断言错误，请确保区域设置信息可用于“TextField”，无论是通过祖先“MaterialApp”（自动提供“Localizations”），还是通过创建你自己的“Localizations”widget。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/material.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Material(
          child: TextField(),
        ),
      ),
    );
  }
}
```

Code after migration (Providing localizations using the `MaterialApp`):

迁移后的代码（使用“MaterialApp”提供本地化）：


```dart
import 'package:flutter/material.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Material(
        child: TextField(),
      ),
    );
  }
}
```

Code after migration (Providing localizations via the `Localizations` widget):

迁移后的代码（通过“Localizations”widget 提供本地化）：


```dart
import 'package:flutter/material.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: const <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultMaterialLocalizations.delegate,
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Material(
            child: TextField(),
          ),
        ),
      ),
    );
  }
}
```

## Timeline

## 时间轴


Landed in version: 1.20.0-1.0.pre<br>
In stable release: 1.20

登陆版本：1.20.0-1.0.pre<br> 稳定版本：1.20


## References

## 参考


API documentation:

API 文档：


* [`TextField`][]


* [`Localizations`][]


* [`MaterialLocalizations`][]


* [`DefaultMaterialLocalizations`][]


* [`MaterialApp`][]

  [`MaterialApp`][]

* [Internationalizing Flutter apps][]

  [国际化 Flutter 应用][Internationalizing Flutter apps]


Relevant PR:

相关公关：


* [PR 58831: Assert debugCheckHasMaterialLocalizations on TextField][]

  [PR 58831：在 TextField 上断言 debugCheckHasMaterialLocalizations][PR 58831: Assert debugCheckHasMaterialLocalizations on TextField]


[`TextField`]: {{site.api}}/flutter/material/TextField-class.html
[`Localizations`]: {{site.api}}/flutter/widgets/Localizations-class.html
[`MaterialLocalizations`]: {{site.api}}/flutter/material/MaterialLocalizations-class.html
[`DefaultMaterialLocalizations`]: {{site.api}}/flutter/material/DefaultMaterialLocalizations-class.html
[`MaterialApp`]: {{site.api}}/flutter/material/MaterialApp-class.html
[Internationalizing Flutter apps]: /ui/internationalization
[PR 58831: Assert debugCheckHasMaterialLocalizations on TextField]: {{site.repo.flutter}}/pull/58831
