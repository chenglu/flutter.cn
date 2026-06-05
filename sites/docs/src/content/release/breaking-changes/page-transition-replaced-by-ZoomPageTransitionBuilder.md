---
# title: Page transitions replaced by ZoomPageTransitionsBuilder
title: 页面过渡被 ZoomPageTransitionsBuilder 取代
# description: Using the latest page transition instead of the old one.
description: 使用最新的页面过渡而不是旧的页面过渡。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


In order to ensure that libraries follow the latest OEM behavior,
the default page transition builders now use
`ZoomPageTransitionsBuilder` on all platforms (excluding iOS and macOS)
instead of `FadeUpwardsPageTransitionsBuilder`.

为了确保库遵循最新的 OEM 行为，默认页面转换构建器现在在所有平台（iOS 和 macOS 除外）上使用“ZoomPageTransitionsBuilder”，而不是“FadeUpwardsPageTransitionsBuilder”。


## Context

## 背景


The `FadeUpwardsPageTransitionsBuilder` (provided with the first
Flutter release), defined a page transition that's
similar to the one provided by Android O. This page transitions builder
will eventually be deprecated on Android, as per Flutter's
[deprecation policy](/release/compatibility-policy#deprecation-policy).

“FadeUpwardsPageTransitionsBuilder”（随第一个 Flutter 版本提供）定义了与 Android O 提供的页面转换类似的页面转换。根据 Flutter 的[弃用政策](/release/compatibility-policy#deprecation-policy)，此页面转换构建器最终将在 Android 上弃用。


`ZoomPageTransitionsBuilder`, the new page transition builder for
Android, Linux, and Windows, defines a page transition that's similar to
the one provided by Android Q and R.

“ZoomPageTransitionsBuilder”是适用于 Android、Linux 和 Windows 的新页面转换构建器，定义了与 Android Q 和 R 提供的页面转换类似的页面转换。


According to the [Style guide for Flutter repo][],
the framework will follow the latest OEM behavior.
Page transition builders using `FadeUpwardsPageTransitionsBuilder`
are all switched to the `ZoomPageTransitionsBuilder`.
When the current `TargetPlatform` doesn't have
`PageTransitionsBuilder` defined in the `ThemeData.pageTransitionsTheme`,
`ZoomPageTransitionsBuilder` is used as the default.

根据[Flutter repo 风格指南][Style guide for Flutter repo]，该框架将遵循最新的 OEM 行为。使用“FadeUpwardsPageTransitionsBuilder”的页面转换构建器全部切换为“ZoomPageTransitionsBuilder”。当当前的“TargetPlatform”没有在“ThemeData.pageTransitionsTheme”中定义“PageTransitionsBuilder”时，将使用“ZoomPageTransitionsBuilder”作为默认值。


[Style guide for Flutter repo]: {{site.repo.flutter}}/blob/main/docs/contributing/Style-guide-for-Flutter-repo.md
## Description of change

## 变更说明


`PageTransitionsBuilder`s defined in
`PageTransitionsTheme._defaultBuilders` have changed from
`FadeUpwardsPageTransitionsBuilder` to
`ZoomPageTransitionsBuilder` for `TargetPlatform.android`,
`TargetPlatform.linux` and `TargetPlatform.windows`.

对于“TargetPlatform.android”、“TargetPlatform.linux”和“TargetPlatform.windows”，“PageTransitionsTheme._defaultBuilders”中定义的“PageTransitionsBuilder”已从“FadeUpwardsPageTransitionsBuilder”更改为“ZoomPageTransitionsBuilder”。


## Migration guide

## 迁移指南


If you want to switch back to the previous page transition builder
(`FadeUpwardsPageTransitionsBuilder`), you should define builders
explicitly for the target platforms.

如果你想切换回上一个页面转换构建器（`FadeUpwardsPageTransitionsBuilder`），你应该为目标平台显式定义构建器。


Code before migration:

迁移前的代码：


```dart
MaterialApp(
  theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
)
```

Code after migration:

迁移后的代码：


```dart
MaterialApp(
  theme: ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(), // Apply this to every platforms you need.
      },
    ),
  ),
)
```

If you want to apply the same page transition builder to all platforms:

如果你想将相同的页面转换构建器应用于所有平台：


```dart
MaterialApp(
  theme: ThemeData(
    pageTransitionsTheme: PageTransitionsTheme(
      builders: Map<TargetPlatform, PageTransitionsBuilder>.fromIterable(
        TargetPlatform.values,
        value: (dynamic _) => const FadeUpwardsPageTransitionsBuilder(),
      ),
    ),
  ),
)

```

### Tests migration

### 测试迁移


If you used to try to find widgets but failed with *Too many elements*
using the new transition, and saw errors similar to the following:

如果你曾经尝试使用新转换查找 widget，但由于“元素太多”而失败，并且看到类似于以下内容的错误：


```plaintext
══╡ EXCEPTION CAUGHT BY FLUTTER TEST FRAMEWORK ╞════════════════════════════════════════════════════
The following StateError was thrown running a test:
Bad state: Too many elements

When the exception was thrown, this was the stack:
#0      Iterable.single (dart:core/iterable.dart:656:24)
#1      WidgetController.widget (package:flutter_test/src/controller.dart:69:30)
#2      main.<anonymous closure> (file:///path/to/your/test.dart:1:2)
```

You should migrate your tests by using the
`descendant` scope for `Finder`s with the specific widget type.
Below is the example of `DataTable`'s test:

你应该通过使用具有特定 widget 类型的“Finder”的“后代”范围来迁移测试。下面是 `DataTable` 的测试示例：


Test before migration:

迁移前测试：


```dart
final Finder finder = find.widgetWithIcon(Transform, Icons.arrow_upward);
```

Test after migration:

迁移后测试：


```dart
final Finder finder = find.descendant(
  of: find.byType(DataTable),
  matching: find.widgetWithIcon(Transform, Icons.arrow_upward),
);
```

Widgets that typically need to migrate the finder scope are:
`Transform`, `FadeTransition`, `ScaleTransition`, and `ColoredBox`.

通常需要迁移查找器范围的 widget 有：“Transform”、“FadeTransition”、“ScaleTransition”和“ColoredBox”。


## Timeline

## 时间轴


Landed in version: 2.13.0-1.0.pre<br>
In stable release: 3.0.0

登陆版本：2.13.0-1.0.pre<br> 稳定版本：3.0.0


## References

## 参考


API documentation:

API 文档：


* [`ZoomPageTransitionsBuilder`][]

  [`ZoomPageTransitionsBuilder`][]

* [`FadeUpwardsPageTransitionsBuilder`][]

  [`FadeUpwardsPageTransitionsBuilder`][]

* [`PageTransitionsTheme`][]


Relevant issues:

相关问题：


* [Issue 43277][]

  [问题 43277][Issue 43277]


Relevant PR:

相关公关：


* [PR 100812][]

  [PR 100812][]


[`ZoomPageTransitionsBuilder`]: {{site.api}}/flutter/material/ZoomPageTransitionsBuilder-class.html
[`FadeUpwardsPageTransitionsBuilder`]: {{site.api}}/flutter/material/FadeUpwardsPageTransitionsBuilder-class.html
[`PageTransitionsTheme`]: {{site.api}}/flutter/material/PageTransitionsTheme-class.html
[Issue 43277]: {{site.repo.flutter}}/issues/43277
[PR 100812]: {{site.repo.flutter}}/pull/100812
