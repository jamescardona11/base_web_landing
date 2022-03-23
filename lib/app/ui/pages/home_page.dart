import 'package:flutter/material.dart';

import 'package:base_web_landing/app/presenter/page_provider.dart';
import 'package:base_web_landing/app/ui/shared/custom_app_menu.dart';
import 'package:base_web_landing/app/ui/views/about_view.dart';
import 'package:base_web_landing/app/ui/views/contact_view.dart';
import 'package:base_web_landing/app/ui/views/home_view.dart';
import 'package:base_web_landing/app/ui/views/location_view.dart';
import 'package:provider/provider.dart';
import 'package:universal_html/html.dart';

class HomePage1 extends StatefulWidget {
  HomePage1({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  State<HomePage1> createState() => _HomePage1State();
}

class _HomePage1State extends State<HomePage1> {
  int _curentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();

    _controller = PageController()
      ..addListener(() {
        final index = (_controller.page ?? 0).round();
        if (_curentIndex != index) {
          _curentIndex = index;
          ref.watch(itemsPageProvider.notifier).toggle(index);

          final item = ref.watch(currentItemSelected);
          window.history.pushState(null, '', '${item.route}');
          document.title = item.title;
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    final indexFromPage = ref.watch(indextFromPage(widget.page));

    final _controller = usePageController(
      initialPage: indexFromPage,
    );
    _controller.addListener(
      () => onPageControllerListener(
        (_controller.page ?? 0).round(),
        ref,
      ),
    );

    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                HomeView(),
                AboutView(),
                ContactView(),
                LocationView(),
              ],
            ),
            // Positioned(
            //   right: 20,
            //   top: 20,
            //   child: CustomAppWidget(),
            // )
          ],
        ),
      ),
    );
  }

  void onPageControllerListener(
    int index,
    WidgetRef ref,
  ) {}

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pink,
            Colors.deepPurple,
          ],
          stops: [
            0.5,
            0.5,
          ],
        ),
      );
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final PageController _controller;

  @override
  void initState() {
    super.initState();
    print('index ${widget.index}');
    _controller = PageController(initialPage: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    print('here');
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            PageView(
              controller: _controller,
              scrollDirection: Axis.vertical,
              children: [
                HomeView(),
                AboutView(),
                ContactView(),
                LocationView(),
              ],
            ),
            Positioned(
              right: 20,
              top: 20,
              child: CustomAppWidget(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller.animateToPage(
      widget.index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pink,
            Colors.deepPurple,
          ],
          stops: [
            0.5,
            0.5,
          ],
        ),
      );
}

class _HomeBody extends StatelessWidget {
  const _HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageProvider = P.Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider._scrollController,
      scrollDirection: Axis.vertical,
      children: [
        HomeView(),
        AboutView(),
        ContactView(),
        LocationView(),
      ],
    );
  }
}
