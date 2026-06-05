---
# title: New Buttons and Button themes
title: 新按钮和按钮主题
# description: The basic material button classes have been replaced.
description: 基本材质按钮类已被替换。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}

## Summary

## 摘要


A new set of basic material button widgets and themes have been added
to Flutter. The original classes have been deprecated and will
eventually be removed. The overall goal is to make buttons more
flexible, and easier to configure via constructor parameters or
themes.

Flutter 中添加了一组新的基本材质按钮 widgets 和主题。原来的类已被弃用，最终将被删除。总体目标是使按钮更加灵活，并且更容易通过构造函数参数或主题进行配置。


The `FlatButton`, `RaisedButton` and `OutlineButton` widgets have been
replaced by `TextButton`, `ElevatedButton`, and `OutlinedButton`
respectively. Each new button class has its own theme:
`TextButtonTheme`, `ElevatedButtonTheme`, and
`OutlinedButtonTheme`. The original `ButtonTheme` class is no longer
used. The appearance of buttons is specified by a `ButtonStyle`
object, instead of a large set of widget parameters and
properties. This is roughly comparable to the way that the appearance
of text is defined with a `TextStyle` object. The new button themes
are also configured with a `ButtonStyle` object. A `ButtonStyle` is
itself just a collection of visual properties. Many of these
properties are defined with `MaterialStateProperty`, which means that
their value can depend on the button's state.

`FlatButton`、`RaisedButton` 和 `OutlineButton` widget 已分别替换为 `TextButton`、`ElevatedButton` 和 `OutlinedButton`。每个新按钮类都有自己的主题：`TextButtonTheme`、`ElevatedButtonTheme` 和 `OutlinedButtonTheme`。原来的 `ButtonTheme` 类不再使用。按钮的外观由 `ButtonStyle` 对象指定，而不是由一大组 widget 参数和属性指定。这与使用 `TextStyle` 对象定义文本外观的方式大致相当。新的按钮主题还配置了 `ButtonStyle` 对象。 `ButtonStyle` 本身只是视觉属性的集合。其中许多属性都是使用 `MaterialStateProperty` 定义的，这意味着它们的值可以取决于按钮的状态。



## Context

## 背景


Rather than try and evolve the existing button classes and their theme
in-place, we have introduced new replacement button widgets and
themes. In addition to freeing us from the backwards compatibility
labyrinth that evolving the existing classes in-place would entail,
the new names sync Flutter back up with the Material Design spec,
which uses the new names for the button components.

我们没有尝试就地改进现有按钮类及其主题，而是引入了新的替换按钮 widgets 和主题。除了将我们从就地发展现有类所带来的向后兼容性迷宫中解放出来之外，新名称还与 Material Design 规范同步，该规范使用按钮组件的新名称。


| <t>Old Widget</t><t>旧 Widget</t> | <t>Old Theme</t><t>旧主题</t> | <t>New Widget</t><t>新Widget</t> | <t>New Theme</t><t>新主题</t> |
|-----------------|---------------|------------------|-----------------------|
| `FlatButton`    | `ButtonTheme` | `TextButton`     | `TextButtonTheme`     |
| `RaisedButton`  | `ButtonTheme` | `ElevatedButton` | `ElevatedButtonTheme` |
| `OutlineButton` | `ButtonTheme` | `OutlinedButton` | `OutlinedButtonTheme` |

{:.table .table-striped .nowrap}

The new themes follow the "normalized" pattern that Flutter adopted
for new Material widgets about a year ago. Theme properties and widget
constructor parameters are null by default. Non-null theme properties
and widget parameters specify an override of the component's default
value. Implementing and documenting default values is the sole
responsibility of the button component widgets. The defaults
themselves are based primarily on the overall Theme's colorScheme and
textTheme.

