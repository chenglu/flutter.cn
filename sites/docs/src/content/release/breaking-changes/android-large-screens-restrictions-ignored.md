---
# title: Large screen orientation and resizability restrictions ignored on Android 17
title: Android 17 上忽略大屏幕方向和大小调整限制
# description: >-
#   For apps targeting Android 17 or higher,
#   orientation, resizability, and aspect ratio restrictions no longer
#   apply on large displays with widths of 600dp or larger.
description: >-
  对于面向 Android 17 或更高版本的应用，方向、可调整大小和宽高比限制不再适用于宽度为 600dp 或更大的大型显示器。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


For apps targeting Android 17 or higher,
orientation, resizability, and aspect ratio restrictions no longer
apply on displays with width 600dp or greater.
This means that [`SystemChrome.setPreferredOrientations`][] is
ignored on these devices.

对于面向 Android 17 或更高版本的应用，方向、可调整大小和宽高比限制不再适用于宽度为 600dp 或更大的显示器。这意味着[`SystemChrome.setPreferredOrientations`][]在这些设备上被忽略。


## Background

## 背景


Android is shifting toward a model where apps are expected to adapt
to various orientations, display sizes, and aspect ratios.
Restrictions like fixed orientation or limited resizability
hinder app adaptability.
For more details, see [Android 17 behavior changes][].

Android 正在转向一种模型，其中应用程序有望适应各种方向、显示尺寸和宽高比。固定方向或有限的可调整大小等限制会阻碍应用程序的适应性。有关更多详细信息，请参阅[Android 17 behavior changes][].


In Android 16, this behavior was introduced as a default
but allowed apps to temporarily opt out
using the `PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY` manifest property.
Android 17 removes this opt-out.

在 Android 16 中，此行为作为默认行为引入，但允许应用程序使用 `PROPERTY_COMPAT_ALLOW_RESTRICTED_RESIZABILITY` 清单属性暂时选择退出。 Android 17 删除了此选择退出。


## Description of change

## 变更说明


If you rely on [`SystemChrome.setPreferredOrientations`][]
to lock your app to a specific orientation,
it is ignored on large screens (widths 600dp and larger)
if your app targets Android 17 or higher.
If your app supports Android 16
and you did not opt out of this behavior,
then it behaves the same on Android 17.

如果你依赖[`SystemChrome.setPreferredOrientations`][]要将你的应用程序锁定到特定方向，如果你的应用程序面向 Android 17 或更高版本，则在大屏幕（宽度 600dp 及更大）上会忽略该方向。如果你的应用支持 Android 16 并且你没有选择退出此行为，则它在 Android 17 上的行为相同。


If your app relies on locking orientation,
make your app adaptive to support different screen sizes and orientations.
See the guidance for how to do this for large screens
in [Adaptive and responsive UI][].

如果你的应用程序依赖于锁定方向，请使你的应用程序自适应以支持不同的屏幕尺寸和方向。有关如何针对大屏幕执行此操作的指南，请参阅[Adaptive and responsive UI][].


## References

## 参考资料


* [Android 17 behavior changes][]

  [Android 17 种行为变化][Android 17 behavior changes]

* [Android 16 behavior changes][]

  [Android 16 个行为变化][Android 16 behavior changes]

* [`SystemChrome.setPreferredOrientations`][]
* [Adaptive and responsive UI][]

  [自适应和响应式用户界面][Adaptive and responsive UI]


[Android 17 behavior changes]: https://developer.android.com/about/versions/17/changes/ff-restrictions-ignored
[Android 16 behavior changes]: https://developer.android.com/about/versions/16/behavior-changes-16#ignore-orientation
[`SystemChrome.setPreferredOrientations`]: {{site.api}}/flutter/services/SystemChrome/setPreferredOrientations.html
[Adaptive and responsive UI]: /ui/adaptive-responsive/large-screens
