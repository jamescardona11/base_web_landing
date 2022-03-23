import 'package:base_web_landing/core/navigator/navigator.dart';
import 'package:flutter/material.dart';

import 'router_config.dart';
import 'router_service.dart';

class JRouter {
  JRouter() {
    final tempConfig = JRouterConfiguration();
    _config = tempConfig;
    _router = JRouterService(tempConfig.router);
  }

  late IConfigNavigator _config;
  late INavigator _router;

  INavigator get router => _router;

  RouteInformationParser<Object> get routeInformationParser =>
      _config.routeInformationParser!;

  RouterDelegate<Object> get routerDelegate => _config.routerDelegate!;
}