新主题遵循大约一年前 Flutter 为新材质 widgets 采用的“标准化”模式。主题属性和 widget 构造函数参数默认为 null。非空主题属性和 widget 参数指定组件默认值的覆盖。实现和记录默认值是按钮组件 widgets 的唯一责任。默认值本身主要基于整个主题的 colorScheme 和 textTheme。


Visually, the new buttons look a little different, because they match
the current Material Design spec and because their colors are
configured in terms of the overall Theme's ColorScheme. There are
other small differences in padding, rounded corner radii, and the
hover/focus/pressed feedback.

从视觉上看，新按钮看起来有点不同，因为它们符合当前的 Material Design 规范，并且它们的颜色是根据整体主题的 ColorScheme 配置的。在填充、圆角半径和悬停/焦点/按下反馈方面还存在其他细微差别。


Many applications will be able to just substitute the new class names
for the old ones. Apps with golden image tests or with buttons whose
appearance has been configured with constructor parameters or with the
original `ButtonTheme` may need to consult the migration guide and the
introductory material that follows.

许多应用程序只需用新的类名替换旧的类名即可。具有黄金图像测试或外观已使用构造函数参数或原始 `ButtonTheme` 配置的按钮的应用程序可能需要查阅迁移指南和随后的介绍性材料。


## API Change: ButtonStyle instead of individual style properties

## API 更改：ButtonStyle 而不是单独的样式属性


Except for simple use cases, the APIs of the new button classes are
not compatible with the old classes. The visual attributes of the new
buttons and themes are configured with a single `ButtonStyle` object,
similar to how a `TextField` or a `Text` widget can be configured with a
`TextStyle` object. Most of the `ButtonStyle` properties are defined with
`MaterialStateProperty`, so that a single property can represent
different values depending on the button's pressed/focused/hovered/etc
state.

除了简单的用例之外，新按钮类的 API 与旧类不兼容。新按钮和主题的视觉属性使用单个 `ButtonStyle` 对象进行配置，类似于使用 `TextStyle` 对象配置 `TextField` 或 `Text` widget 的方式。大多数 `ButtonStyle` 属性都是用 `MaterialStateProperty` 定义的，因此单个属性可以根据按钮的按下/聚焦/悬停等状态表示不同的值。


A button's `ButtonStyle` doesn't define the button's visual properties,
it defines overrides of the buttons default visual properties,
where the default properties are computed by the button widget
itself. For example, to override a `TextButton`'s default foreground
(text/icon) color for all states, one could write:

按钮的 `ButtonStyle` 不定义按钮的视觉属性，它定义按钮默认视觉属性的覆盖，其中默认属性由按钮 widget 本身计算。例如，要覆盖 `TextButton` 的所有状态的默认前景色（文本/图标）颜色，可以编写：


```dart
TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
  ),
  onPressed: () { },
  child: Text('TextButton'),
)
```

This kind of override is common; however, in many cases what's also
needed are overrides for the overlay colors that the text button uses
to indicate its hovered/focus/pressed state.  This can be done by
adding the `overlayColor` property to the `ButtonStyle`.

这种覆盖很常见；然而，在许多情况下，还需要覆盖文本按钮用于指示其悬停/焦点/按下状态的覆盖颜色。  这可以通过将 `overlayColor` 属性添加到 `ButtonStyle` 来完成。


```dart
TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.hovered))
          return Colors.blue.withOpacity(0.04);
        if (states.contains(MaterialState.focused) ||
            states.contains(MaterialState.pressed))
          return Colors.blue.withOpacity(0.12);
        return null; // Defer to the widget's default.
      },
    ),
  ),
  onPressed: () { },
  child: Text('TextButton')
)
```

A color `MaterialStateProperty` only needs to return a value for the
colors whose default should be overridden. If it returns null, the
widget's default will be used instead. For example, to just override
the text button's focus overlay color:

颜色 `MaterialStateProperty` 只需要返回应覆盖其默认值的颜色值。如果它返回 null，则将使用 widget 的默认值。例如，要覆盖文本按钮的焦点覆盖颜色：


