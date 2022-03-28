/// [def]

import 'package:argo/argo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// [loc]
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/pages/about_view.dart';
import 'package:base_web_landing/app/ui/pages/home_view.dart';
import 'package:base_web_landing/app/ui/pages/contact_view.dart';
import 'package:base_web_landing/app/ui/pages/location_view.dart';
import 'package:base_web_landing/app/ui/pages/other_view.dart';

import 'widgets/side_menu_widget.dart';
import 'widgets/topbar_widget.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    final indexPageProvider = context.read<IndexPageProvider>();

    return Scaffold(
      appBar: const TopbarWidget(),
      endDrawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: const SideMenuWidget(),
      ),
      endDrawerEnableOpenDragGesture: false,
      body: PageView(
        controller: indexPageProvider.controller,
        scrollDirection:
            PlatformInfo.isMobile ? Axis.horizontal : Axis.vertical,
        children: const [
          HomeView(),
          AboutView(),
          ContactView(),
          LocationView(),
          OtherView(),
        ],
      ),
    );
  }
}
