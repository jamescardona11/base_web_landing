import 'package:argo/argo.dart';
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:base_web_landing/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_title_appbar.dart';

class HeaderContainerWidget extends StatelessWidget {
  const HeaderContainerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: buildAppBar(context),
    );
  }

  Widget buildAppBar(BuildContext context) =>
      ResponsiveWrapper.isMobile(context)
          ? _HeaderForSmallScreenWidget()
          : _HeaderForNoSmallScreenWidget();
}

class _HeaderForSmallScreenWidget extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kSizeHeaderBar);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('text'),
    );
  }
}

class _HeaderForNoSmallScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const _MenuItemList();
}

class _MenuItemList extends StatelessWidget {
  const _MenuItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final headerItems = context
        .select<IndexPageProvider, List<HeaderItemUIModel>>((it) => it.items);
    print('listen');

    return ColoredBox(
      color: Colors.black,
      child: SizedBox(
        height: kSizeHeaderBar,
        width: double.maxFinite,
        child: Stack(
          children: [
            const AppTitleWidget(),
            Center(
              child: ListView.builder(
                itemCount: headerItems.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    _HeaderItemWidget(item: headerItems[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderItemWidget extends StatelessWidget {
  const _HeaderItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final HeaderItemUIModel item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<IndexPageProvider>().toggle(item.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: item.isSelected ? kYellowColor : kCreamColor,
                ),
          ),
        ),
      ),
    );
  }
}
