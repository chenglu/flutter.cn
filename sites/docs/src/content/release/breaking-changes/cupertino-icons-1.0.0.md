---
# title: New CupertinoIcons has icon glyph changes
title: 新的 CupertinoIcons 具有图标字形更改
# description: >
#   Once you update to cupertino_icons 1.0.0, some old glyphs are
#   automapped to the new glyphs. Consider double-checking visually.
description: >-
  更新到 cupertino_icons 1.0.0 后，一些旧的字形会自动映射到新的字形。考虑仔细目视检查。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


The existing cupertino_icons [0.1.3 icons][]
are based on iOS 11 aesthetics with sharp angles and thin lines.

现有的 cupertino_icons [0.1.3 icons][]基于 iOS 11 美学，具有锐角和细线。


As Apple's iconography updates with new OS versions,
the `cupertino_icons` package is also refreshed.

随着 Apple 的图标随着新操作系统版本的更新，`cupertino_icons` 包也随之更新。


Generally, all previous glyphs referenced from the
[`CupertinoIcons`][] API are automatically mapped to
very similar looking icons in the new SF Symbols
style (featuring rounder, thicker lines).

一般来说，所有以前的字形都引用自[`CupertinoIcons`][]API 会自动映射到新 SF 符号样式中外观非常相似的图标（具有更圆、更粗的线条）。


Some icons that have no equivalents in the
new SF Symbols style are left as is.

一些在新的 SF Symbols 样式中没有对应项的图标将保持原样。


Some icons that have less variation
(such as thickness, alternative looks, and so on)
are automapped and collapsed to the best matching
variation in the new SF Symbols style but should be
double checked to determine whether they preserve the
intended visual effect.

一些变化较小的图标（例如厚度、替代外观等）会自动映射并折叠为新 SF 符号样式中的最佳匹配变化，但应仔细检查以确定它们是否保留了预期的视觉效果。


## Description of change

## 变更说明


The new `cupertino_icons 1.0.0` font is handcrafted
to best preserve the intent and aesthetic of the
symbology through the transition. All existing
`CupertinoIcons`' static `IconData` fields
(and thus all of the font `.ttf`'s codepoints)
continue to work and point to a reasonable new icon.

新的 `cupertino_icons 1.0.0` 字体是手工制作的，可以在过渡过程中最好地保留符号系统的意图和美感。所有现有的 `CupertinoIcons`' 静态 `IconData` 字段（以及所有字体 `.ttf` 的代码点）继续工作并指向一个合理的新图标。


The new cupertino_icons 1.0.0 package also has ~1,000
more icons to choose from.

新的 cupertino_icons 1.0.0 软件包还有大约 1,000 个图标可供选择。


### Unchanged icons

### 图标不变


No SF Symbols styled alternatives exist
for the icons in the following list.
The previous cupertino_icons 0.1.3 icons
have been kept as is in 1.0.0.

以下列表中的图标不存在 SF 符号样式的替代方案。之前的 cupertino_icons 0.1.3 图标在 1.0.0 中保持原样。


* bluetooth

  蓝牙

* bus

  公共汽车

* car

  车

* car_detailed

  汽车详细信息

* chevron_back

  chevron_back

* chevron_forward

  chevron_forward

* lab_flask

  实验室烧瓶

* lab_flask_solid

  实验室烧瓶固体

* news

  消息

* news_solid

  新闻实体

* train_style_one

  火车样式一

* train_style_two

  火车样式二


### Merged icons

### 合并的图标


Icons within the same group are now the exact same
icon in 1.0.0. In other words, the distinctions
between those icon variations that existed in 0.1.3 is
lost and now renders the same SF Symbols
styled icon that represents the theme of the group.

同一组内的图标现在与 1.0.0 中的图标完全相同。换句话说，0.1.3 中存在的那些图标变体之间的区别消失了，现在呈现出代表该组主题的相同 SF Symbols 风格的图标。


This affects the following icon groups:

这会影响以下图标组：


* share, share_up

  分享，share_up

* battery_charging, battery_full, battery_75_percent

  电池充电、电池充满、电池75%

* shuffle, shuffle_medium, shuffle_thick

  随机播放、随机播放中、随机播放粗

* delete, delete_simple

  删除，删除_简单

* refresh, refresh_thin, refresh_thick

  刷新、刷新细、刷新厚

* clear, clear_thick

  清晰，清晰_厚

* clear_circled_solid, clear_thick_circled

  清除圆形实心、清除厚圆形

* gear, gear_alt, gear_big

  齿轮、gear_alt、gear_big

* loop, loop_thick

  循环，循环厚度

* time_solid, clock_solid

  时间实体、时钟实体

* time, clock

  时间，时钟

* tag, tags

  标签，标签

* tag_solid, tags_solid

  标签实体，标签实体


This is mainly due to some artistic liberties taken
when creating the original `cupertino_icons` set that
no longer match the variations diversity of the more
formal SF Symbols icon set for some of the icons.

这主要是由于在创建原始 `cupertino_icons` 集时采取了一些艺术自由，这些自由不再与某些图标的更正式的 SF 符号图标集的变体多样性相匹配。


## Migration guide

## 迁移指南


After upgrading to 1.22,
if you also upgrade the `cupertino_icons`
pubspec dependency from 0.1.3 to 1.0.0,
for example, by changing:

升级到 1.22 后，如果你还将 `cupertino_icons` pubspec 依赖项从 0.1.3 升级到 1.0.0，例如，通过更改：


```yaml
dependencies:
  ... // Other dependencies
  cupertino_icons: ^0.1.0
```

to:

到：


```yaml
dependencies:
  ... // Other dependencies
  cupertino_icons: ^1.0.0
```

All your `CupertinoIcons` should automatically
update to the new aesthetic (except for the
[unchanged icons](#unchanged-icons) listed above).

你所有的 `CupertinoIcons` 都应该自动更新到新的审美（除了[unchanged icons](#unchanged-icons)上面列出）。


At this point, you can also explore [`CupertinoIcons`][]
for new icons to use in your application.

此时，你还可以探索[`CupertinoIcons`][]在你的应用程序中使用新图标。


You're encouraged to verify your application after
migrating to ensure that the automatically mapped
new icons are suitable for your desired aesthetics.

我们鼓励你在迁移后验证你的应用程序，以确保自动映射的新图标适合你所需的美观。


## Timeline

## 时间线


Landed in: 1.22.0-10.0.pre.65<br>
In stable release: 1.22

登陆版本：1.22.0-10.0.pre.65<br> 稳定版本：1.22


## References

## 参考资料


[0.1.3 icons]: https://raw.githubusercontent.com/flutter/cupertino_icons/master/map.png
[`CupertinoIcons`]: {{site.api}}/flutter/cupertino/CupertinoIcons-class.html