```dart
TextButton(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused))
          return Colors.red;
        return null; // Defer to the widget's default.
      }
    ),
  ),
  onPressed: () { },
  child: Text('TextButton'),
)
```

### The `styleFrom()` ButtonStyle utility methods

### `styleFrom()` ButtonStyle 实用方法


The Material Design spec defines buttons' foreground and overlay colors in
terms of the color scheme's primary color. The primary color is
rendered at different opacities, depending on the button's state. To
simplify creating a button style that includes all of the properties
that depend on color scheme colors, each button class includes a
static styleFrom() method which constructs a `ButtonStyle` from a simple
set of values, including the `ColorScheme` colors it depends on.

Material Design 规范根据配色方案的主色定义了按钮的前景色和覆盖层颜色。主要颜色以不同的不透明度呈现，具体取决于按钮的状态。为了简化创建包含依赖于配色方案颜色的所有属性的按钮样式，每个按钮类都包含一个静态 styleFrom() 方法，该方法从一组简单的值构造 `ButtonStyle` ，包括它所依赖的 `ColorScheme` 颜色。


This example creates a button that overrides its foreground color, as
well as its overlay color, using the specified primary color and the
opacities from the Material Design spec.

此示例创建一个按钮，该按钮使用 Material Design 规范中指定的主色和不透明度来覆盖其前景色及其覆盖颜色。


```dart
TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.blue,
  ),
  onPressed: () { },
  child: Text('TextButton'),
)
```

The `TextButton` documentation indicates that the foreground color when
the button is disabled is based on the color scheme's `disabledForegroundColor`
color. To override that as well, using styleFrom():

`TextButton` 文档表明禁用按钮时的前景色基于颜色方案的 `disabledForegroundColor` 颜色。要覆盖它，也可以使用 styleFrom()：


```dart
TextButton(
  style: TextButton.styleFrom(
    foregroundColor: Colors.blue,
    disabledForegroundColor: Colors.red,
  ),
  onPressed: null,
  child: Text('TextButton'),
)
```

Using the `styleFrom()` method is the preferred way to create a
`ButtonStyle` if you're trying to create a Material Design
variation. The most flexible approach is defining a `ButtonStyle`
directly, with `MaterialStateProperty` values for the states whose
appearance you want to override.

如果你尝试创建 Material Design 变体，则使用 `styleFrom()` 方法是创建 `ButtonStyle` 的首选方法。最灵活的方法是直接定义 `ButtonStyle` ，并为要覆盖其外观的状态使用 `MaterialStateProperty` 值。


## ButtonStyle defaults

## 按钮样式默认值


Widgets like the new button classes _compute_ their default values
based on the overall theme's `colorScheme` and `textTheme` as well as
button's current state. In a few cases they also consider if the
overall theme's color scheme is light or dark.  Each button has a
protected method that computes its default style as needed. Although
apps won't call this method directly, its API doc explains what all
of the defaults are.  When a button or button theme specifies
`ButtonStyle`, only the button style's non-null properties override the
computed defaults. The button's `style` parameter overrides non-null
properties specified by the corresponding button theme. For example if
`foregroundColor` property of a `TextButton`'s style is non-null, it
overrides the same property for the `TextButtonTheme`'s style.

Widgets 喜欢新的按钮类，根据整个主题的 `colorScheme` 和 `textTheme` 以及按钮的当前状态_计算_它们的默认值。在某些情况下，他们还会考虑整体主题的配色方案是浅色还是深色。  每个按钮都有一个受保护的方法，可以根据需要计算其默认样式。尽管应用程序不会直接调用此方法，但其 API 文档解释了所有默认值。  当按钮或按钮主题指定 `ButtonStyle` 时，只有按钮样式的非空属性会覆盖计算的默认值。按钮的 `style` 参数会覆盖相应按钮主题指定的非空属性。例如，如果 `TextButton` 样式的 `foregroundColor` 属性非空，它将覆盖 `TextButtonTheme` 样式的相同属性。


