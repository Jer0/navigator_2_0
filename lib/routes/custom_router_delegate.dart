import 'package:flutter/material.dart';
import 'package:navigator_2_0/routes/route_path.dart';

import '../main.dart';

class CustomRouterDelegate extends RouterDelegate<CustomRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CustomRoutePath> {
  String _selected;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        _selected = null;
        notifyListeners();
        return true;
      },
      pages: [
        MaterialPage(
          child: ListPage(
            onTap: (selected) {
              _selected = selected;
              notifyListeners();
            },
          ),
        ),
        if (_selected != null)
          MaterialPage(
            child: DetailsPage(
              selected: _selected,
            ),
          ),
      ],
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  @override
  Future<void> setNewRoutePath(CustomRoutePath path) {
    if (path.selected == null) {
      _selected = null;
    } else {
      _selected = path.selected;
    }
  }
}
