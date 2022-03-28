import 'package:flutter/material.dart';
import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:base_web_landing/app/presenter/items_page.dart';

import 'package:universal_html/html.dart';

class IndexPageProvider extends ChangeNotifier {
  IndexPageProvider() {
    _items = itemsPage;
    _controller = PageController();
    _curentIndex = 0;
  }

  late List<HeaderItemUIModel> _items;
  late PageController _controller;
  late int _curentIndex;

  List<HeaderItemUIModel> get items => _items;
  PageController get controller => _controller;

  void onToggleItem(int id) {
    if (_items[id].isSelected) return;
    _items = [
      for (final item in _items)
        if (item.id == id)
          item.copyWith(isSelected: true)
        else
          item.copyWith(isSelected: false)
    ];

    notifyListeners();
  }

  void goTo(int id) {
    onToggleItem(id);

    _controller.animateToPage(
      id,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  void updateScrollController(String routeName) {
    _controller = PageController(initialPage: _getPageIndex(routeName))
      ..addListener(() {
        final index = (_controller.page ?? 0).round();
        if (_curentIndex != index) {
          _curentIndex = index;
          final item = _items[_curentIndex];

          onToggleItem(_curentIndex);
          _changeWindowStatge(item.route, item.title);
        }
      });
  }

  int _getPageIndex(String routeName) {
    final index = _items.indexWhere(
        (element) => element.title.toLowerCase() == routeName.toLowerCase());

    return index >= 0 ? index : 0;
  }

  void _changeWindowStatge(String? route, String title) {
    window.history.pushState(null, '', route);
    document.title = title;
  }
}
