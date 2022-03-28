import 'package:argo/argo.dart';
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:base_web_landing/app/ui/index/widgets/menu_item_widget.dart';
import 'package:base_web_landing/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_title_appbar.dart';

class TopbarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kSizeHeaderBar);

  const TopbarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (ctx, info) {
        return info.isMobile
            ? const _TopbarForSmallScreenWidget()
            : _TopbarForNoSmallScreenWidget();
      },
    );
  }
}

class _TopbarForSmallScreenWidget extends StatelessWidget {
  const _TopbarForSmallScreenWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: kBlackColor,
        title: const AppTitleWidget(),
        centerTitle: true,
        actions: [
          Padding(
            padding: getHorizontalPaddingMainPages(context),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: kCreamColor,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          )
        ]);
  }
}

class _TopbarForNoSmallScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Card(
        margin: EdgeInsets.zero,
        elevation: 10,
        shadowColor: Colors.grey,
        child: _CommonHeaderWidget(
          child: Stack(
            children: [
              const AppTitleWidget(),
              ResponsiveVisibility.conditions(
                visibleWhen: const [
                  ConditionBreakpoint<bool>.largerThan(
                    value: true,
                    breakpoint: 650,
                  ),
                ],
                child: const Center(
                  child: _MenuItemListWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CommonHeaderWidget extends StatelessWidget {
  const _CommonHeaderWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: kBlackColor,
      child: SizedBox(
        height: kSizeHeaderBar,
        width: double.maxFinite,
        child: child,
      ),
    );
  }
}

class _MenuItemListWidget extends StatelessWidget {
  const _MenuItemListWidget({Key? key, this.scrollDirection = Axis.horizontal})
      : super(key: key);

  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    final headerItems = context
        .select<IndexPageProvider, List<HeaderItemUIModel>>((it) => it.items);

    return ListView.builder(
      itemCount: headerItems.length,
      scrollDirection: scrollDirection,
      shrinkWrap: true,
      itemBuilder: (context, index) =>
          TopbarMenuItemWidget(item: headerItems[index]),
    );
  }
}