As explained earlier, each button class includes a static method
called `styleFrom` which constructs a ButtonStyle from a simple set of
values, including the `ColorScheme` colors it depends on. In many common
cases, using `styleFrom` to create a one-off `ButtonStyle` that
overrides the defaults, is simplest. This is particularly true when
the custom style's objective is to override one of the color scheme
colors, like `primary` or `onPrimary` that the default style depends
on.  For other cases you can create a `ButtonStyle` object
directly. Doing so enables you to control the value of visual
properties, like colors, for all of the button's possible states -
like pressed, hovered, disabled, and focused.

如前所述，每个按钮类都包含一个名为 `styleFrom` 的静态方法，该方法从一组简单的值构造 ButtonStyle，包括它所依赖的 `ColorScheme` 颜色。在许多常见情况下，使用 `styleFrom` 创建覆盖默认值的一次性 `ButtonStyle` 是最简单的。当自定义样式的目标是覆盖其中一种配色方案颜色时尤其如此，例如默认样式所依赖的 `primary` 或 `onPrimary` 。  对于其他情况，你可以直接创建 `ButtonStyle` 对象。这样做使你能够控制按钮所有可能状态（如按下、悬停、禁用和聚焦）的视觉属性（如颜色）的值。



## Migration guide

## 迁移指南


Use the following information to migrate your buttons to the
new API.

使用以下信息将按钮迁移到新 API。


### Restoring the original button visuals

### 恢复原始按钮视觉效果


In many cases it's possible to just switch from the old button class
to the new one.  That's assuming that the small changes in size/shape
and the likely bigger change in colors, aren't a concern.

在许多情况下，可以从旧的按钮类切换到新的按钮类。  假设尺寸/形状的微小变化和颜色可能较大的变化都不是问题。


To preserve the original buttons' appearance in these cases, one can
define button styles that match the original as closely as you
like. For example, the following style makes a `TextButton` look
like a default `FlatButton`:

为了在这些情况下保留原始按钮的外观，可以定义与原始按钮尽可能匹配的按钮样式。例如，以下样式使 `TextButton` 看起来像默认的 `FlatButton`：


```dart
final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);

TextButton(
  style: flatButtonStyle,
  onPressed: () { },
  child: Text('Looks like a FlatButton'),
)
```

Similarly, to make an `ElevatedButton` look like a default `RaisedButton`:

同样，要使 `ElevatedButton` 看起来像默认的 `RaisedButton`：


```dart
final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  foregroundColor: Colors.black87,
  backgroundColor: Colors.grey[300],
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
);
ElevatedButton(
  style: raisedButtonStyle,
  onPressed: () { },
  child: Text('Looks like a RaisedButton'),
)
```

The `OutlineButton` style for `OutlinedButton` is a little more
complicated because the outline's color changes to the primary color
when the button is pressed. The outline's appearance is defined by a
`BorderSide` and you'll use a `MaterialStateProperty` to define the pressed
outline color:

`OutlinedButton` 的 `OutlineButton` 样式稍微复杂一些，因为按下按钮时轮廓的颜色会更改为主要颜色。轮廓的外观由 `BorderSide` 定义，你将使用 `MaterialStateProperty` 定义按下的轮廓颜色：


```dart
final ButtonStyle outlineButtonStyle = OutlinedButton.styleFrom(
  foregroundColor: Colors.black87,
  minimumSize: Size(88, 36),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(2)),
  ),
).copyWith(
  side: MaterialStateProperty.resolveWith<BorderSide?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed)) {
        return BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        );
      }
      return null;
    },
  ),
);

OutlinedButton(
  style: outlineButtonStyle,
  onPressed: () { },
  child: Text('Looks like an OutlineButton'),
)
```

To restore the default appearance for buttons throughout an
application, you can configure the new button themes in the
application's theme:

要恢复整个应用程序中按钮的默认外观，你可以在应用程序的主题中配置新的按钮主题：


