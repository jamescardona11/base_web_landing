import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/index/index_page.dart';
import 'package:base_web_landing/core/navigator/navigator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'routes.dart';

/// {@template exarouter_config}
///
/// Class to implements the navigator configuration and set routes
///
/// {@endtemplate}

class JRouterConfiguration implements IConfigNavigator {
  /// Default constructor for the NavigationService.
  JRouterConfiguration() {
    initConfiguration();
  }

  late RouteInformationParser<Object> _routeInformationParser;
  late RouterDelegate<Object> _routerDelegate;

  /// Instance for GoRoute package used for the app
  /// Rememer initialize in `initConfiguration`
  late GoRouter _router;

  @override
  void initConfiguration() {
    _router = GoRouter(
      initialLocation: Routes.home,
      urlPathStrategy: UrlPathStrategy.path,
      debugLogDiagnostics: true,
      navigatorBuilder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: Routes.def,

          builder: (context, state) {
            Provider.of<IndexPageProvider>(context, listen: false)
                .updateScrollController(state.params['page']!);

            return IndexPage(
              key: state.pageKey,
              page: state.params['page']!,
            );
          },
          // routes: [
          //   GoRoute(
          //     path: Routes.home,
          //     builder: (context, state) => AboutView(),
          //   ),
          // ],
        ),
      ],
      errorPageBuilder: (context, state) => MaterialPage<void>(
        key: state.pageKey,
        child: const Scaffold(
          body: SizedBox(
            child: Text('ERROROR'),
          ),
        ),
      ),
    );

    _routeInformationParser = _router.routeInformationParser;
    _routerDelegate = _router.routerDelegate;
  }

  @override
  RouteInformationParser<Object> get routeInformationParser =>
      _routeInformationParser;

  @override
  RouterDelegate<Object> get routerDelegate => _routerDelegate;

  GoRouter get router => _router;
}
