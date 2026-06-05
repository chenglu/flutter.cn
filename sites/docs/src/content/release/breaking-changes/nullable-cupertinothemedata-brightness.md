---
# title: Nullable CupertinoThemeData.brightness
title: 可为空的 CupertinoThemeData.brightness
# description: >
#   CupertinoThemeData.brightness is now nullable, and it
#   returns the value specified by the user (defaults to null) as is.
description: >
  CupertinoThemeData.brightness 现在可以为 null，并且它按原样返回用户指定的值（默认为 null）。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


[`CupertinoThemeData.brightness`] is now nullable.

[`CupertinoThemeData.brightness`] 现在可以为空。


## Context

## 背景


[`CupertinoThemeData.brightness`][] is now used to
override `MediaQuery.platformBrightness` for Cupertino widgets.
Before this change, the [`CupertinoThemeData.brightness`][]
getter returned `Brightness.light` when it was set to null.

[`CupertinoThemeData.brightness`][] 现在用于覆盖 Cupertino widget 的 `MediaQuery.platformBrightness`。在此更改之前，[`CupertinoThemeData.brightness`][] getter 在设置为 null 时返回 `Brightness.light`。


## Description of change

## 变更说明


Previously [`CupertinoThemeData.brightness`][]
was implemented as a getter:

之前 [`CupertinoThemeData.brightness`][] 是作为 getter 实现的：


```dart
Brightness get brightness => _brightness ?? Brightness.light;
final Brightness _brightness;
```

It is now a stored property:

它现在是一个存储的属性：


```dart
final Brightness brightness;
```

## Migration guide

## 迁移指南


Generally [`CupertinoThemeData.brightness`][]
is rarely useful outside of the Flutter framework.
To retrieve the brightness for Cupertino widgets,
now use [`CupertinoTheme.brightnessOf`][] instead.

一般来说，[`CupertinoThemeData.brightness`][] 在 Flutter 框架之外很少有用。要检索 Cupertino widget 的亮度，请改为使用 [`CupertinoTheme.brightnessOf`][]。


With this change, it is now possible to override
`CupertinoThemeData.brightness` in a `CupertinoThemeData`
subclass to change the brightness override. For example:

通过此更改，现在可以覆盖“CupertinoThemeData”子类中的“CupertinoThemeData.brightness”来更改亮度覆盖。例如：


```dart
class AlwaysDarkCupertinoThemeData extends CupertinoThemeData {
  Brightness brightness => Brightness.dark;
}
```

When a `CupertinoTheme` uses the above `CupertinoThemeData`,
dark mode is enabled for all its Cupertino descendants
that are affected by this `CupertinoTheme`.

当“CupertinoTheme”使用上述“CupertinoThemeData”时，受此“CupertinoTheme”影响的所有 Cupertino 后代都会启用暗模式。


## Timeline

## 时间轴


Landed in version: 1.16.3<br>
In stable release: 1.17

登陆版本：1.16.3<br>稳定版本：1.17


## References

## 参考


Design doc:

设计文档：


* [Make `CupertinoThemeData.brightness nullable`][]

  [使 `CupertinoThemeData.brightness 可为空 `][`CupertinoThemeData.brightness`]


API documentation:

API 文档：


* [`CupertinoThemeData.brightness`][]

  [`CupertinoThemeData.brightness`][]


Relevant issue:

相关问题：


* [Issue 47255][]

  [问题 47255][Issue 47255]


Relevant PR:

相关公关：


* [Let material `ThemeData` dictate brightness if `cupertinoOverrideTheme.brightness` is null][]

  [如果“cupertinoOverrideTheme.brightness”为空，则让材质“ThemeData”决定亮度][`CupertinoTheme.brightnessOf`]



[`CupertinoTheme.brightnessOf`]: {{site.api}}/flutter/cupertino/CupertinoTheme/brightnessOf.html
[`CupertinoThemeData.brightness`]: {{site.api}}/flutter/cupertino/NoDefaultCupertinoThemeData/brightness.html
[Issue 47255]: {{site.repo.flutter}}/issues/47255
[Let material `ThemeData` dictate brightness if `cupertinoOverrideTheme.brightness` is null]: {{site.repo.flutter}}/pull/47249
[Make `CupertinoThemeData.brightness nullable`]: /go/nullable-cupertinothemedata-brightness