```dart
MaterialApp(
  theme: ThemeData.from(colorScheme: ColorScheme.light()).copyWith(
    textButtonTheme: TextButtonThemeData(style: flatButtonStyle),
    elevatedButtonTheme: ElevatedButtonThemeData(style: raisedButtonStyle),
    outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  ),
)
```

To restore the default appearance for buttons in part of an
application you can wrap a widget subtree with `TextButtonTheme`,
`ElevatedButtonTheme`, or `OutlinedButtonTheme`. For example:

要恢复应用程序部分按钮的默认外观，你可以使用 `TextButtonTheme`、`ElevatedButtonTheme` 或 `OutlinedButtonTheme` 包装 widget 子树。例如：


```dart
TextButtonTheme(
  data: TextButtonThemeData(style: flatButtonStyle),
  child: myWidgetSubtree,
)
```

### Migrating buttons with custom colors

### 迁移具有自定义颜色的按钮


The following sections cover use of the following `FlatButton`,
`RaisedButton`, and `OutlineButton` color parameters:

以下各节介绍以下 `FlatButton`、`RaisedButton` 和 `OutlineButton` 颜色参数的使用：


```dart
textColor
disabledTextColor
color
disabledColor
focusColor
hoverColor
highlightColor*
splashColor
```

The new button classes do not support a separate highlight color
because it's no longer part of the Material Design.

新的按钮类不支持单独的突出显示颜色，因为它不再是 Material Design 的一部分。


#### Migrating buttons with custom foreground and background colors

#### 迁移具有自定义前景色和背景色的按钮


Two common customizations for the original button classes are a custom
foreground color for `FlatButton`, or custom foreground and background
colors for `RaisedButton`.  Producing the same result with the new
button classes is simple:

原始按钮类的两个常见自定义是 `FlatButton` 的自定义前景色，或 `RaisedButton` 的自定义前景色和背景色。  使用新按钮类产生相同的结果很简单：


```dart
FlatButton(
  textColor: Colors.red, // foreground
  onPressed: () { },
  child: Text('FlatButton with custom foreground/background'),
)

TextButton(
  style: TextButton.styleFrom(
    foregroundColor Colors.red,
  ),
  onPressed: () { },
  child: Text('TextButton with custom foreground'),
)
```

In this case the `TextButton`'s foreground (text/icon) color as well as
its hovered/focused/pressed overlay colors will be based on
`Colors.red`. By default, the `TextButton`'s background fill color is
transparent.

在这种情况下，`TextButton` 的前景色（文本/图标）及其悬停/聚焦/按下的覆盖颜色将基于 `Colors.red`。默认情况下，`TextButton` 的背景填充颜色是透明的。


Migrating a `RaisedButton` with custom foreground and background colors:

使用自定义前景色和背景色迁移 `RaisedButton`：


```dart
RaisedButton(
  color: Colors.red, // background
  textColor: Colors.white, // foreground
  onPressed: () { },
  child: Text('RaisedButton with custom foreground/background'),
)

ElevatedButton(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
  ),
  onPressed: () { },
  child: Text('ElevatedButton with custom foreground/background'),
)
```

In this case the button's use of the color scheme's primary color is
reversed relative to the `TextButton`: primary is button's background
fill color and `onPrimary` is the foreground (text/icon) color.

在这种情况下，按钮对配色方案主色的使用相对于 `TextButton` 是相反的：主色是按钮的背景填充颜色，`onPrimary` 是前景色（文本/图标）颜色。


#### Migrating buttons with custom overlay colors

#### 迁移具有自定义覆盖颜色的按钮


Overriding a button's default focused, hovered, highlighted, or splash
colors is less common. The `FlatButton`, `RaisedButton`, and `OutlineButton`
classes have individual parameters for these state-dependent
colors. The new `TextButton`, `ElevatedButton`, and `OutlinedButton` classes
use a single `MaterialStateProperty<Color>` parameter instead. The new
buttons allow one to specify state-dependent values for all of the
colors, the original buttons only supported specifying what's now
called the "overlayColor".

