import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:base_web_landing/config/values/values.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef MBuilder = Widget Function(bool isHover);

class MenuItemWidget extends StatelessWidget {
  MenuItemWidget({
    Key? key,
    required this.item,
    required this.builder,
  }) : super(key: key);

  final MBuilder builder;
  final HeaderItemUIModel item;

  final isHover = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHover(),
      onExit: (_) => _onHover(),
      child: GestureDetector(
        onTap: () => context.read<IndexPageProvider>().goTo(item.id),
        child: ValueListenableBuilder<bool>(
          valueListenable: isHover,
          builder: (_, value, __) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: builder(value),
          ),
        ),
      ),
    );
  }

  void _onHover() {
    isHover.value = !isHover.value;
  }
}

class TopbarMenuItemWidget extends StatelessWidget {
  const TopbarMenuItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final HeaderItemUIModel item;

  @override
  Widget build(BuildContext context) {
    final isSelected = item.isSelected;
    return MenuItemWidget(
      item: item,
      builder: (isHover) => Center(
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
    );
  }
}

class SideMenuItemWidget extends StatelessWidget {
  const SideMenuItemWidget({
    Key? key,
    required this.item,
    this.showBorder = true,
  }) : super(key: key);

  final HeaderItemUIModel item;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    final isSelected = item.isSelected;
    return MenuItemWidget(
      item: item,
      builder: (isHover) => AnimatedContainer(
        width: 200,
        margin: const EdgeInsets.symmetric(vertical: 10),
        duration: const Duration(microseconds: 300),
        decoration: BoxDecoration(
          color: !isSelected && isHover ? Colors.grey[200] : Colors.transparent,
          border: showBorder
              ? const Border(
                  bottom: BorderSide(color: Color(0xFFDFE2EF)),
                )
              : null,
        ),
        child: Center(
          child: Row(
            children: [
              Icon(
                item.icon,
                color: isSelected ? kBlueColor : kBlackColor,
              ),
              kSpaceLittleHorizontal,
              Text(
                item.title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: isSelected ? kBlueColor : kBlackColor,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
