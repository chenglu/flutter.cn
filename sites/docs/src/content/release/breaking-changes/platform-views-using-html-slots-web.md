---
# title: Using HTML slots to render platform views in the web
title: 使用 HTML 插槽在 Web 中呈现平台视图
# description: >
#   iframes in Flutter web used to reload, because of
#   the way some DOM operations were made.
#   A change in the way Flutter web apps render platform views
#   makes them stable (preventing iframe reloads, and other problems
#   with video tags or forms potentially losing their state).
description: >
  由于某些 DOM 操作的方式，Flutter Web 中的 iframe 过去常常需要重新加载。 Flutter Web 应用程序渲染平台视图的方式发生了变化，使它们变得稳定（防止 iframe 重新加载，以及视频标签或表单可能丢失状态的其他问题）。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Flutter now renders all web platform views in a consistent location of the DOM,
as direct children of `flt-glass-pane` (regardless of the rendering backend:
`html` or `canvaskit`). Platform views are then _`slotted`_ into the correct
position of the App's DOM with standard HTML features.

Flutter 现在在 DOM 的一致位置渲染所有 Web 平台视图，作为“flt-glass-pane”的直接子级（无论渲染后端：“html”或“c​​anvaskit”）。然后，使用标准 HTML 功能将平台视图_“插入”_到应用程序 DOM 的正确位置。


Up until this change, Flutter web would change the styling of the rendered
contents of a platform views to position/size it to the available space. **This
is no longer the case.** Users can now decide how they want to utilize the space
allocated to their platform view by the framework.

在此更改之前，Flutter Web 会更改平台视图渲染内容的样式，以将其定位/调整到可用空间。 **现在情况已不再如此。** 用户现在可以决定如何利用框架分配给其平台视图的空间。


## Context

## 背景


The Flutter framework frequently tweaks its render tree to optimize the paint
operations that are ultimately made per frame. In the web, these render tree
changes often result in DOM operations.

Flutter 框架经常调整其渲染树以优化最终每帧进行的绘制操作。在 Web 中，这些渲染树的更改通常会导致 DOM 操作。


Flutter web used to render its platform views ([`HtmlElementView` widgets][])
directly into its corresponding position of the DOM.

Flutter Web 过去将其平台视图（[`HtmlElementView` widgets][]）直接渲染到 DOM 的相应位置。


Using certain DOM elements as the `target` of some DOM operations causes those
elements to lose their internal state. In practice, this means that `iframe`
tags are going to reload, `video` players might restart, or an editable form
might lose its edits.

使用某些 DOM 元素作为某些 DOM 操作的“目标”会导致这些元素丢失其内部状态。实际上，这意味着“iframe”标签将重新加载，“video”播放器可能会重新启动，或者可编辑表单可能会丢失其编辑内容。


Flutter now renders platform views using [slot elements][] inside of a single,
app-wide [shadow root][]. Slot elements can be added/removed/moved around the
Shadow DOM without affecting the underlying slotted content (which is rendered
in a constant location)

Flutter 现在使用单个应用程序范围的 [shadow root][] 内的 [slot elements][] 渲染平台视图。槽元素可以在 Shadow DOM 周围添加/删除/移动，而不影响底层的槽内容（在恒定位置渲染）


This change was made to:

进行此更改是为了：


* Stabilize the behavior of platform views in Flutter web.

  稳定 Flutter Web 中平台视图的行为。

* Unify how platform views are rendered in the web for both rendering

  统一平台视图在 Web 中的渲染方式

backends (`html` and `canvaskit`).

后端（“html”和“canvaskit”）。

* Provide a predictable location in the DOM that allows developers to reliably

  在 DOM 中提供可预测的位置，使开发人员能够可靠地

use CSS to style their platform views, and to use other standard DOM API,
such as `querySelector`, and `getElementById`.

使用 CSS 来设置其平台视图的样式，并使用其他标准 DOM API，例如“querySelector”和“getElementById”。


## Description of change

## 变更说明


A Flutter web app is now rendered inside a common [shadow root][] in which
[slot elements][] represent platform views. The actual content of
each platform view is rendered as a **sibling of said shadow root**.

Flutter Web 应用程序现在在公共 [shadow root][] 内呈现，其中 [slot elements][] 代表平台视图。每个平台视图的实际内容被渲染为所述影子根的**同级**。


### Before

### 前


```html
...

<flt-glass-pane>
  ...
  <div id="platform-view">Contents</div> <!-- canvaskit -->
  <!-- OR -->
  <flt-platform-view>
    #shadow-root
    | <div id="platform-view">Contents</div> <!-- html -->
  </flt-platform-view>
  ...
</flt-glass-pane>

...
```

### After

### 后


```html
...

<flt-glass-pane>
  #shadow-root
  | ...
  | <flt-platform-view-slot>
  |   <slot name="platform-view-1" />
  | </flt-platform-view-slot>
  | ...
  <flt-platform-view slot="platform-view-1">
    <div id="platform-view">Contents</div>
  </flt-platform-view>
  ...
</flt-glass-pane>

...
```

After this change, when the framework needs to move DOM nodes around, it
operates over `flt-platform-view-slot`s, which only contain a `slot` element.
The slot _projects_ the contents defined in `flt-platform-view` elements outside
the shadow root. `flt-platform-view` elements are never the target of DOM
operations from the framework, thus preventing the reload issues.

进行此更改后，当框架需要移动 DOM 节点时，它会在仅包含“slot”元素的“flt-platform-view-slot”上进行操作。 slot_projects_ 影子根外部的“flt-platform-view”元素中定义的内容。 “flt-platform-view”元素永远不是框架中 DOM 操作的目标，从而防止了重新加载问题。


