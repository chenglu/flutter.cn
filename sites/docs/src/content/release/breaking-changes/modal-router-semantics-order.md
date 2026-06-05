---
# title: Semantics Order of the Overlay Entries in Modal Routes
title: 模态路由中覆盖条目的语义顺序
# description: >
#   The scope of the modal route has a higher semantics
#   traverse order than its modal barrier.
description: >
  模态路线的范围比其模态障碍具有更高的语义遍历顺序。
ai-translated: true
---

{% render "docs/breaking-changes.md" %}


## Summary

## 摘要


We changed the semantics traverse order of the overlay entries in modal routes.
Accessibility talk back or voice over now focuses the scope of a modal route
first instead of its modal barrier.

我们更改了模态路由中覆盖条目的语义遍历顺序。辅助功能对讲或旁白现在首先关注模态路线的范围，而不是其模态障碍。


## Context

## 背景


The modal route has two overlay entries, the scope and the modal barrier. The
scope is the actual content of the modal route, and the modal barrier is the
background of the route if its scope does not cover the entire screen. If the
modal route returns true for `barrierDismissible`, the modal barrier becomes
accessibility focusable because users can tap the modal barrier to pop the
modal route. This change specifically made the accessibility to focus the scope
first before the modal barrier.

模态路线有两个覆盖条目：范围和模态障碍。范围是模态路线的实际内容，如果模态屏障的范围没有覆盖整个屏幕，则模态屏障是路线的背景。如果模态路线为“barrierDismissible”返回 true，则模态屏障将变为可访问性焦点，因为用户可以点击模态屏障来弹出模态路线。这一变化特别使可访问性在模式障碍之前首先关注范围。


## Description of change

## 变更说明


We added additional semantics node above both
the overlay entries of modal routes.
Those semantics nodes denote the semantics
traverse order of these two overlay entries.
This also changed the structure of semantics tree.

我们在模态路由的两个覆盖条目之上添加了额外的语义节点。这些语义节点表示这两个覆盖条目的语义遍历顺序。这也改变了语义树的结构。


## Migration guide

## 迁移指南


If your tests start failing due to semantics tree changes after the update,
you can migrate your code by expecting a new node on above of the modal route
overlay entries.

如果你的测试由于更新后语义树发生更改而开始失败，你可以通过在模态路由覆盖条目上方等待新节点来迁移代码。


Code before migration:

迁移前的代码：


```dart
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('example test', (WidgetTester tester) async {
    final SemanticsHandle handle =
        tester.binding.pipelineOwner.ensureSemantics();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('test'))));

    final SemanticsNode root =
        tester.binding.pipelineOwner.semanticsOwner.rootSemanticsNode;

    final SemanticsNode firstNode = getChild(root);
    expect(firstNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));

    // Fixes the test by expecting an additional node above the scope route.
    final SemanticsNode secondNode = getChild(firstNode);
    expect(secondNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));

    final SemanticsNode thirdNode = getChild(secondNode);
    expect(thirdNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));
    expect(thirdNode.hasFlag(SemanticsFlag.scopesRoute), true);

    final SemanticsNode forthNode = getChild(thirdNode);
    expect(forthNode.rect, Rect.fromLTRB(0.0, 0.0, 56.0, 14.0));
    expect(forthNode.label, 'test');
    handle.dispose();
  });
}

SemanticsNode getChild(SemanticsNode node) {
  SemanticsNode child;
  bool visitor(SemanticsNode target) {
    child = target;
    return false;
  }

  node.visitChildren(visitor);
  return child;
}
```

Code after migration:

迁移后的代码：


```dart
import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('example test', (WidgetTester tester) async {
    final SemanticsHandle handle =
        tester.binding.pipelineOwner.ensureSemantics();

    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text('test'))));

    final SemanticsNode root =
        tester.binding.pipelineOwner.semanticsOwner.rootSemanticsNode;

    final SemanticsNode firstNode = getChild(root);
    expect(firstNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));

    // Fixes the test by expecting an additional node above the scope route.
    final SemanticsNode secondNode = getChild(firstNode);
    expect(secondNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));

    final SemanticsNode thirdNode = getChild(secondNode);
    expect(thirdNode.rect, Rect.fromLTRB(0.0, 0.0, 800.0, 600.0));
    expect(thirdNode.hasFlag(SemanticsFlag.scopesRoute), true);

    final SemanticsNode forthNode = getChild(thirdNode);
    expect(forthNode.rect, Rect.fromLTRB(0.0, 0.0, 56.0, 14.0));
    expect(forthNode.label, 'test');
    handle.dispose();
  });
}

SemanticsNode getChild(SemanticsNode node) {
  SemanticsNode child;
  bool visitor(SemanticsNode target) {
    child = target;
    return false;
  }

  node.visitChildren(visitor);
  return child;
}
```

## Timeline

## 时间轴


Landed in version: 1.19.0<br>
In stable release: 1.20

登陆版本：1.19.0<br>稳定版本：1.20


## References

## 参考


API documentation:

API 文档：


* [`ModalRoute`][]


* [`OverlayEntry`][]


Relevant issue:

相关问题：


* [Issue 46625][]

  [问题 46625][Issue 46625]


Relevant PR:

相关公关：


* [PR 59290][]

  [PR 59290][]


[`ModalRoute`]: {{site.api}}/flutter/widgets/ModalRoute-class.html
[`OverlayEntry`]: {{site.api}}/flutter/widgets/OverlayEntry-class.html
[Issue 46625]: {{site.repo.flutter}}/issues/46625
[PR 59290]: {{site.repo.flutter}}/pull/59290
