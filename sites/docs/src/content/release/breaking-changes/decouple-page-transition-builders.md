---
# title: Page transition builders reorganization
title: 页面转换构建器重组
# description: >-
#   CupertinoPageTransitionsBuilder has been moved from the
#   Material library to the Cupertino library where it belongs.
description: >-
  CupertinoPageTransitionsBuilder 已从 Material 库移至其所属的 Cupertino 库。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


`CupertinoPageTransitionsBuilder` has been relocated from
`package:flutter/material.dart` to `package:flutter/cupertino.dart`.

`CupertinoPageTransitionsBuilder` 已从 `package:flutter/material.dart` 迁移到 `package:flutter/cupertino.dart`。


## Background

## 背景


Flutter provides several page transition builders that
control how routes animate when navigating between pages.
These builders are used with `PageTransitionsTheme` to
customize transitions per platform.

Flutter 提供了几个页面转换构建器，用于控制在页面之间导航时路由的动画方式。这些构建器与 `PageTransitionsTheme` 一起使用来自定义每个平台的转换。


The available page transition builders are:

可用的页面转换构建器有：


| <t>Builder</t><t>建设者</t> | <t>Library</t><t>图书馆</t> | <t>Description</t><t>描述</t> |
|---------|---------|-------------|
| `FadeUpwardsPageTransitionsBuilder` | Material | Default transition before Material 3 |
| `FadeUpwardsPageTransitionsBuilder` | 材料 | Material 3 之前的默认转换 |
| `OpenUpwardsPageTransitionsBuilder` | Material | Vertical slide transition |
| `OpenUpwardsPageTransitionsBuilder` | 材料 | 垂直滑动过渡 |
| `ZoomPageTransitionsBuilder` | Material | Zoom transition (Material 3 default) |
| `ZoomPageTransitionsBuilder` | 材料 | 缩放过渡（Material 3 默认） |
| `PredictiveBackPageTransitionsBuilder` | Material | Android predictive back gesture support |
| `PredictiveBackPageTransitionsBuilder` | 材料 | Android 预测背部手势支持 |
| `CupertinoPageTransitionsBuilder` | **Cupertino** | iOS-style horizontal slide transition |
| `CupertinoPageTransitionsBuilder` | **Cupertino** | iOS 式水平滑动过渡 |

{:.table}

{：。桌子}


Previously, `CupertinoPageTransitionsBuilder` was defined in
the Material library alongside the other builders.
This class is semantically a Cupertino component because
its implementation uses Cupertino transition mixins and
provides iOS-style navigation animations.

此前，`CupertinoPageTransitionsBuilder` 与其他构建器一起在材质库中定义。这个类在语义上是一个 Cupertino 组件，因为它的实现使用 Cupertino 过渡混合并提供 iOS 风格的导航动画。


This move improves code organization and allows Cupertino apps to
use this builder without depending on the Material library.

这一举措改进了代码组织，并允许 Cupertino 应用程序使用此构建器，而不依赖于材质库。


## Migration guide

## 迁移指南


If you use `CupertinoPageTransitionsBuilder` and
only import `package:flutter/material.dart`,
add an import for `package:flutter/cupertino.dart`.

如果你使用 `CupertinoPageTransitionsBuilder` 并且仅导入 `package:flutter/material.dart`，请添加 `package:flutter/cupertino.dart` 的导入。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/material.dart';

final pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);
```

Code after migration:

迁移后的代码：


```dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final pageTransitionsTheme = PageTransitionsTheme(
  builders: {
    TargetPlatform.android: ZoomPageTransitionsBuilder(),
    TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  },
);
```

If your app already imports both packages, no changes are needed.

如果你的应用程序已导入这两个包，则无需进行任何更改。


## Timeline

## 时间线


Landed in version: 3.43.0-0.1.pre<br>
登陆版本：3.43.0-0.1.pre
In stable release: 3.44
稳定版本：3.44

## References

## 参考资料


Relevant PRs:

相关 PR：


* [Decouple CupertinoPageTransitionsBuilder from Material][pr-179776]

  [将 CupertinoPageTransitionsBuilder 与材质分离][pr-179776]


[pr-179776]: {{site.repo.flutter}}/pull/179776
