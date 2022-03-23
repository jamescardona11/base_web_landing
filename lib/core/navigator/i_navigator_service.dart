import 'package:flutter/material.dart';

import 'page_route_info.dart';

/// [INavigator] implementation as Mixin to handle context set and get
mixin INavigatorMixin implements INavigator {
  BuildContext? _context;

  @override
  set context(BuildContext? context) => _context = context;

  @override
  BuildContext? get context => _context;
}

/// Navigation abstraction to be used all around the application.
///
/// Whenever navigation is required it should be handled by depending on
/// [INavigator] interface, not on any of the possible implementations
abstract class INavigator {
  set context(BuildContext? context);

  /// Is used for navigatorInstance to avoid recall context multiple times
  BuildContext? get context;

  /// This method is used to navigate to the given location.
  /// This method remove the stack of routes and start a new stack
  Future<void> go(String location, {PageRouteInfo? extra});

  /// This method is used to navigate to the given name. (name strategy)
  /// This method remove the stack of routes and start a new stack
  Future<void> goNamed(String name, {PageRouteInfo? extra});

  /// This method is used to navigate to the given location.
  /// This method keep the previous route in the stack.
  Future<void> push(String location, {PageRouteInfo? extra});

  /// This method is used to navigate to the given name. (name strategy)
  /// This method keep the previous route in the stack.
  Future<void> pushNamed(String name, {PageRouteInfo? extra});

  /// This method is used to ask or ensure have a previous route in the stack
  bool canPop();

  /// This method is used to pop to the previous route
  void pop();

  /// This method is used to pop to the first route in the stack
  /// If the stack has changed the `route.isFirst` is changed automatically too
  void popUntilRoot();
}
