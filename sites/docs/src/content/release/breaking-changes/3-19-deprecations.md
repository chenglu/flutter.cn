---
# title: Deprecated API removed after v3.19
title: v3.19 后删除了已弃用的 API
# description: >-
#   After reaching end of life, the following deprecated APIs
#   were removed from Flutter.
description: >-
  生命周期结束后，以下已弃用的 API 已从 Flutter 中删除。
ai-translated: true
---

## Summary

## 摘要


In accordance with Flutter's [Deprecation Policy][],
deprecated APIs that reached end of life after the
3.19 stable release have been removed.

符合 Flutter 的[Deprecation Policy][]，在 3.19 稳定版发布后已达到生命周期的已弃用 API 已被删除。


All affected APIs have been compiled into this
primary source to aid in migration.
To further aid your migration, check out this
[quick reference sheet][].

所有受影响的 API 均已编译到此主要源中以帮助迁移。为了进一步帮助你的迁移，请查看此[quick reference sheet][].


[Deprecation Policy]: {{site.repo.flutter}}/blob/main/docs/contributing/Tree-hygiene.md#deprecations
[quick reference sheet]: /go/deprecations-removed-after-3-19

## Changes

## Changes


This section lists the deprecations by the package and affected class.

本节列出了包和受影响的类的弃用。


### `TextTheme`

### `TextTheme`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


Several `TextStyle` properties of `TextTheme` were deprecated in v3.1 to support new
stylings from the Material Design specification. They
are listed in the following table alongside the appropriate replacement in the
new API.

`TextTheme` 的多个 `TextStyle` 属性在 v3.1 中已弃用，以支持 Material Design 规范中的新样式。下表列出了它们以及新 API 中的适当替换。


| <t>Deprecation</t><t>弃用</t> | <t>New API</t><t>新的API</t> |
|---|---|
| headline1	| displayLarge |
| 标题1 | 显示大 |
| headline2	| displayMedium |
| 标题2 | 显示介质 |
| headline3	| displaySmall |
| 标题3 | 显示小 |
| headline4	| headlineMedium |
| 标题4 | 头条中 |
| headline5	| headlineSmall |
| 标题5 | 标题小 |
| headline6	| titleLarge |
| 标题6 | 标题大 |
| subtitle1	| titleMedium |
| 副标题1 | 标题中 |
| subtitle2	| titleSmall |
| 副标题2 | 标题小 |
| bodyText1	| bodyLarge |
| 正文文本1 | 身体大 |
| bodyText2	| bodyMedium |
| 正文2 | 身体中等 |
| caption	  | bodySmall |
| 标题 | 身体小 |
| button	  | labelLarge |
| 按钮 | 标签大 |
| overline	| labelSmall |
| 上划线 | 标签小 |

**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
// TextTheme
// Base constructor
TextTheme(
  headline1: headline1Style,
  headline2: headline2Style,
  headline3: headline3Style,
  headline4: headline4Style,
  headline5: headline5Style,
  headline6: headline6Style,
  subtitle1: subtitle1Style,
  subtitle2: subtitle2Style,
  bodyText1: bodyText1Style,
  bodyText2: bodyText2Style,
  caption: captionStyle,
  button: buttonStyle,
  overline: overlineStyle,
);

// copyWith
TextTheme.copyWith(
  headline1: headline1Style,
  headline2: headline2Style,
  headline3: headline3Style,
  headline4: headline4Style,
  headline5: headline5Style,
  headline6: headline6Style,
  subtitle1: subtitle1Style,
  subtitle2: subtitle2Style,
  bodyText1: bodyText1Style,
  bodyText2: bodyText2Style,
  caption: captionStyle,
  button: buttonStyle,
  overline: overlineStyle,
);

