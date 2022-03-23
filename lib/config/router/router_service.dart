import 'package:flutter/material.dart';
import 'package:base_web_landing/core/navigator/navigator.dart';
import 'package:go_router/go_router.dart';

class JRouterService with INavigatorMixin implements INavigator {
  JRouterService(this._router);

  final GoRouter _router;

  /// Global way to call the navigator instance
  /// this method save the context to avoid use multiple context call
  /// Ex: IConfigNavigatorMixinInstance.of(context).pop()
  static INavigator of(BuildContext context) {
    final inherited =
        context.dependOnInheritedWidgetOfExactType<InheritedNavigator>();
    assert(inherited != null, 'No Navigator found in context');
    return inherited!.navigationService(context);
  }

  @override
  Future<void> go(String location, {PageRouteInfo? extra}) async {
    _router.go(location, extra: extra?.extra);
  }

  @override
  Future<void> goNamed(String name, {PageRouteInfo? extra}) async {
    _router.goNamed(
      name,
      params: extra?.params ?? <String, String>{},
      queryParams: extra?.queryParams ?? <String, String>{},
      extra: extra?.extra,
    );
  }

  @override
  bool canPop() {
    if (context != null) {
      return Navigator.canPop(context!);
    }

    return false;
  }

  @override
  void pop() {
    _router.pop();
  }

  @override
  void popUntilRoot() {
    if (canPop()) {
      Navigator.popUntil(context!, (Route<dynamic> route) => route.isFirst);
    }
  }

  @override
  Future<void> push(String location, {PageRouteInfo? extra}) async {
    _router.go(location, extra: extra?.extra);
  }

  @override
  Future<void> pushNamed(String name, {PageRouteInfo? extra}) async {
    _router.pushNamed(
      name,
      params: extra?.params ?? <String, String>{},
      queryParams: extra?.queryParams ?? <String, String>{},
      extra: extra?.extra,
    );
  }
}
