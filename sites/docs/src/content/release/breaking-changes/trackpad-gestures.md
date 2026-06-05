---
# title: Trackpad gestures can trigger GestureRecognizer
title: 触控板手势可以触发 GestureRecognizer
# description: >
#   Trackpad gestures on most platforms now send `PointerPanZoom` sequences and
#   can trigger pan, drag, and scale `GestureRecognizer` callbacks.
description: >
  大多数平台上的触控板手势现在都会发送“PointerPanZoom”序列，并且可以触发平移、拖动和缩放“GestureRecognizer”回调。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


Trackpad gestures on most platforms now send `PointerPanZoom` sequences and
can trigger pan, drag, and scale `GestureRecognizer` callbacks.

大多数平台上的触控板手势现在都会发送“PointerPanZoom”序列，并且可以触发平移、拖动和缩放“GestureRecognizer”回调。


## Context

## 背景


Scrolling on Flutter Desktop prior to version 3.3.0 used `PointerScrollEvent`
messages to represent discrete scroll deltas. This system worked well for mouse
scroll wheels, but wasn't a good fit for trackpad scrolling. Trackpad scrolling
is expected to cause momentum, which depends not only on the scroll deltas, but
also the timing of when fingers are released from the trackpad.
In addition, trackpad pinching-to-zoom could not be represented.

在 3.3.0 版本之前的 Flutter Desktop 上滚动使用“PointerScrollEvent”消息来表示离散的滚动增量。该系统适用于鼠标滚轮，但不太适合触控板滚动。触控板滚动预计会产生动量，这不仅取决于滚动增量，还取决于手指从触控板上释放的时间。此外，无法表示触控板捏合缩放。


Three new `PointerEvent`s have been introduced: `PointerPanZoomStartEvent`,
`PointerPanZoomUpdateEvent`, and `PointerPanZoomEndEvent`.
Relevant `GestureRecognizer`s have been updated to register interest in
trackpad gesture sequences, and will emit `onDrag`, `onPan`, and/or
`onScale` callbacks in response to movements
of two or more fingers on the trackpad.

引入了三个新的“PointerEvent”：“PointerPanZoomStartEvent”、“PointerPanZoomUpdateEvent”和“PointerPanZoomEndEvent”。相关的“GestureRecognizer”已更新为注册对触控板手势序列的兴趣，并将发出“onDrag”、“onPan”和/或“onScale”回调以响应触控板上两个或更多手指的移动。


This means both that code designed only for touch interactions might trigger upon
trackpad interaction, and that code designed to handle all desktop scrolling
might now only trigger upon mouse scrolling, and not trackpad scrolling.

这意味着仅针对触摸交互设计的代码可能会在触控板交互时触发，而设计用于处理所有桌面滚动的代码现在可能仅在鼠标滚动时触发，而不是触控板滚动时触发。


## Description of change

## 变更说明


The Flutter engine has been updated on all possible platforms to recognize
trackpad gestures and send them to the framework as `PointerPanZoom` events
instead of as `PointerScrollSignal` events. `PointerScrollSignal` events will
still be used to represent scrolling on a mouse wheel.

Flutter 引擎已在所有可能的平台上进行更新，以识别触控板手势并将其作为“PointerPanZoom”事件而不是“PointerScrollSignal”事件发送到框​​架。 `PointerScrollSignal` 事件仍将用于表示鼠标滚轮上的滚动。


Depending on the platform and specific trackpad model, the new system might not
be used, if not enough data is provided to the Flutter engine by platform APIs.
This includes on Windows, where trackpad gesture support is dependent on the
trackpad's driver, and the Web platform, where not enough data is provided by
browser APIs, and trackpad scrolling must still
use the old `PointerScrollSignal` system.

根据平台和特定触控板型号，如果平台 API 没有向 Flutter 引擎提供足够的数据，则可能无法使用新系统。这包括在 Windows 上，其中触控板手势支持依赖于触控板的驱动程序；在 Web 平台上，浏览器 API 没有提供足够的数据，并且触控板滚动必须仍然使用旧的“PointerScrollSignal”系统。


Developers should be prepared to receive both types of events and
ensure their apps or packages handle them in the appropriate manner.

开发人员应该准备好接收这两种类型的事件，并确保他们的应用程序或包以适当的方式处理它们。


`Listener` now has three new callbacks: `onPointerPanZoomStart`,
`onPointerPanZoomUpdate`, and `onPointerPanZoomEnd` which can
be used to observe trackpad scrolling and zooming events.