覆盖按钮的默认聚焦颜色、悬停颜色、突出显示颜色或初始颜色不太常见。 `FlatButton`、`RaisedButton` 和 `OutlineButton` 类具有针对这些状态相关颜色的单独参数。新的 `TextButton`、`ElevatedButton` 和 `OutlinedButton` 类改为使用单个 `MaterialStateProperty<Color>` 参数。新按钮允许为所有颜色指定与状态相关的值，原始按钮仅支持指定现在所谓的“overlayColor”。


```dart
FlatButton(
  focusColor: Colors.red,
  hoverColor: Colors.green,
  splashColor: Colors.blue,
  onPressed: () { },
  child: Text('FlatButton with custom overlay colors'),
)

TextButton(
  style: ButtonStyle(
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.focused))
          return Colors.red;
        if (states.contains(MaterialState.hovered))
            return Colors.green;
        if (states.contains(MaterialState.pressed))
            return Colors.blue;
        return null; // Defer to the widget's default.
    }),
  ),
  onPressed: () { },
  child: Text('TextButton with custom overlay colors'),
)
```

The new version is more flexible although less compact. In the
original version, the precedence of the different states is
implicit (and undocumented) and fixed, in the new version, it's
explicit.  For an app that specified these colors frequently, the
easiest migration path would be to define one or more `ButtonStyles`
that match the example above - and just use the style parameter - or
to define a stateless wrapper widget that encapsulated the three color
parameters.

新版本更加灵活，但不太紧凑。在原始版本中，不同状态的优先级是隐式的（且未记录）和固定的，在新版本中，它是显式的。  对于经常指定这些颜色的应用程序，最简单的迁移路径是定义一个或多个与上面的示例匹配的 `ButtonStyles` - 并且仅使用 style 参数 - 或定义一个封装三个颜色参数的无状态包装器 widget 。


#### Migrating buttons with custom disabled colors

#### 迁移具有自定义禁用颜色的按钮


This is a relatively rare customization.  The `FlatButton`,
`RaisedButton`, and `OutlineButton` classes have `disabledTextColor` and
`disabledColor` parameters that define the background and foreground
colors when the button's `onPressed` callback is null.

这是比较少见的定制。  `FlatButton`、`RaisedButton` 和 `OutlineButton` 类具有 `disabledTextColor` 和 `disabledColor` 参数，用于定义当按钮的 `onPressed` 回调为 null 时的背景和前景色。


By default, all of the buttons use the color scheme's `disabledForegroundColor`
color, with opacity 0.38 for the disabled foreground color. Only
`ElevatedButton` has a non-transparent background color and its default
value is the `disabledForegroundColor` color with opacity 0.12. So in many cases
one can just use the `styleFrom` method to override the disabled colors:

默认情况下，所有按钮都使用配色方案的 `disabledForegroundColor` 颜色，禁用前景色的不透明度为 0.38。只有 `ElevatedButton` 具有不透明背景颜色，其默认值为 `disabledForegroundColor` 颜色，不透明度为 0.12。因此，在许多情况下，我们可以使用 `styleFrom` 方法来覆盖禁用的颜色：


```dart
RaisedButton(
  disabledColor: Colors.red.withOpacity(0.12),
  disabledTextColor: Colors.red.withOpacity(0.38),
  onPressed: null,
  child: Text('RaisedButton with custom disabled colors'),
),

ElevatedButton(
  style: ElevatedButton.styleFrom(disabledForegroundColor: Colors.red),
  onPressed: null,
  child: Text('ElevatedButton with custom disabled colors'),
)
```

For complete control over the disabled colors, one must define the
`ElevatedButton`'s style explicitly, in terms of
`MaterialStateProperties`:

为了完全控制禁用的颜色，必须根据 `MaterialStateProperties` 明确定义 `ElevatedButton` 的样式：