// Getters
TextStyle style;
style = textTheme.headline1,
style = textTheme.headline2,
style = textTheme.headline3,
style = textTheme.headline4,
style = textTheme.headline5,
style = textTheme.headline6,
style = textTheme.subtitle1,
style = textTheme.subtitle2,
style = textTheme.bodyText1,
style = textTheme.bodyText2,
style = textTheme.caption,
style = textTheme.button,
style = textTheme.overline,
```

Code after migration:

迁移后的代码：


```dart
// TextTheme
// Base constructor
TextTheme(
  displayLarge: headline1Style,
  displayMedium: headline2Style,
  displaySmall: headline3Style,
  headlineMedium: headline4Style,
  headlineSmall: headline5Style,
  titleLarge: headline6Style,
  titleMedium: subtitle1Style,
  titleSmall: subtitle2Style,
  bodyLarge: bodyText1Style,
  bodyMedium: bodyText2Style,
  bodySmall: captionStyle,
  labelLarge: buttonStyle,
  labelSmall: overlineStyle,
);

TextTheme.copyWith(
  displayLarge: headline1Style,
  displayMedium: headline2Style,
  displaySmall: headline3Style,
  headlineMedium: headline4Style,
  headlineSmall: headline5Style,
  titleLarge: headline6Style,
  titleMedium: subtitle1Style,
  titleSmall: subtitle2Style,
  bodyLarge: bodyText1Style,
  bodyMedium: bodyText2Style,
  bodySmall: captionStyle,
  labelLarge: buttonStyle,
  labelSmall: overlineStyle,
);

TextStyle style;
style = textTheme.displayLarge;
style = textTheme.displayMedium;
style = textTheme.displaySmall;
style = textTheme.headlineMedium;
style = textTheme.headlineSmall;
style = textTheme.titleLarge;
style = textTheme.titleMedium;
style = textTheme.titleSmall;
style = textTheme.bodyLarge;
style = textTheme.bodyMedium;
style = textTheme.bodySmall;
style = textTheme.labelLarge;
style = textTheme.labelSmall;
```

**References**

**参考**


API documentation:

API 文档：


* [`TextTheme`][]

Relevant PRs:

相关 PR：


* Deprecated in [#109817][]

  已弃用于[#109817][]

* Removed in [#139255][]

  删除于[#139255][]


[`TextTheme`]: {{site.api}}/flutter/material/TextTheme-class.html

[#109817]: {{site.repo.flutter}}/pull/109817
[#139255]: {{site.repo.flutter}}/pull/139255

---

### `ThemeData`

### `ThemeData`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


Several `Color` properties of `ThemeData` were deprecated in v3.3 to support new stylings
from the Material Design specification. These colors were `errorColor`, `backgroundColor`,
 `bottomAppBarColor`, and `toggleableActiveColor`. The first two are replaced by
 properties of the `ThemeData.colorScheme`, while `bottomAppBarColor` is replaced by the
 color of the component theme, `BottomAppBarTheme`. The `toggleableActiveColor` was no
 longer used by the framework and was removed.

`ThemeData` 的多个 `Color` 属性在 v3.3 中已弃用，以支持 Material Design 规范中的新样式。这些颜色是 `errorColor`、`backgroundColor`、`bottomAppBarColor` 和 `toggleableActiveColor`。前两个被 `ThemeData.colorScheme` 的属性替换，而 `bottomAppBarColor` 被组件主题的颜色 `BottomAppBarTheme` 替换。 `toggleableActiveColor` 不再被框架使用并被删除。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
var myTheme = ThemeData(
  //...
  errorColor: Colors.red,
  backgroundColor: Colors.blue,
  bottomAppBarColor: Colors.purple,
  toggleableActiveColor: Colors.orange,
  //...
);
var errorColor = myTheme.errorColor;
var backgroundColor = myTheme.backgroundColor;
var bottomAppBarColor = myTheme.bottomAppBarColor;
var toggleableActiveColor = myTheme.toggleableActiveColor;
```

Code after migration:

迁移后的代码：


```dart
var myTheme = ThemeData(
  //...
  colorScheme: ColorScheme(
    /// ...
    error: Colors.red,
    background: Colors.blue,
  ),
  bottomAppBarTheme: BottomAppBarTheme(
    color: Colors.purple,
  ),
  //...
);
var errorColor = myTheme.colorScheme.error;
var backgroundColor = myTheme.colorScheme.background;
var bottomAppBarColor = myTheme.bottomAppBarTheme.color;
var toggleableActiveColor = Colors.orange;
```

**References**

**参考**


API documentation:

API 文档：


* [`ThemeData`][]
* [`ColorScheme`][]
* [`BottomAppBarTheme`][]