From an app's perspective, this change is transparent. **However**, this is
considered a _breaking change_ because some tests make assumptions
about the internal DOM of a Flutter web app, and break.

从应用程序的角度来看，这种变化是透明的。 **然而**，这被认为是一个_重大变化_，因为一些测试对 Flutter Web 应用程序的内部 DOM 做出了假设，然后就中断了。


## Migration guide

## 迁移指南


### Code

### 代码


The engine may print a warning message to the console similar to:

引擎可能会向控制台打印一条警告消息，类似于：


```bash
Height of Platform View type: [$viewType] may not be set. Defaulting to `height: 100%`.
Set `style.height` to any appropriate value to stop this message.
```

or:

或者：


```bash
Width of Platform View type: [$viewType] may not be set. Defaulting to `width: 100%`.
Set `style.width` to any appropriate value to stop this message.
```

Previously, the content returned by [`PlatformViewFactory` functions][] was
resized and positioned by the framework. Instead, Flutter now sizes and
positions `<flt-platform-view-slot>`, which is the parent of the slot where the
content is projected.

以前，[`PlatformViewFactory` functions][] 返回的内容由框架调整大小和位置。现在，Flutter 改为调整 `<flt-platform-view-slot>` 的大小和位置，它是投影内容的插槽的父级。


To stop the warning above, platform views need to set the `style.width` and
`style.height` of their root element to any appropriate (non-null) value.

要停止上述警告，平台视图需要将其根元素的“style.width”和“style.height”设置为任何适当的（非空）值。


For example, to make the root `html.Element` fill all the available space
allocated by the framework, set its `style.width` and `style.height` properties
to `'100%'`:

例如，要使根“html.Element”填充框架分配的所有可用空间，请将其“style.width”和“style.height”属性设置为“100%”：


```dart
ui.platformViewRegistry.registerViewFactory(viewType, (int viewId) {
  final html.Element htmlElement = html.DivElement()
    // ..other props
    ..style.width = '100%'
    ..style.height = '100%';
  // ...
  return htmlElement;
});
```

If other techniques are used to lay out the platform view (like `inset: 0`) a
value of `auto` for `width` and `height` is enough to stop the warning.

如果使用其他技术来布局平台视图（例如“inset: 0”），则“width”和“height”的值“auto”足以停止警告。


Read more about [`CSS width`][] and [`CSS height`][].

阅读有关 [`CSS 宽度 `][`CSS width`] 和 [`CSS 高度 `][`CSS width`] 的更多信息。


### Tests

### 测试


After this change, user's test code does **not** need to deeply inspect the
contents of the shadow root of the App. All of the platform view contents will
be placed as direct children of `flt-glass-pane`, wrapped in a
`flt-platform-view` element.

进行此更改后，用户的测试代码不需要深入检查应用程序影子根目录的内容。所有平台视图内容都将作为“flt-glass-pane”的直接子级放置，并包装在“flt-platform-view”元素中。


Avoid looking inside the `flt-glass-pane` shadow root, it is considered a

避免查看“flt-glass-pane”阴影根内部，它被认为是

**"private implementation detail"**, and its markup can change at any time,
without notice.

**“私有实现细节”**，其标记可能随时更改，恕不另行通知。


(See Relevant PRs below for examples of the `migrations` described above).

（有关上述“迁移”的示例，请参阅下面的相关 PR）。


## Timeline

## 时间轴


Landed in version: 2.3.0-16.0.pre<br>
In stable release: 2.5

登陆版本：2.3.0-16.0.pre<br> 稳定版本：2.5


## References

## 参考


Design document:

设计文件：


* [Using slot to embed web Platform Views][design doc]

  使用 slot 嵌入 web 平台视图


Relevant issues:

相关问题：


* [Issue #80524][issue-80524]

  问题 #80524


Relevant PRs:

相关 PR：


* [flutter/engine#25747][pull-25747]: Introduces the feature.

  [flutter/engine#25747][pull-25747]：介绍该功能。

* [flutter/flutter#82926][pull-82926]: Tweaks `flutter` tests.

  flutter/flutter#82926：调整“flutter”测试。

* [flutter/plugins#3964][pull-3964]: Tweaks to `plugins` code.

  [flutter/plugins#3964][pull-3964]：调整“plugins”代码。

* [flutter/packages#364][pull-364]: Tweaks to `packages` code.

  [flutter/packages#364][pull-364]：调整“packages”代码。


[`CSS height`]: https://developer.mozilla.org/en-US/docs/Web/CSS/height
[`CSS width`]: https://developer.mozilla.org/en-US/docs/Web/CSS/width
[`HtmlElementView` widgets]: {{site.api}}/flutter/widgets/HtmlElementView-class.html
[`PlatformViewFactory` functions]: {{site.repo.engine}}/blob/58459a5e342f84c755919f2ad5029b22bcddd548/lib/web_ui/lib/src/engine/platform_views/content_manager.dart#L15-L18
[design doc]: /go/web-slot-content
[issue-80524]: {{site.repo.flutter}}/issues/80524
[pull-25747]: {{site.repo.engine}}/pull/25747
[pull-364]: {{site.repo.packages}}/pull/364
[pull-3964]: {{site.github}}/flutter/plugins/pull/3964
[pull-82926]: {{site.repo.flutter}}/pull/82926
[shadow root]: https://developer.mozilla.org/en-US/docs/Web/API/ShadowRoot
[slot elements]: https://developer.mozilla.org/en-US/docs/Web/HTML/Element/slot
