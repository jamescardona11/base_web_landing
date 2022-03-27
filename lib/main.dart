import 'package:argo/argo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/presenter/page_provider.dart';
import 'config/router/router.dart';
import 'config/theme/theme.dart';
import 'core/navigator/navigator.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => PageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final exaRouter = JRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routeInformationParser: exaRouter.routeInformationParser,
      routerDelegate: exaRouter.routerDelegate,
      builder: (_, child) => ResponsiveWrapper(
        wrapConfig: _wrapConfig,
        responsiveTheme: _responsiveTheme,
        child: NavigationWrapper(
          navigationService: exaRouter.router,
          child: child!,
        ),
      ),
    );
  }
}

final _wrapConfig = WrapperConfig(
  globalBreakpoints: ScreenBreakpoints.values(
    mobile: const SBValue.max(700),
    tablet: const SBValue.max(1200),
    desktop: const SBValue.inf(),
  ),
);

final _responsiveTheme = ResponsiveTheme.screen(
  conditionScreen: ConditionScreen(
    mobile: AppTheme(),
    tablet: AppTheme(),
    desktop: WebTheme(),
  ),
);
