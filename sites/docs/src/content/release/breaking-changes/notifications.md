---
# title: Removing Notification.visitAncestor
title: 删除 Notification.visitAncestor
# description: >
#   Notifications only traverse ancestors that are notification listeners.
description: >
  通知仅遍历作为通知侦听器的祖先。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


Notifications are more efficient by traversing only ancestors that
are notification listeners.

通过仅遍历作为通知侦听器的祖先，通知会更有效。


## Context

## 背景


The notification API traversed the element tree in order to locate a
notification receiver. This led to some unfortunate performance
characteristics:

通知 API 遍历元素树以找到通知接收者。这导致了一些不幸的性能特征：


  * If there was no receiver for a given notification type, the entire element

    如果给定通知类型没有接收者，则整个元素

tree above the notification dispatch point would be traversed and type
checked.

将遍历通知调度点上方的树并进行类型检查。

  * For multiple notifications in a given frame (which is common for scroll

    对于给定框架中的多个通知（这对于滚动来说很常见）

views) we ended up traversing the element tree multiple times.

视图）我们最终多次遍历元素树。


If there were multiple or nested scroll views on a given page, the situation
was worsened significantly - each scroll view would dispatch multiple
notifications per frame. For example, in the Dart/Flutter Devtools flamegraph
page, we found that about 30% of CPU time was spent dispatching notifications.

如果给定页面上有多个或嵌套的滚动视图，情况会显着恶化 - 每个滚动视图将在每帧发送多个通知。例如，在 Dart/Flutter Devtools 火焰图页面中，我们发现大约 30% 的 CPU 时间用于发送通知。


In order to reduce the cost of dispatching notifications, we have changed
notification dispatch so that it only visits ancestors that are notification
listeners, reducing the number of elements visited per frame.

为了减少发送通知的成本，我们更改了通知发送，使其仅访问作为通知侦听器的祖先，从而减少了每帧访问的元素数量。


However, the old notification system exposed the fact that it traversed
each element as part of its API via `Notification.visitAncestor`. This
method is no longer supported as we no longer visit all ancestor elements.

然而，旧的通知系统暴露了这样一个事实：它通过“Notification.visitAncestor”作为其 API 的一部分遍历每个元素。由于我们不再访问所有祖先元素，因此不再支持此方法。


## Description of change

## 变更说明


`Notification.visitAncestor` has been removed.
Any classes that extend `Notification` should
no longer override this method.

`Notification.visitAncestor` 已被删除。任何扩展“Notification”的类不应再重写此方法。


**If you don't implement a custom Notification
that overrides `Notification.visitAncestor`,
then no changes are required.**

**如果你没有实现覆盖 `Notification.visitAncestor` 的自定义通知，则无需进行任何更改。**


## Migration guide

## 迁移指南


If you have a subclass of `Notification` that overrides
`Notification.visitAncestor`, then you must either delete the override or
opt-into old style notification dispatch with the following code.

如果你有覆盖“Notification.visitAncestor”的“Notification”子类，则必须删除覆盖或使用以下代码选择旧式通知调度。


Code before migration:

迁移前的代码：


```dart
import 'package:flutter/widgets.dart';

class MyNotification extends Notification {

  @override
  bool visitAncestor(Element element) {
    print('Visiting $element');
    return super.visitAncestor(element);
  }
}

void methodThatSendsNotification(BuildContext? context) {
  MyNotification().dispatch(context);
}
```

Code after migration:

迁移后的代码：


```dart
import 'package:flutter/widgets.dart';

class MyNotification extends Notification {

  bool visitAncestor(Element element) {
    print('Visiting $element');
    if (element is ProxyElement) {
      final Widget widget = element.widget;
      if (widget is NotificationListener<MyNotification>) {
        return widget.onNotification?.call(notification) ?? true;
      }
    }
    return true;
  }
}

void methodThatSendsNotification(BuildContext? context) {
  context?.visitAncestor(MyNotification().visitAncestor);
}
```

Note that this performs poorly compared to the
new default behavior of `Notification.dispatch`.

请注意，与“Notification.dispatch”的新默认行为相比，这表现不佳。


## Timeline

## 时间轴


Landed in version: 2.12.0-4.1<br>
In stable release: 3.0.0

登陆版本：2.12.0-4.1<br> 稳定版本：3.0.0


## References

## 参考


API documentation:

API 文档：


* [`Notification`]({{site.api}}/flutter/widgets/Notification-class.html)

  [` 通知 `]({{site.api}}/flutter/widgets/Notification-class.html)


Relevant issues:

相关问题：


* [Issue 97849]({{site.repo.flutter}}/issues/97849)

  [问题 97849]({{site.repo.flutter}}/issues/97849)


Relevant PRs:

相关 PR：


* [improve Notification API performance]({{site.repo.flutter}}/pull/98451)

  [提高通知 API 性能]({{site.repo.flutter}}/pull/98451)

