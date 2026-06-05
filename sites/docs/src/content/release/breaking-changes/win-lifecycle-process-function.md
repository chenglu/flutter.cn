---
# title: Introduction of FlutterEngine::ProcessExternalWindowMessage
title: FlutterEngine::ProcessExternalWindowMessage简介
# description: >-
#   External windows should call ProcessExternalWindowMessage to
#   be considered for application lifecycle events.
description: >-
  外部窗口应调用 ProcessExternalWindowMessage 来考虑应用程序生命周期事件。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


When you add any external windows to your Flutter app,
you need to include them in the Window's app lifecycle logic.
To include the window, its `WndProc` function should invoke
`FlutterEngine::ProcessExternalWindowMessage`.

当你将任何外部窗口添加到 Flutter 应用程序时，你需要将它们包含在窗口的应用程序生命周期逻辑中。要包含该窗口，其 `WndProc` 函数应调用 `FlutterEngine::ProcessExternalWindowMessage`。


## Who is affected

## 受影响的对象


Windows applications built against Flutter 3.13 or newer that
open non-Flutter windows.

针对 Flutter 3.13 或更高版本构建的 Windows 应用程序，可打开非 Flutter 窗口。


## Description of change

## 变更说明


Implementing application lifecycle on Windows involves listening for Window
messages in order to update the lifecycle state. In order for additional
non-Flutter windows to affect the lifecycle state, they must forward their
window messages to `FlutterEngine::ProcessExternalWindowMessage` from their
`WndProc` functions. This function returns an `std::optional<LRESULT>`, which
is `std::nullopt` when the message is received, but not consumed. When the
returned result has a value, the message has been consumed, and further
processing in `WndProc` should cease.

在 Windows 上实现应用程序生命周期涉及监听 Window 消息以更新生命周期状态。为了让其他非 Flutter 窗口影响生命周期状态，它们必须将其窗口消息从其 `WndProc` 函数转发到 `FlutterEngine::ProcessExternalWindowMessage` 。该函数返回一个 `std::optional<LRESULT>`，当消息被接收但没有被消费时，它是 `std::nullopt`。当返回的结果有值时，消息已被消耗，并且 `WndProc` 中的进一步处理应该停止。


## Migration guide

## 迁移指南


The following example `WndProc` procedure invokes
`FlutterEngine::ProcessExternalWindowMessage`:

以下示例 `WndProc` 过程调用 `FlutterEngine::ProcessExternalWindowMessage`：


```cpp
LRESULT Window::Messagehandler(HWND hwnd, UINT msg, WPARAM wparam, LPARAM lparam) {
    std::optional<LRESULT> result = flutter_controller_->engine()->ProcessExternalWindowMessage(hwnd, msg, wparam, lparam);
    if (result.has_value()) {
        return *result;
    }
    // Original contents of WndProc...
}
```

## Timeline

## 时间线


Landed in version: 3.14.0-3.0.pre<br>
登陆版本：3.14.0-3.0.pre
In stable release: 3.16
稳定版本：3.16

## References

## 参考资料


Relevant PRs:

相关 PR：


* [Reintroduce Windows lifecycle with guard for posthumous OnWindowStateEvent][]

  [重新引入 Windows 生命周期，并为死后的 OnWindowStateEvent 提供保护][Reintroduce Windows lifecycle with guard for posthumous OnWindowStateEvent]


[Reintroduce Windows lifecycle with guard for posthumous OnWindowStateEvent]: {{site.repo.engine}}/pull/44344
