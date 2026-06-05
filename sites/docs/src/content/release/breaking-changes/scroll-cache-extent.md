---
# title: Deprecated `cacheExtent` and `cacheExtentStyle`
title: 已弃用 `cacheExtent` 和 `cacheExtentStyle`
# description: >-
#   The `cacheExtent` and `cacheExtentStyle` properties are deprecated.
#   They are replaced by `scrollCacheExtent` with a `ScrollCacheExtent` object.
description: >
  `cacheExtent` 和 `cacheExtentStyle` 属性已弃用。它们被带有 `ScrollCacheExtent` 对象的 `scrollCacheExtent` 替换。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Flutter 3.44 deprecates `cacheExtent` and `cacheExtentStyle`
in scrolling-related widgets, such as
`ListView`, `GridView`, `CustomScrollView`, and `Viewport`,
and their corresponding render objects, such as `RenderViewport`.
The new `scrollCacheExtent` property encapsulates
both the value and the caching strategy (pixels or viewport).

Flutter 3.44 弃用了与滚动相关的 widget（例如“ListView”、“GridView”、“CustomScrollView”和“Viewport”）及其相应的渲染对象（例如“RenderViewport”）中的“cacheExtent”和“cacheExtentStyle”。新的“scrollCacheExtent”属性封装了值和缓存策略（像素或视口）。


## Background

## 背景


Previously, `cacheExtent` was a `double` and
`cacheExtentStyle` determined how that `double` was interpreted
(either as pixels or as a fraction of the viewport).
This split made the setting harder to understand.

以前，“cacheExtent”是“double”，“cacheExtentStyle”决定如何解释“double”（作为像素或作为视口的一部分）。这种分裂使得背景变得更难理解。


The new `scrollCacheExtent` property uses a `ScrollCacheExtent` object that
explicitly encapsulates both the value and
the caching strategy (pixels or viewport),
which provides type safety and clearer intent.

新的“scrollCacheExtent”属性使用“ScrollCacheExtent”对象，该对象显式封装了值和缓存策略（像素或视口），从而提供类型安全性和更清晰的意图。


## Migration guide

## 迁移指南


### Widget layer

### 部件层


#### `cacheExtent` (pixels)

#### `cacheExtent`（像素）


If your code uses `cacheExtent`,
which defaults to pixels,
use `scrollCacheExtent` with `ScrollCacheExtent.pixels`.

如果你的代码使用默认为像素的“cacheExtent”，请将“scrollCacheExtent”与“ScrollCacheExtent.pixels”一起使用。


**Before:**

**前：**


```dart
ListView(
  cacheExtent: 500.0,
  children: // ...
)
```

**After:**

**后：**


```dart
ListView(
  scrollCacheExtent: const ScrollCacheExtent.pixels(500.0),
  children: // ...
)
```

#### `cacheExtentStyle` (viewport)

#### `cacheExtentStyle`（视口）


If your code uses `cacheExtent` with `CacheExtentStyle.viewport`,
which is common in `Viewport`,
use `scrollCacheExtent` with `ScrollCacheExtent.viewport`.

如果你的代码将“cacheExtent”与“CacheExtentStyle.viewport”一起使用（这在“Viewport”中很常见），请将“scrollCacheExtent”与“ScrollCacheExtent.viewport”一起使用。


**Before:**

**前：**


```dart
Viewport(
  cacheExtent: 0.5,
  cacheExtentStyle: CacheExtentStyle.viewport,
  slivers: // ...
)
```

**After:**

**后：**


```dart
Viewport(
  scrollCacheExtent: const ScrollCacheExtent.viewport(0.5),
  slivers: // ...
)
```

### Render object layer

### 渲染对象层


If your code manually sets properties on
`RenderViewport` or a similar render object,
use `scrollCacheExtent`.

如果你的代码手动设置“RenderViewport”或类似渲染对象的属性，请使用“scrollCacheExtent”。


**Before:**

**前：**


```dart
renderViewport.cacheExtent = 500.0;
renderViewport.cacheExtentStyle = CacheExtentStyle.pixel;
```

**After:**

**后：**


```dart
renderViewport.scrollCacheExtent = const ScrollCacheExtent.pixels(500.0);
```

## Timeline

## 时间轴


Landed in version: 3.41.0-0.0.pre<br>
In stable release: 3.44

登陆版本：3.41.0-0.0.pre<br> 稳定版本：3.44


## References

## 参考


API documentation:

API 文档：


* [`ScrollCacheExtent`][]

  [`ScrollCacheExtent`][]

* [`ScrollView.scrollCacheExtent`][]

  [`ScrollView.scrollCacheExtent`][]

* [`RenderViewportBase.scrollCacheExtent`][]

  [`RenderViewportBase.scrollCacheExtent`][]


Relevant PRs:

相关 PR：


* [Introduce ScrollCacheExtent][pr-181092]

  [介绍 ScrollCacheExtent][pr-181092]


[`ScrollCacheExtent`]: {{site.api}}/flutter/rendering/ScrollCacheExtent-class.html
[`ScrollView.scrollCacheExtent`]: {{site.api}}/flutter/widgets/ScrollView/scrollCacheExtent.html
[`RenderViewportBase.scrollCacheExtent`]: {{site.api}}/flutter/rendering/RenderViewportBase/scrollCacheExtent.html

[pr-181092]: {{site.repo.flutter}}/pull/181092