Relevant PRs:

相关 PR：


* Deprecated in [#110162][], [#111080][], and [#97972][]

  已弃用于[#110162][],[#111080][]， 和[#97972][]

* Removed in [#144178][], [#144080][], [#144079][], and [#144078][]

  删除于[#144178][],[#144080][],[#144079][]， 和[#144078][]


[`ThemeData`]: {{site.api}}/flutter/material/ThemeData-class.html
[`ColorScheme`]: {{site.api}}/flutter/material/ColorScheme-class.html
[`BottomAppBarTheme`]: {{site.api}}/flutter/material/BottomAppBarTheme-class.html

[#110162]: {{site.repo.flutter}}/pull/110162
[#111080]: {{site.repo.flutter}}/pull/111080
[#97972]: {{site.repo.flutter}}/pull/97972
[#144178]: {{site.repo.flutter}}/pull/144178
[#144080]: {{site.repo.flutter}}/pull/144080
[#144079]: {{site.repo.flutter}}/pull/144079
[#144078]: {{site.repo.flutter}}/pull/144078

---

### `CupertinoContextMenu.previewBuilder`

### `CupertinoContextMenu.previewBuilder`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The `previewBuilder` was replaced by the `builder` of `CupertinoContextMenu` after
v3.4. By adding `builder`, the entirety of the animation executed by the context
menu is covered, the second half of which was performed by `previewBuilder`, and
delineated by `CupertinoContextMenu.animationOpensAt`.

v3.4 后，`previewBuilder` 被 `CupertinoContextMenu` 的 `builder` 取代。通过添加 `builder`，覆盖了上下文菜单执行的整个动画，其中后半部分由 `previewBuilder` 执行，并由 `CupertinoContextMenu.animationOpensAt` 描绘。



**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
CupertinoContextMenu(
  previewBuilder: (BuildContext context, Animation<double> animation, Widget child) {
    return FittedBox(
      fit: BoxFit.cover,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(64.0 * animation.value),
        child: Image.asset('assets/photo.jpg'),
      ),
    );
  },
  actions: <Widget>[
    CupertinoContextMenuAction(
      child: const Text('Action one'),
      onPressed: () {},
    ),
  ],
  child: FittedBox(
    fit: BoxFit.cover,
    child: Image.asset('assets/photo.jpg'),
  ),
);
```

Code after migration:

迁移后的代码：


```dart
CupertinoContextMenu(
  actions: <Widget>[
    CupertinoContextMenuAction(
      child: const Text('Action one'),
      onPressed: () {},
    ),
  ],
  builder: (BuildContext context, Animation<double> animation) {
    final Animation<BorderRadius?> borderRadiusAnimation = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(CupertinoContextMenu.kOpenBorderRadius),
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(
          CupertinoContextMenu.animationOpensAt,
          1.0,
        ),
      ),
    );

    final Animation<Decoration> boxDecorationAnimation = DecorationTween(
      begin: const BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: <BoxShadow>[],
      ),
      end: BoxDecoration(
        color: Color(0xFFFFFFFF),
        boxShadow: CupertinoContextMenu.kEndBoxShadow,
      ),
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Interval(
          0.0,
          CupertinoContextMenu.animationOpensAt,
        )
      )
    );

    return Container(
      decoration: animation.value < CupertinoContextMenu.animationOpensAt
        ? boxDecorationAnimation.value
        : null,
      child: FittedBox(
        fit: BoxFit.cover,
        child: ClipRRect(
          borderRadius: borderRadiusAnimation.value ?? BorderRadius.circular(0.0),
          child: SizedBox(
            height: 150,
            width: 150,
            child: Image.asset('assets/photo.jpg'),
          ),
        ),
      )
    );
   }
 )
```

**References**

**参考**


API documentation:

API 文档：


* [`CupertinoContextMenu`][]

Relevant PRs:

相关 PR：


* Deprecated in [#110616][]

  已弃用于[#110616][]

* Removed in [#143990][]

  删除于[#143990][]


[`CupertinoContextMenu`]: {{site.api}}/flutter/cupertino/CupertinoContextMenu-class.html

[#110616]: {{site.repo.flutter}}/pull/110616
[#143990]: {{site.repo.flutter}}/pull/143990

---

### `Scrollbar.showTrackOnHover`

### `Scrollbar.showTrackOnHover`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The `showTrackOnHover` property of `Scrollbar`, and its associated component theme,
`ScrollbarThemeData.showTrackOnHover`, were replaced by the stateful property
`ScrollbarThemeData.trackVisibility` after v3.4. By utilizing `trackVisibility`,
all permutations of state can factor into revealing the scrollbar track, not
just hover.

`Scrollbar` 的 `showTrackOnHover` 属性及其关联的组件主题 `ScrollbarThemeData.showTrackOnHover` 在 v3.4 后被有状态属性 `ScrollbarThemeData.trackVisibility` 取代。通过利用 `trackVisibility`，所有状态排列都可以影响滚动条轨道的显示，而不仅仅是悬停。



**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
Scrollbar(
  showTrackOnHover: true,
  child: //...
);
ScrollbarThemeData(
  showTrackOnHover: true,
);
```

Code after migration:

迁移后的代码：


```dart
Scrollbar(
  child: //...
);
ScrollbarThemeData(
  // This will always show the track for any state.
  trackVisibility: MaterialStateProperty<bool>.all(true),
);
// Or
ScrollbarThemeData(
  // Only show on hover.
  trackVisibility: (Set<MaterialState> states) => states.contains(MaterialState.hovered),
);
```

**References**

**参考**


API documentation:

API 文档：


* [`Scrollbar`][]
* [`ScrollbarThemeData`][]
* [`MaterialState`][]
* [`MaterialStateProperty`][]

Relevant PRs:

相关 PR：


* Deprecated in [#111706][]

  已弃用于[#111706][]

* Removed in [#144180][]

  删除于[#144180][]


[`Scrollbar`]: {{site.api}}/flutter/material/Scrollbar-class.html
[`ScrollbarThemeData`]: {{site.api}}/flutter/material/ScrollbarThemeData-class.html
[`MaterialState`]: {{site.api}}/flutter/material/MaterialState-class.html
[`MaterialStateProperty`]: {{site.api}}/flutter/material/MaterialStateProperty-class.html

[#111706]: {{site.repo.flutter}}/pull/111706
[#144180]: {{site.repo.flutter}}/pull/144180

---

### `KeepAliveHandle.release` method

### `KeepAliveHandle.release` 方法


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


The `release` method of `KeepAliveHandle` was removed and replaced by calling
`dispose` after v3.3. This change was made because `release` was found to often
be called without then calling `dispose`, leading to memory leaks. The `dispose`
method executes the same functionality as `release` did now.

v3.3 后，删除了 `KeepAliveHandle` 的 `release` 方法，并通过调用 `dispose` 来替换。进行此更改是因为发现经常调用 `release` 而没有调用 `dispose`，从而导致内存泄漏。 `dispose` 方法执行与 `release` 现在相同的功能。



**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
KeepAliveHandle handle = KeepAliveHandle();
handle.release();
handle.dispose();
```

Code after migration:

迁移后的代码：


```dart
KeepAliveHandle handle = KeepAliveHandle();
handle.dispose();
```

**References**

**参考**


API documentation:

API 文档：


* [`KeepAliveHandle`][]

Relevant PRs:

相关 PR：


* Deprecated in [#108384][]

  已弃用于[#108384][]

* Removed in [#143961][]

  删除于[#143961][]


[`KeepAliveHandle`]: {{site.api}}/flutter/widgets/KeepAliveHandle-class.html

[#108384]: {{site.repo.flutter}}/pull/108384
[#143961]: {{site.repo.flutter}}/pull/143961

---

### `InteractiveViewer.alignPanAxis`

### `InteractiveViewer.alignPanAxis`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The `alignPanAxis` property of `InteractiveViewer` was removed and replaced with
`panAxis` after v3.3. This change was made to enable more modes of panning in
`InteractiveViewer`.

v3.3 后，`InteractiveViewer` 的 `alignPanAxis` 属性已被删除并替换为 `panAxis`。进行此更改是为了在 `InteractiveViewer` 中启用更多平移模式。



**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
InteractiveViewer(
  alignPanAxis: true,
);
```

Code after migration:

迁移后的代码：


```dart
InteractiveViewer(
  panAxis: PanAxis.aligned,
);
```

**References**

**参考**


API documentation:

API 文档：


* [`InteractiveViewer`][]
* [`PanAxis`][]

Relevant PRs:

相关 PR：


* Deprecated in [#109014][]

  已弃用于[#109014][]

* Removed in [#142500][]

  删除于[#142500][]


[`InteractiveViewer`]: {{site.api}}/flutter/widgets/InteractiveViewer-class.html
[`PanAxis`]: {{site.api}}/flutter/widgets/PanAxis.html

[#109014]: {{site.repo.flutter}}/pull/109014
[#142500]: {{site.repo.flutter}}/pull/142500

---

### `MediaQuery.boldTextOverride`

### `MediaQuery.boldTextOverride`


Package: flutter
Supported by Flutter Fix: yes

封装：flutter 由 Flutter 支持 修复：是


The `boldTextOverride` method of `MediaQuery` was removed and replaced with
`boldTextOf` after v3.5. This change was made as part of larger refactor of
`MediaQuery`, most notably reducing the number of rebuilds that would be
triggered by widgets that depend on it.

v3.5 后，删除了 `MediaQuery` 的 `boldTextOverride` 方法，并替换为 `boldTextOf`。此更改是 `MediaQuery` 较大重构的一部分，最显着的是减少了依赖于它的 widgets 触发的重建数量。



**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
MediaQuery.boldTextOverride(context);
```

Code after migration:

迁移后的代码：


```dart
MediaQuery.boldTextOf(context)
```

**References**

**参考**


API documentation:

API 文档：


* [`MediaQuery`][]

Relevant PRs:

相关 PR：


* Deprecated in [#114459][]

  已弃用于[#114459][]

* Removed in [#143960][]

  删除于[#143960][]


[`MediaQuery`]: {{site.api}}/flutter/widgets/MediaQuery-class.html

[#114459]: {{site.repo.flutter}}/pull/114459
[#143960]: {{site.repo.flutter}}/pull/143960

---

### Renamed builder typedefs for `AnimatedList`

### 重命名为 `AnimatedList` 的构建器类型定义


Package: flutter
Supported by Flutter Fix: no

封装：flutter 由 Flutter 支持 修复：无


With the addition of `AnimatedGrid`, `AnimatedList` was refactored to share a common base
class. The previously named `AnimatedListItemBuilder` and `AnimatedListRemovedItemBuilder`
were renamed to better reflect the classes they could be used with after v3.5.
Rename any references to `AnimatedItemBuilder` and `AnimatedRemovedItemBuilder`.

添加 `AnimatedGrid` 后，`AnimatedList` 被重构以共享公共基类。之前命名的 `AnimatedListItemBuilder` 和 `AnimatedListRemovedItemBuilder` 已重命名，以更好地反映它们在 v3.5 后可以使用的类。将所有引用重命名为 `AnimatedItemBuilder` 和 `AnimatedRemovedItemBuilder`。


**References**

**参考**


API documentation:

API 文档：


* [`AnimatedGrid`][]
* [`AnimatedList`][]
* [`AnimatedItemBuilder`][]
* [`AnimatedRemovedItemBuilder`][]

Relevant PRs:

相关 PR：


* Deprecated in [#113793][]

  已弃用于[#113793][]

* Removed in [#143974][]

  删除于[#143974][]


[`AnimatedGrid`]: {{site.api}}/flutter/widgets/AnimatedGrid-class.html
[`AnimatedList`]: {{site.api}}/flutter/widgets/AnimatedList-class.html
[`AnimatedItemBuilder`]: {{site.api}}/flutter/widgets/AnimatedItemBuilder.html
[`AnimatedRemovedItemBuilder`]: {{site.api}}/flutter/widgets/AnimatedRemovedItemBuilder.html

[#113793]: {{site.repo.flutter}}/pull/113793
[#143974]: {{site.repo.flutter}}/pull/143974

---

### `FlutterDriver.enableAccessibility`

### `FlutterDriver.enableAccessibility`


Package: flutter_driver
Supported by Flutter Fix: yes

软件包：flutter_driver 由 Flutter 支持 修复：是


The `enableAccessibility` method of `flutterDriver` was deprecated in v2.3. It
was removed and replaced with `setSemantics`. This change made is possible to
enable or disable accessibility, rather than only enable it.

`flutterDriver` 的 `enableAccessibility` 方法在 v2.3 中已弃用。它已被删除并替换为 `setSemantics`。所做的更改可以启用或禁用可访问性，而不仅仅是启用它。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
FlutterDriver driver = FlutterDriver.connectedTo(
  // ...
);
driver.enableAccessibility();
```

Code after migration:

迁移后的代码：


```dart
FlutterDriver driver = FlutterDriver.connectedTo(
  // ...
);
driver.setSemantics(true);
```

**References**

**参考**


API documentation:

API 文档：


* [`FlutterDriver`][]

Relevant PRs:

相关 PR：


* Deprecated in [#82939][]

  已弃用于[#82939][]

* Removed in [#143979][]

  删除于[#143979][]


[`FlutterDriver`]: {{site.api}}/flutter/flutter_driver/FlutterDriver-class.html

[#82939]: {{site.repo.flutter}}/pull/82939
[#143979]: {{site.repo.flutter}}/pull/143979

---

### `TimelineSummary.writeSummaryToFile`

### `TimelineSummary.writeSummaryToFile`


Package: flutter_driver
Supported by Flutter Fix: yes

软件包：flutter_driver 由 Flutter 支持 修复：是


The `writeSummaryToFile` method of `TimelineSummary` was deprecated in v2.1. It
was removed and replaced with `writeTimelineToFile`.

`TimelineSummary` 的 `writeSummaryToFile` 方法在 v2.1 中已弃用。它已被删除并替换为 `writeTimelineToFile`。


**Migration guide**

**迁移指南**


Code before migration:

迁移前的代码：


```dart
TimelineSummary summary = TimelineSummary.summarize(
  myTimeline,
);
summary.writeSummaryToFile(
  traceName,
  pretty: true,
);
```

Code after migration:

迁移后的代码：


```dart
TimelineSummary summary = TimelineSummary.summarize(
  myTimeline,
);
summary.writeTimelineToFile(
  traceName,
  pretty: true,
);
```

**References**

**参考**


API documentation:

API 文档：


* [`TimelineSummary`][]

Relevant PRs:

相关 PR：


* Deprecated in [#79310][]

  已弃用于[#79310][]

* Removed in [#143983][]

  删除于[#143983][]


[`TimelineSummary`]: {{site.api}}/flutter/flutter_driver/TimelineSummary-class.html

[#79310]: {{site.repo.flutter}}/pull/79310
[#143983]: {{site.repo.flutter}}/pull/143983

### `Android Platform Views on API 22 and below `

### `Android Platform Views on API 22 and below `


Supported by Flutter Fix: no

由 Flutter 支持修复：否


As of Flutter 3.0 platform views require api 23 or higher. In Flutter 3.19 we now throw UnsupportedOperationException
when using platform views on android devices running api level 22 and below.

从 Flutter 3.0 平台视图开始，需要 api 23 或更高版本。在 Flutter 3.19 中，我们现在在运行 api 级别 22 及更低级别的 Android 设备上使用平台视图时会抛出 UnsupportedOperationException。


**Migration guide**

**迁移指南**


Set minimum api level to 23 (or higher) or check the android api level before displaying a platform view.

将最低 api 级别设置为 23（或更高）或在显示平台视图之前检查 android api 级别。


---

The [previously announced][] deprecations for context menus, relating to `ToolbarOptions`
as well as parts of `TextSelectionController` and `SelectableRegionState` were not
removed this cycle, to allow more time for migration.
Expect these deprecations to be removed in the next cycle, which will
be announced again when the time comes.

这[previously announced][]本周期未删除与 `ToolbarOptions` 相关的上下文菜单以及 `TextSelectionController` 和 `SelectableRegionState` 的部分内容，以便有更多时间进行迁移。预计这些弃用将在下一个周期中删除，届时将再次宣布。


[previously announced]: https://groups.google.com/g/flutter-announce/c/8XjXpUKlnf8

---

## Timeline

## 时间线


In stable release: 3.22.0
稳定版本：3.22.0
