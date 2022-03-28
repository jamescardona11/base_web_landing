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
  _HeaderItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final HeaderItemUIModel item;
  final isHover = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final isSelected = item.isSelected;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHover(),
      onExit: (_) => _onHover(),
      child: GestureDetector(
        onTap: () => context.read<IndexPageProvider>().goTo(item.id),
        child: ValueListenableBuilder<bool>(
          valueListenable: isHover,
          builder: (_, isHover, __) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.title,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: isSelected ? kYellowColor : kCreamColor,
                        ),
                  ),
                  AnimatedContainer(
                    width: !isSelected && isHover ? 10 : 0,
                    height: !isSelected && isHover ? 10 : 0,
                    duration: const Duration(microseconds: 300),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: borderRadiusNormal,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onHover() {
    isHover.value = !isHover.value;
  }
}