```dart
RaisedButton(
  disabledColor: Colors.red,
  disabledTextColor: Colors.blue,
  onPressed: null,
  child: Text('RaisedButton with custom disabled colors'),
)

ElevatedButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return Colors.red;
        return null; // Defer to the widget's default.
    }),
    foregroundColor: MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled))
          return Colors.blue;
        return null; // Defer to the widget's default.
    }),
  ),
  onPressed: null,
  child: Text('ElevatedButton with custom disabled colors'),
)
```

As with the previous case, there are obvious ways to make the new
version more compact in an app where this migration comes up often.

与之前的情况一样，在经常出现这种迁移的应用程序中，有明显的方法可以使新版本更加紧凑​​。


#### Migrating buttons with custom elevations

#### 具有自定义标高的迁移按钮


This is also a relatively rare customization. Typically, only
`ElevatedButton`s (originally called `RaisedButtons`)
include elevation changes. For elevations that are proportional
to a baseline elevation (per the Material Design specification),
one can override all of them quite simply.

这也是比较少见的定制。通常，只有 `ElevatedButton`s（最初称为 `RaisedButtons`）包含海拔变化。对于与基线高程成比例的高程（根据材料设计规范），可以非常简单地覆盖所有它们。


By default, a disabled button's elevation is 0, and the remaining
states are defined relative to a baseline of 2:

默认情况下，禁用按钮的高度为 0，其余状态是相对于基线 2 定义的：


```dart
disabled: 0
hovered or focused: baseline + 2
pressed: baseline + 6
```

So to migrate a `RaisedButton` for which all elevations have been
defined:

因此，要迁移已定义所有高程的 `RaisedButton`：


```dart
RaisedButton(
  elevation: 2,
  focusElevation: 4,
  hoverElevation: 4,
  highlightElevation: 8,
  disabledElevation: 0,
  onPressed: () { },
  child: Text('RaisedButton with custom elevations'),
)

ElevatedButton(
  style: ElevatedButton.styleFrom(elevation: 2),
  onPressed: () { },
  child: Text('ElevatedButton with custom elevations'),
)
```

To arbitrarily override just one elevation, like the pressed
elevation:

要任意覆盖一个高度，例如按下的高度：


```dart
RaisedButton(
  highlightElevation: 16,
  onPressed: () { },
  child: Text('RaisedButton with a custom elevation'),
)

ElevatedButton(
  style: ButtonStyle(
    elevation: MaterialStateProperty.resolveWith<double?>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed))
          return 16;
        return null;
      }),
  ),
  onPressed: () { },
  child: Text('ElevatedButton with a custom elevation'),
)
```

#### Migrating buttons with custom shapes and borders

#### 迁移具有自定义形状和边框的按钮


The original `FlatButton`, `RaisedButton`, and `OutlineButton` classes all
provide a shape parameter which defines both the button's shape and
the appearance of its outline. The corresponding new classes and their
themes support specifying the button's shape and its border
separately, with `OutlinedBorder shape` and `BorderSide side` parameters.

原始的 `FlatButton`、`RaisedButton` 和 `OutlineButton` 类都提供了一个形状参数，用于定义按钮的形状及其轮廓的外观。相应的新类及其主题支持使用 `OutlinedBorder shape` 和 `BorderSide side` 参数分别指定按钮的形状及其边框。


In this example the original `OutlineButton` version specifies the same
color for border in its highlighted (pressed) state as for other
states.

在此示例中，原始 `OutlineButton` 版本指定突出显示（按下）状态下的边框颜色与其他状态相同。


```dart
OutlineButton(
  shape: StadiumBorder(),
  highlightedBorderColor: Colors.red,
  borderSide: BorderSide(
    width: 2,
    color: Colors.red
  ),
  onPressed: () { },
  child: Text('OutlineButton with custom shape and border'),
)

OutlinedButton(
  style: OutlinedButton.styleFrom(
    shape: StadiumBorder(),
    side: BorderSide(
      width: 2,
      color: Colors.red
    ),
  ),
  onPressed: () { },
  child: Text('OutlinedButton with custom shape and border'),
)
```

