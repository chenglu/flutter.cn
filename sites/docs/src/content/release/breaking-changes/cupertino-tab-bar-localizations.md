---
# title: CupertinoTabBar requires Localizations parent
title: CupertinoTabBar 需要本地化父级
# description: >
#   In order to provide locale appropriate semantics, the
#   CupertinoTabBar requires a Localizations parent.
description: >-
  为了提供适当的语言环境语义，CupertinoTabBar 需要 Localizations 父级。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


Instances of `CupertinoTabBar` must have a
`Localizations`parent in order to provide a localized
`Semantics` hint. Trying to instantiate a
`CupertinoTabBar` without localizations
results in an assertion such as the following:

`CupertinoTabBar` 的实例必须具有 `Localizations`parent 才能提供本地化的 `Semantics` 提示。尝试在没有本地化的情况下实例化 `CupertinoTabBar` 会导致如下断言：


```plaintext
CupertinoTabBar requires a Localizations parent in order to provide an appropriate Semantics hint
for tab indexing. A CupertinoApp provides the DefaultCupertinoLocalizations, or you can
instantiate your own Localizations.
'package:flutter/src/cupertino/bottom_tab_bar.dart':
Failed assertion: line 213 pos 7: 'localizations != null'
```

## Context

## 背景


To support localized semantics information,
the `CupertinoTabBar` requires localizations.

为了支持本地化语义信息，`CupertinoTabBar` 需要本地化。


Before this change, the `Semantics` hint provided
to the `CupertinoTabBar` was a hard-coded String,
'tab, $index of $total'. The content of the semantics
hint was also updated from this original
String to 'Tab $index of $total' in English.

在此更改之前，提供给 `CupertinoTabBar` 的 `Semantics` 提示是一个硬编码字符串“tab, $index of $total”。语义提示的内容也从原来的字符串更新为英文的“Tab $index of $total”。


If your `CupertinoTabBar` is within the scope
of a `CupertinoApp`, the `DefaultCupertinoLocalizations`
is already instantiated and may suit your
needs without having to make a change to your existing code.

如果你的 `CupertinoTabBar` 在 `CupertinoApp` 的范围内，则 `DefaultCupertinoLocalizations` 已经实例化，并且可能满足你的需求，而无需更改现有代码。


If your `CupertinoTabBar` is not within a `CupertinoApp`,
you may provide the localizations of
your choosing using the `Localizations` widget.

如果你的 `CupertinoTabBar` 不在 `CupertinoApp` 内，你可以使用 `Localizations` widget 提供你选择的本地化。


## Migration guide

## 迁移指南


If you are seeing a `'localizations != null'` assertion error,
make sure locale information is being
provided to your `CupertinoTabBar`.

如果你看到 `'localizations != null'` 断言错误，请确保将区域设置信息提供给你的 `CupertinoTabBar`。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/cupertino.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: const MediaQueryData(),
      child: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled_solid),
            label: 'Tab 2',
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}
```

Code after migration (Providing localizations via the `CupertinoApp`):

迁移后的代码（通过 `CupertinoApp` 提供本地化）：


```dart
import 'package:flutter/cupertino.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled),
            label: 'Tab 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.add_circled_solid),
            label: 'Tab 2',
          ),
        ],
        currentIndex: 1,
      ),
    );
  }
}
```

Code after migration (Providing localizations by using
the `Localizations` widget):

迁移后的代码（使用 `Localizations` widget 提供本地化）：


```dart
import 'package:flutter/cupertino.dart';

void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Localizations(
      locale: const Locale('en', 'US'),
      delegates: <LocalizationsDelegate<dynamic>>[
        DefaultWidgetsLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      child: MediaQuery(
        data: const MediaQueryData(),
        child: CupertinoTabBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled),
              label: 'Tab 1',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.add_circled_solid),
              label: 'Tab 2',
            ),
          ],
          currentIndex: 1,
        ),
      ),
    );
  }
}
```

## Timeline

## 时间线


Landed in version: 1.18.0-9.0.pre<br>
登陆版本：1.18.0-9.0.pre
In stable release: 1.20.0
稳定版本：1.20.0

## References

## 参考资料


API documentation:

API 文档：


* [`CupertinoTabBar`][]
* [`Localizations`][]
* [`DefaultCupertinoLocalizations`][]
* [`Semantics`][]
* [`CupertinoApp`][]
* [Internationalizing Flutter Apps][]

  [国际化 Flutter 应用程序][Internationalizing Flutter Apps]



Relevant PR:

相关 PR：


* [PR 55336: Adding tabSemanticsLabel to CupertinoLocalizations][]

  [PR 55336：将 tabSemanticsLabel 添加到 CupertinoLocalizations][PR 55336: Adding tabSemanticsLabel to CupertinoLocalizations]

* [PR 56582: Update Tab semantics in Cupertino to be the same as Material][]

  [PR 56582：更新 Cupertino 中的选项卡语义以与材质相同][PR 56582: Update Tab semantics in Cupertino to be the same as Material]


[`CupertinoTabBar`]: {{site.api}}/flutter/cupertino/CupertinoTabBar-class.html
[`Localizations`]: {{site.api}}/flutter/widgets/Localizations-class.html
[`DefaultCupertinoLocalizations`]: {{site.api}}/flutter/cupertino/DefaultCupertinoLocalizations-class.html
[`Semantics`]: {{site.api}}/flutter/widgets/Semantics-class.html
[`CupertinoApp`]: {{site.api}}/flutter/cupertino/CupertinoApp-class.html
[Internationalizing Flutter Apps]: /ui/internationalization
[PR 55336: Adding tabSemanticsLabel to CupertinoLocalizations]: {{site.repo.flutter}}/pull/55336
[PR 56582: Update Tab semantics in Cupertino to be the same as Material]: {{site.repo.flutter}}/pull/56582#issuecomment-625497951
