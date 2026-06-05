---
# title: Migration guide for `RouteInformation.location`
title: “RouteInformation.location”的迁移指南
# description: Deprecation of `RouteInformation.location` and its related APIs.
description: 弃用 `RouteInformation.location` 及其相关 API。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}



## Summary

## 摘要


`RouteInformation.location` and related APIs were deprecated
in the favor of `RouteInformation.uri`.

“RouteInformation.location”和相关 API 已被弃用，取而代之的是“RouteInformation.uri”。


## Context

## 背景


The [`RouteInformation`][] needs the authority information to
handle mobile deeplinks from different web domains.
The `uri` field was added to `RouteInformation` that captures
the entire deeplink information and route-related parameters
were converted to the full [`Uri`][] format.
This led to deprecation of incompatible APIs.

[`RouteInformation`][] 需要权限信息来处理来自不同 Web 域的移动深度链接。在“RouteInformation”中添加“uri”字段，捕获完整的深层链接信息，并将与路由相关的参数转换为完整的[`Uri`][]格式。这导致不兼容的 API 被弃用。


## Description of change

## 变更说明


* The `RouteInformation.location` was replaced by `RouteInformation.uri`.

  “RouteInformation.location”已替换为“RouteInformation.uri”。

* The `WidgetBindingObserver.didPushRoute` was deprecated.

  `WidgetBindingObserver.didPushRoute` 已被弃用。

* The `location` parameter of `SystemNavigator.routeInformationUpdated` was

  `SystemNavigator.routeInformationUpdated` 的 `location` 参数是

replaced by the newly added `uri` parameter.

替换为新添加的“uri”参数。


## Migration guide

## 迁移指南


Code before migration:

迁移前的代码：


```dart
const RouteInformation myRoute = RouteInformation(location: '/myroute');
```

Code after migration:

迁移后的代码：


```dart
final RouteInformation myRoute = RouteInformation(uri: Uri.parse('/myroute'));
```

Code before migration:

迁移前的代码：


```dart
final String myPath = myRoute.location;
```

Code after migration:

迁移后的代码：


```dart
final String myPath = myRoute.uri.path;
```

Code before migration:

迁移前的代码：


```dart
class MyObserverState extends State<MyWidget> with WidgetsBindingObserver {
  @override
  Future<bool> didPushRoute(String route) => _handleRoute(route);
}
```

Code after migration:

迁移后的代码：


```dart
class MyObserverState extends State<MyWidget> with WidgetsBindingObserver {
  @override
  Future<bool> didPushRouteInformation(RouteInformation routeInformation) => _handleRoute(
    Uri.decodeComponent(
      Uri(
        path: uri.path.isEmpty ? '/' : uri.path,
        queryParameters: uri.queryParametersAll.isEmpty ? null : uri.queryParametersAll,
        fragment: uri.fragment.isEmpty ? null : uri.fragment,
      ).toString(),
    )
  );
}
```

Code before migration:

迁移前的代码：


```dart
SystemNavigator.routeInformationUpdated(location: '/myLocation');
```

Code after migration:

迁移后的代码：


```dart
SystemNavigator.routeInformationUpdated(uri: Uri.parse('/myLocation'));
```

## Timeline

## 时间轴


Landed in version: 3.10.0-13.0.pre<br>
In stable release: 3.13.0

登陆版本：3.10.0-13.0.pre<br> 稳定版本：3.13.0


## References

## 参考


Relevant PRs:

相关 PR：


* [PR 119968][]: Implement url support for

  [PR 119968][]：实现 url 支持

RouteInformation and didPushRouteInformation.

路由信息和 didPushRouteInformation。


[PR 119968]: {{site.repo.flutter}}/pull/119968
[`RouteInformation`]: {{site.api}}/flutter/widgets/RouteInformation-class.html
[`Uri`]: {{site.api}}/flutter/dart-core/Uri-class.html