Most of the new `OutlinedButton` widget's style parameters, including
its shape and border, can be specified with `MaterialStateProperty`
values, which is to say that they can have different values depending
on the button's state. To specify a different border color when the
button is pressed, do the following:

大多数新的 `OutlinedButton` widget 的样式参数，包括其形状和边框，都可以使用 `MaterialStateProperty` 值指定，也就是说，根据按钮的状态，它们可以具有不同的值。要在按下按钮时指定不同的边框颜色，请执行以下操作：


```dart
OutlineButton(
  shape: StadiumBorder(),
  highlightedBorderColor: Colors.blue,
  borderSide: BorderSide(
    width: 2,
    color: Colors.red
  ),
  onPressed: () { },
  child: Text('OutlineButton with custom shape and border'),
)

OutlinedButton(
  style: ButtonStyle(
    shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
    side: MaterialStateProperty.resolveWith<BorderSide>(
      (Set<MaterialState> states) {
        final Color color = states.contains(MaterialState.pressed)
          ? Colors.blue
          : Colors.red;
        return BorderSide(color: color, width: 2);
      }
    ),
  ),
  onPressed: () { },
  child: Text('OutlinedButton with custom shape and border'),
)
```

## Timeline

## 时间线


Landed in version: 1.20.0-0.0.pre<br>
登陆版本：1.20.0-0.0.pre
In stable release: 2.0.0
稳定版本：2.0.0

## References

## 参考资料


API documentation:

API 文档：


* [`ButtonStyle`][]
* [`ButtonStyleButton`][]
* [`ElevatedButton`][]
* [`ElevatedButtonTheme`][]
* [`ElevatedButtonThemeData`][]
* [`OutlinedButton`][]
* [`OutlinedButtonTheme`][]
* [`OutlinedButtonThemeData`][]
* [`TextButton`][]
* [`TextButtonTheme`][]
* [`TextButtonThemeData`][]

Relevant PRs:

相关 PR：


* [PR 59702: New Button Universe][]

  [PR 59702：新按钮宇宙][PR 59702: New Button Universe]

* [PR 73352: Deprecated obsolete Material classes: FlatButton, RaisedButton, OutlineButton][]

  [PR 73352：已弃用的过时材质类：FlatButton、RaisingButton、OutlineButton][PR 73352: Deprecated obsolete Material classes: FlatButton, RaisedButton, OutlineButton]



[`ButtonStyle`]: {{site.api}}/flutter/material/ButtonStyle-class.html
[`ButtonStyleButton`]: {{site.api}}/flutter/material/ButtonStyleButton-class.html
[`ElevatedButton`]: {{site.api}}/flutter/material/ElevatedButton-class.html
[`ElevatedButtonTheme`]: {{site.api}}/flutter/material/ElevatedButtonTheme-class.html
[`ElevatedButtonThemeData`]: {{site.api}}/flutter/material/ElevatedButtonThemeData-class.html
[`OutlinedButton`]: {{site.api}}/flutter/material/OutlinedButton-class.html
[`OutlinedButtonTheme`]: {{site.api}}/flutter/material/OutlinedButtonTheme-class.html
[`OutlinedButtonThemeData`]: {{site.api}}/flutter/material/OutlinedButtonThemeData-class.html
[`TextButton`]: {{site.api}}/flutter/material/TextButton-class.html
[`TextButtonTheme`]: {{site.api}}/flutter/material/TextButtonTheme-class.html
[`TextButtonThemeData`]: {{site.api}}/flutter/material/TextButtonThemeData-class.html

[PR 59702: New Button Universe]: {{site.repo.flutter}}/pull/59702
[PR 73352: Deprecated obsolete Material classes: FlatButton, RaisedButton, OutlineButton]: {{site.repo.flutter}}/pull/73352
