import 'package:flutter/material.dart';
import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:base_web_landing/app/presenter/items_page.dart';

import 'package:universal_html/html.dart';

class PageProvider extends ChangeNotifier {
  PageProvider() {
    _items = itemsPage;
    _controller = PageController();
    _curentIndex = 0;
  }

  late List<HeaderItemUIModel> _items;
  late PageController _controller;
  late int _curentIndex;

  List<HeaderItemUIModel> get currentState => _items;

  void toggle(int id) {
    _items = [
      for (final item in _items)
        if (item.id == id)
          item.copyWith(isSelected: true)
        else
          item.copyWith(isSelected: false)
    ];
  }

  void goTo(int index) {}

  void createScrollController(String routeName) {
    _controller = PageController(initialPage: _getPageIndex(routeName))
      ..addListener(() {
        final index = (_controller.page ?? 0).round();
        if (_curentIndex != index) {
          _curentIndex = index;
          final item = _items[_curentIndex];

          toggle(_curentIndex);
          _changeWindowStatge(item.route, item.title);
        }
      });
  }

  int _getPageIndex(String routeName) {
    final index = _items
        .indexWhere((element) => element.title.toLowerCase() == routeName);

    return index >= 0 ? index : 0;
  }

  void _changeWindowStatge(String? route, String title) {
    window.history.pushState(null, '', route);
    document.title = title;
  }
}


// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
// import 'package:universal_html/html.dart';

// class IndexPageNotifier extends StateNotifier<List<HeaderItemUIModel>> {
//   IndexPageNotifier([List<HeaderItemUIModel>? initialState])
//       : super(initialState ?? []);

//   void toggle(int id) {
//     state = [
//       for (final item in state)
//         if (item.id == id)
//           item.copyWith(isSelected: true)
//         else
//           item.copyWith(isSelected: false)
//     ];
//   }

//   List<HeaderItemUIModel> get currentState => state;
// }

// final itemsPageProvider =
//     StateNotifierProvider<IndexPageNotifier, List<HeaderItemUIModel>>((_) {
//   return IndexPageNotifier(
//     [
//       HeaderItemUIModel(
//         id: 0,
//         title: 'Home',
//         route: '/home',
//         isSelected: true,
//       ),
//       HeaderItemUIModel(
//         id: 1,
//         title: 'About',
//         route: '/about',
//       ),
//       HeaderItemUIModel(
//         id: 2,
//         title: 'Contact',
//         route: '/contact',
//       ),
//       HeaderItemUIModel(
//         id: 3,
//         title: 'Location',
//         route: '/location',
//       ),
//       HeaderItemUIModel(
//         id: 4,
//         title: 'Contact us',
//         route: '/contactus',
//       ),
//     ],
//   );
// });

// final currentItemSelected = Provider<HeaderItemUIModel>((ref) {
//   return ref
//       .watch(itemsPageProvider)
//       .firstWhere((element) => element.isSelected);
// });

// final indextFromPage = Provider.family<int, String>((ref, page) {
//   return ref
//       .watch(itemsPageProvider)
//       .indexWhere((element) => element.title.toLowerCase() == page);
// });

// class PageProvider2 extends StateNotifier<PageController> {
//   PageProvider2() : super(PageController());
//   int _curentIndex = 0;

//   void createScrollController(int index, HeaderItemUIModel item) {
//     state = PageController(initialPage: index)
//       ..addListener(() {
//         final index = (state.page ?? 0).round();

//         // print('EHHEEE ');
//         // print('current $_curentIndex ');
//         // print('index $index ');
//         if (_curentIndex != index) {
//           window.history.pushState(null, '', '${item.route}');
//           document.title = item.title;
//           _curentIndex = index;
//         }
//       });
//   }

//   PageController get currentState => state;
// }

// final pageController =
//     StateNotifierProvider<PageProvider2, PageController>((ref) {
//   print('Creacion');
//   return PageProvider2();
// });

// class PageProvider extends ChangeNotifier {
//   PageController scrollController = PageController();

//   List<String> _pages = [
//     'home',
//     'about',
//     'contact',
//     'location',
//   ];
//   int _curentIndex = 0;

//   void createScrollController(String routeName) {
//     scrollController = PageController(initialPage: getPageIndex(routeName))
//       ..addListener(() {
//         final index = (scrollController.page ?? 0).round();

//         if (_curentIndex != index) {
//           window.history.pushState(null, '', '#/${_pages[index]}');
//           document.title = _pages[index];
//           _curentIndex = index;
//         }
//       });
//   }

//   int getPageIndex(String routeName) {
//     final index = _pages.indexOf(routeName);

//     if (index >= 0) {
//       return index;
//     }

//     return 0;
//   }

//   void goTo(int index) {
//     // window.history.pushState(null, '', '#/${_pages[index]}');

//     scrollController.animateToPage(
//       index,
//       duration: Duration(milliseconds: 200),
//       curve: Curves.easeInOut,
//     );
//   }
// }
