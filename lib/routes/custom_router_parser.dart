import 'package:flutter/material.dart';
import 'package:navigator_2_0/routes/route_path.dart';

class CustomRouterParser extends RouteInformationParser<CustomRoutePath> {
  @override
  Future<CustomRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    if (uri.pathSegments.length == 0) return CustomRoutePath.home();
    if (uri.pathSegments[0] == 'items') {
      return CustomRoutePath.details(uri.pathSegments[1]);
    }
    //return CustomRoutePath.home();
  }

  @override
  RouteInformation restoreRouteInformation(CustomRoutePath path) {
    if (path.selected == null) return RouteInformation(location: '/');
    return RouteInformation(location: '/items/${path.selected}');
  }
}