“Listener”现在具有三个新回调：“onPointerPanZoomStart”、“onPointerPanZoomUpdate”和“onPointerPanZoomEnd”，可用于观察触控板滚动和缩放事件。


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          debugPrint('mouse scrolled ${event.scrollDelta}');
        }
      },
      onPointerPanZoomStart: (PointerPanZoomStartEvent event) {
        debugPrint('trackpad scroll started');
      },
      onPointerPanZoomUpdate: (PointerPanZoomUpdateEvent event) {
        debugPrint('trackpad scrolled ${event.panDelta}');
      },
      onPointerPanZoomEnd: (PointerPanZoomEndEvent event) {
        debugPrint('trackpad scroll ended');
      },
      child: Container()
    );
  }
}
```

`PointerPanZoomUpdateEvent` contains a `pan` field to represent the cumulative
pan of the current gesture, a `panDelta` field to represent the difference in
pan since the last event, a `scale` event to represent the cumulative zoom
of the current gesture, and a `rotation` event to
represent the cumulative rotation (in radians) of the current gesture.

“PointerPanZoomUpdateEvent”包含一个“pan”字段来表示当前手势的累积平移，一个“panDelta”字段来表示自上次事件以来平移的差异，一个“scale”事件来表示当前手势的累积缩放，以及一个“rotation”事件来表示当前手势的累积旋转（以弧度为单位）。


`GestureRecognizer`s now have methods to all the trackpad events from one
continuous trackpad gesture. Calling the `addPointerPanZoom` method on a
`GestureRecognizer` with a `PointerPanZoomStartEvent` will cause the recognizer
to register its interest in that trackpad interaction, and resolve conflicts
between multiple `GestureRecognizer`s that could potentially respond to the
gesture.

“GestureRecognizer”现在具有处理来自一个连续触控板手势的所有触控板事件的方法。使用“PointerPanZoomStartEvent”在“GestureRecognizer”上调用“addPointerPanZoom”方法将导致识别器注册其对触控板交互的兴趣，并解决可能响应手势的多个“GestureRecognizer”之间的冲突。


The following example shows the proper use of `Listener` and `GestureRecognizer`
to respond to trackpad interactions.

以下示例展示了如何正确使用“Listener”和“GestureRecognizer”来响应触控板交互。


```dart
void main() => runApp(Foo());

class Foo extends StatefulWidget {
  late final PanGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    recognizer = PanGestureRecognizer()
    ..onStart = _onPanStart
    ..onUpdate = _onPanUpdate
    ..onEnd = _onPanEnd;
  }

  void _onPanStart(DragStartDetails details) {
    debugPrint('onStart');
  }

  void _onPanUpdate(DragUpdateDetails details) {
    debugPrint('onUpdate');
  }

  void _onPanEnd(DragEndDetails details) {
    debugPrint('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: recognizer.addPointer,
      onPointerPanZoomStart: recognizer.addPointerPanZoom,
      child: Container()
    );
  }
}
```

When using `GestureDetector`, this is done automatically, so code such as the
following example will issue its gesture update callbacks in response to both
touch and trackpad panning.

使用“GestureDetector”时，这是自动完成的，因此以下示例等代码将发出手势更新回调以响应触摸和平移。


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        debugPrint('onStart');
      },
      onPanUpdate: (details) {
        debugPrint('onUpdate');
      },
      onPanEnd: (details) {
        debugPrint('onEnd');
      }
      child: Container()
    );
  }
}
```

## Migration guide

## 迁移指南


Migration steps depend on whether you want each gesture interaction in your
app to be usable via a trackpad, or whether it should be restricted to only
touch and mouse usage.

迁移步骤取决于你是否希望应用程序中的每个手势交互都可以通过触控板使用，或者是否应仅限于触摸和鼠标使用。


### For gesture interactions suitable for trackpad usage

### 用于适合触控板使用的手势交互


#### Using `GestureDetector`

#### 使用“手势检测器”


No change is needed, `GestureDetector` automatically processes trackpad
gesture events and triggers callbacks if recognized.

无需更改，“GestureDetector”会自动处理触控板手势事件并在识别后触发回调。


#### Using `GestureRecognizer` and `Listener`

#### 使用“GestureRecognizer”和“Listener”


