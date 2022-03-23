/// {@template page_route_info}
///
/// Class to send to the new route some useful information.
///
/// {@endtemplate}
class PageRouteInfo {
  /// Default constructor for the PageRouteInfo.
  PageRouteInfo({
    this.params = const <String, String>{},
    this.queryParams = const <String, String>{},
    this.extra,
  });

  /// `Params` for the new route
  final Map<String, String> params;

  /// `QueryParams` for the new route
  final Map<String, String> queryParams;

  /// `Extra` other values for the navigator
  final Object? extra;
}
