import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension NavigationExtension on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);
  NavigatorState get _rootNavigator => Navigator.of(this, rootNavigator: true);

  void push(Widget page) {
    _navigator.push(CupertinoPageRoute(builder: (context) => page));
  }

  void pushToRoot(Widget page) {
    _rootNavigator.push(CupertinoPageRoute(builder: (context) => page));
  }

  void pushAndClear(Widget page) {
    _rootNavigator.pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  bool canPop() => _navigator.canPop();

  void pop() => _navigator.pop();
}

extension ScreenExtension on BuildContext {
  String getErrorMessage(Object error) {
    if (error is String) {
      return error;
    } else {
      return 'Something went wrong, please try again later';
    }
  }

  void showError(Object error) {
    final message = getErrorMessage(error);
    final messenger = ScaffoldMessenger.of(this);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: max(1000, message.length * 50)),
    ));
  }
}