Ensure that `onPointerPanZoomStart` is passed through to
each recognizer from the `Listener`.
The `addPointerPanZoom` method of `GestureRecognizer must be called
for it to show interest and start tracking each trackpad gesture.

确保“onPointerPanZoomStart”从“Listener”传递到每个识别器。必须调用 GestureRecognizer 的 addPointerPanZoom 方法才能表现出兴趣并开始跟踪每个触控板手势。


Code before migration:

迁移前的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatefulWidget {
  late final PanGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    recognizer = PanGestureRecognizer()
    ..onStart = _onPanStart
    ..onUpdate = _onPanUpdate
    ..onEnd = _onPanEnd;
  }

  void _onPanStart(DragStartDetails details) {
    debugPrint('onStart');
  }

  void _onPanUpdate(DragUpdateDetails details) {
    debugPrint('onUpdate');
  }

  void _onPanEnd(DragEndDetails details) {
    debugPrint('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: recognizer.addPointer,
      child: Container()
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatefulWidget {
  late final PanGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    recognizer = PanGestureRecognizer()
    ..onStart = _onPanStart
    ..onUpdate = _onPanUpdate
    ..onEnd = _onPanEnd;
  }

  void _onPanStart(DragStartDetails details) {
    debugPrint('onStart');
  }

  void _onPanUpdate(DragUpdateDetails details) {
    debugPrint('onUpdate');
  }

  void _onPanEnd(DragEndDetails details) {
    debugPrint('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: recognizer.addPointer,
      onPointerPanZoomStart: recognizer.addPointerPanZoom,
      child: Container()
    );
  }
}
```

#### Using raw `Listener`

#### 使用原始的“监听器”


The following code using PointerScrollSignal will no longer be called upon all
desktop scrolling. `PointerPanZoomUpdate` events should be captured to receive
trackpad gesture data.

使用 PointerScrollSignal 的以下代码将不再在所有桌面滚动时被调用。应捕获“PointerPanZoomUpdate”事件以接收触控板手势数据。


Code before migration:

迁移前的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          debugPrint('scroll wheel event');
        }
      }
      child: Container()
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (PointerSignalEvent event) {
        if (event is PointerScrollEvent) {
          debugPrint('scroll wheel event');
        }
      },
      onPointerPanZoomUpdate: (PointerPanZoomUpdateEvent event) {
        debugPrint('trackpad scroll event');
      }
      child: Container()
    );
  }
}
```

Please note: Use of raw `Listener` in this way could
cause conflicts with other gesture interactions as it
doesn't participate in the gesture disambiguation arena.

请注意：以这种方式使用原始“Listener”可能会导致与其他手势交互发生冲突，因为它不参与手势消歧领域。


### For gesture interactions not suitable for trackpad usage

### 对于不适合触控板使用的手势交互


#### Using `GestureDetector`

#### 使用“手势检测器”


If using Flutter 3.3.0, `RawGestureDetector` could be used
instead of `GestureDetector` to ensure each `GestureRecognizer` created
by the `GestureDetector` has `supportedDevices` set to
exclude `PointerDeviceKind.trackpad`.
Starting in version 3.4.0, there is a `supportedDevices` parameter
directly on `GestureDetector`.

如果使用 Flutter 3.3.0，可以使用“RawGestureDetector”代替“GestureDetector”，以确保“GestureDetector”创建的每个“GestureRecognizer”都将“supportedDevices”设置为排除“PointerDeviceKind.trackpad”。从版本 3.4.0 开始，“GestureDetector”上直接有一个“supportedDevices”参数。


Code before migration:

迁移前的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        debugPrint('onStart');
      },
      onPanUpdate: (details) {
        debugPrint('onUpdate');
      },
      onPanEnd: (details) {
        debugPrint('onEnd');
      }
      child: Container()
    );
  }
}
```

Code after migration (Flutter 3.3.0):

迁移后的代码（Flutter 3.3.0）：


```dart
// Example of code after the change.
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
          () => PanGestureRecognizer(
            supportedDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.invertedStylus,
              // Do not include PointerDeviceKind.trackpad
            }
          ),
          (recognizer) {
            recognizer
              ..onStart = (details) {
                debugPrint('onStart');
              }
              ..onUpdate = (details) {
                debugPrint('onUpdate');
              }
              ..onEnd = (details) {
                debugPrint('onEnd');
              };
          },
        ),
      },
      child: Container()
    );
  }
}
```

Code after migration: (Flutter 3.4.0):

迁移后的代码：（Flutter 3.4.0）：


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      supportedDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.invertedStylus,
        // Do not include PointerDeviceKind.trackpad
      },
      onPanStart: (details) {
        debugPrint('onStart');
      },
      onPanUpdate: (details) {
        debugPrint('onUpdate');
      },
      onPanEnd: (details) {
        debugPrint('onEnd');
      }
      child: Container()
    );
  }
}
```

#### Using `RawGestureRecognizer`

#### 使用“RawGestureRecognizer”


Explicitly ensure that `supportedDevices`
doesn't include `PointerDeviceKind.trackpad`.

明确确保“supportedDevices”不包含“PointerDeviceKind.trackpad”。


Code before migration:

迁移前的代码：


```dart
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
          () => PanGestureRecognizer(),
          (recognizer) {
            recognizer
              ..onStart = (details) {
                debugPrint('onStart');
              }
              ..onUpdate = (details) {
                debugPrint('onUpdate');
              }
              ..onEnd = (details) {
                debugPrint('onEnd');
              };
          },
        ),
      },
      child: Container()
    );
  }
}
```

Code after migration:

迁移后的代码：


```dart
// Example of code after the change.
void main() => runApp(Foo());

