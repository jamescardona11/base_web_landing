import 'package:animate_do/animate_do.dart';
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:base_web_landing/app/presenter/index_page_provider.dart';
import 'package:base_web_landing/app/ui/shared/custom_menu_item.dart';
import 'package:provider/provider.dart';

class CustomAppWidget extends StatefulWidget {
  const CustomAppWidget({Key? key}) : super(key: key);

  @override
  _CustomAppWidgetState createState() => _CustomAppWidgetState();
}

class _CustomAppWidgetState extends State<CustomAppWidget>
    with SingleTickerProviderStateMixin {
  bool isOpen = false;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 200),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<IndexPageProvider>(context, listen: false);

    return FadeIn(
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });

            if (isOpen) {
              controller.reverse();
            } else {
              controller.forward();
            }
          },
          child: Container(
            width: 150,
            height: isOpen ? 260 : 50,
            color: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _MenuTitle(isOpen: isOpen, controller: controller),
                if (isOpen) ...[
                  CustomMenuItemWidget(
                    text: 'Home',
                    onPressed: () => pageProvider.goTo(0),
                  ),
                  CustomMenuItemWidget(
                    text: 'About',
                    onPressed: () => pageProvider.goTo(1),
                  ),
                  CustomMenuItemWidget(
                    text: 'Contat',
                    onPressed: () => pageProvider.goTo(2),
                  ),
                  CustomMenuItemWidget(
                    text: 'Location',
                    onPressed: () => pageProvider.goTo(3),
                  ),
                  SizedBox(),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _MenuTitle extends StatelessWidget {
  const _MenuTitle({
    Key? key,
    required this.isOpen,
    required this.controller,
  }) : super(key: key);

  final bool isOpen;
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 50,
      child: Row(
        children: [
          AnimatedContainer(
            duration: Duration(microseconds: 200),
            curve: Curves.easeInOut,
            width: isOpen ? 50 : 0,
          ),
          Text(
            'Menu',
            style: GoogleFonts.roboto(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Spacer(),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: controller,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
