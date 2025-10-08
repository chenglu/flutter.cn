---
# title: Flutter documentation
title: Flutter 开发文档
# short-title: Docs
short-title: 文档
# description: >-
#   Get started with Flutter. Widgets, examples, updates, and API docs to
#   help you write your first Flutter app.
description: Flutter 上手起步，包括 widgets 介绍、样例代码、最新更新和 API 文档，帮助你撰写第一个 Flutter 应用。
tags: Flutter中文文档
keywords: Flutter文档,Flutter汉语文档,Flutter开发导航
---

<div class="card-grid">
{% for card in docsCards -%}
  <a class="card filled-card outlined-card" href="{{card.url}}">
    <div class="card-header">
      <span class="card-title">{{card.name}}</span>
    </div>
    <div class="card-content">
      <p>{{card.description}}</p>
    </div>
  </a>
{% endfor -%}
</div>

**To see changes to the site since our last release,
see [What's new][].**

查看最近网站更新的内容，请查阅
[文档网站更新内容归档][What's new]。

[What's new]: /release/whats-new

## New to Flutter?

## 新接触 Flutter 吗？

Ready to build beautiful, multiplatform apps from a single codebase?
This video walks you through the fundamentals of Flutter and shows you how to get started.

准备好通过同一套代码来构建精美的跨平台应用程序了吗？
以下内容将向你介绍 Flutter 的基础知识，并告诉你如何开始使用。

Once you've [Set up Flutter][],
you should follow the 
[Write your first Flutter app][] codelab 
and read [Flutter fundamentals][]. 
These resources are opinionated documentation 
that guide you through the most important
parts of building a Flutter app.

当你 [设置完成 Flutter][Set up Flutter] 后，
接下来你可以上手试试 [第一个 Flutter 应用的开发][Write your first Flutter app] codelab 
以及阅读 [Flutter 基础知识][Flutter fundamentals]。
这些资源是有明确指导性的文档，
会引导你了解构建 Flutter 应用的重要部分。

[Write your first Flutter app]: /get-started/codelab
[Flutter fundamentals]: /get-started/fundamentals

### Docs

### 文档

Coming from another platform? Check out Flutter for:
[Android][], [SwiftUI][], [UIKit][], [React Native][], and
[Xamarin.Forms][] developers.

看我们为各种已经有相关平台开发经验的开发者准备的文档：
- [给 Android 开发者的 Flutter 指南][Android]
- [给 iOS SwiftUI 开发者的 Flutter 指南][SwiftUI]
- [给 iOS UIKit 开发者的 Flutter 指南][UIKit]
- [给 React Native 开发者的 Flutter 指南][React Native]
- [给 Xamarin.Forms 开发者的 Flutter 指南][Xamarin.Forms]

[Building layouts][]
<br> Learn how to create layouts in Flutter,
  where everything is a widget.

[Flutter 中的布局][Building layouts]
<br> 学习如何在 Flutter 中创建布局，在 Flutter 里，所有事物都是 widget。

[Understanding constraints][]
<br> Once you understand that "Constraints
  flow up. Sizes flow down. Parents set
  positions", then you are well on your
  way to understanding Flutter's layout model.

[理解布局约束][Understanding constraints]
<br> 一旦你理解了 Constraints flow up. Sizes flow down. Parents set positions
这个思路之后，就能更好帮助你了解 Flutter 的布局模型。

[Adding interactivity to your Flutter app][interactivity]
<br> Learn how to add a stateful widget to your app.

[为你的 Flutter 应用加入交互体验][interactivity]
<br> 在 app 里使用有状态的 widget。

[FAQ][]
<br> Get the answers to frequently asked questions.

[常见问题][FAQ]
<br> 常见问题解答

[Android]: /get-started/flutter-for/android-devs
[Building layouts]: /ui/layout
[FAQ]: /resources/faq
[Set up Flutter]: /get-started/install
[interactivity]: /ui/interactivity
[SwiftUI]: /get-started/flutter-for/swiftui-devs
[UIKit]: /get-started/flutter-for/uikit-devs
[React Native]: /get-started/flutter-for/react-native-devs
[Understanding constraints]: /ui/layout/constraints
[Xamarin.Forms]: /get-started/flutter-for/xamarin-forms-devs

### Videos

### 视频资源

我们在 YouTube 上有一个 [Flutter 频道](https://www.youtube.com/c/flutterdev)，欢迎订阅！
更多视频和播放列表介绍，以及社区制作的视频教程，
可以查看我们的 [Flutter 技术视频资源][videos] 页面。
同时，你可以关注 [“Google中国”的哔哩哔哩账号](https://space.bilibili.com/64169458)
了解更多更全面的谷歌技术中文内容，
也可以关注 [“Flutter 社区”的哔哩哔哩账号](https://space.bilibili.com/344928717)
了解更多来自社区的内容更新。

To learn about all of the Flutter video series, see our [videos][] page.

请浏览我们的 [视频列表][videos]，来了解所有 Flutter 视频系列。

We release new videos almost every week!

我们几乎每周都会发布新视频！

<a class="filled-button" target="_blank" href="https://www.youtube.com/@flutterdev"><!-- Check out the Flutter YouTube channel -->浏览 Flutter YouTube 频道</a>

[videos]: /resources/videos