class Foo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        PanGestureRecognizer:
            GestureRecognizerFactoryWithHandlers<PanGestureRecognizer>(
          () => PanGestureRecognizer(
            supportedDevices: {
              PointerDeviceKind.touch,
              PointerDeviceKind.mouse,
              PointerDeviceKind.stylus,
              PointerDeviceKind.invertedStylus,
              // Do not include PointerDeviceKind.trackpad
            }
          ),
          (recognizer) {
            recognizer
              ..onStart = (details) {
                debugPrint('onStart');
              }
              ..onUpdate = (details) {
                debugPrint('onUpdate');
              }
              ..onEnd = (details) {
                debugPrint('onEnd');
              };
          },
        ),
      },
      child: Container()
    );
  }
}
```

#### Using `GestureRecognizer` and `Listener`

#### 使用“GestureRecognizer”和“Listener”


After upgrading to Flutter 3.3.0, there won't be a change in behavior, as
`addPointerPanZoom` must be called on each `GestureRecognizer` to allow
it to track gestures. The following code won't receive pan gesture callbacks
when the trackpad is scrolled:

升级到 Flutter 3.3.0 后，行为不会发生变化，因为必须在每个“GestureRecognizer”上调用“addPointerPanZoom”以允许其跟踪手势。当触控板滚动时，以下代码不会接收平移手势回调：


```dart
void main() => runApp(Foo());

class Foo extends StatefulWidget {
  late final PanGestureRecognizer recognizer;

  @override
  void initState() {
    super.initState();
    recognizer = PanGestureRecognizer()
    ..onStart = _onPanStart
    ..onUpdate = _onPanUpdate
    ..onEnd = _onPanEnd;
  }

  void _onPanStart(DragStartDetails details) {
    debugPrint('onStart');
  }

  void _onPanUpdate(DragUpdateDetails details) {
    debugPrint('onUpdate');
  }

  void _onPanEnd(DragEndDetails details) {
    debugPrint('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: recognizer.addPointer,
      // recognizer.addPointerPanZoom is not called
      child: Container()
    );
  }
}
```

## Timeline

## 时间轴


Landed in version: 3.3.0-0.0.pre<br>
In stable release: 3.3.0

登陆版本：3.3.0-0.0.pre<br> 稳定版本：3.3.0


## References

## 参考


API documentation:

API 文档：


* [`GestureDetector`][]


* [`RawGestureDetector`][]

  [`RawGestureDetector`][]

* [`GestureRecognizer`][]


Design document:

设计文件：


* [Flutter Trackpad Gestures][]


Relevant issues:

相关问题：


* [Issue 23604][]

  [问题 23604][Issue 23604]


Relevant PRs:

相关 PR：


* [Support trackpad gestures in framework][]


* [iPad trackpad gestures][]

  [iPad 触控板手势][iPad trackpad gestures]

* [Linux trackpad gestures][]

  [Linux 触控板手势][Linux trackpad gestures]

* [Mac trackpad gestures][]


* [Win32 trackpad gestures][]

  [Win32 触控板手势][Win32 trackpad gestures]

* [ChromeOS/Android trackpad gestures][]

  [ChromeOS/Android 触控板手势][ChromeOS/Android trackpad gestures]


[`GestureDetector`]: {{site.api}}/flutter/widgets/GestureDetector-class.html
[`GestureRecognizer`]: {{site.api}}/flutter/gestures/GestureRecognizer-class.html
[`RawGestureDetector`]: {{site.api}}/flutter/widgets/RawGestureDetector-class.html
[Flutter Trackpad Gestures]: https://docs.google.com/document/d/1oRvebwjpsC3KlxN1gOYnEdxtNpQDYpPtUFAkmTUe-K8
[Issue 23604]: {{site.repo.flutter}}/issues/23604
[Support trackpad gestures in framework]: {{site.repo.flutter}}/pull/89944
[iPad trackpad gestures]: {{site.repo.engine}}/pull/31591
[Linux trackpad gestures]: {{site.repo.engine}}/pull/31592
[Mac trackpad gestures]: {{site.repo.engine}}/pull/31593
[Win32 trackpad gestures]: {{site.repo.engine}}/pull/31594
[ChromeOS/Android trackpad gestures]: {{site.repo.engine}}/pull/34060
