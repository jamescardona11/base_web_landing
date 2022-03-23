import 'package:flutter/material.dart';

/// [IConfigNavigator] implementation as interface to config the router
abstract class IConfigNavigator {
  /// Here is where the default routes and configuration is setup
  /// You could override the `value` for:
  /// `_routeInformationParser` and `_routerDelegate`
  void initConfiguration();

  /// Is used for navigator 2.0 to create the route strategy
  RouteInformationParser<Object>? get routeInformationParser;

  /// Is used for navigator 2.0 to create the route strategy
  RouterDelegate<Object>? get routerDelegate;
}
