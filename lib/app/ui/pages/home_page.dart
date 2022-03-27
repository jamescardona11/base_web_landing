import 'package:flutter/material.dart';

import 'package:base_web_landing/app/presenter/page_provider.dart';
import 'package:base_web_landing/app/ui/views/about_view.dart';
import 'package:base_web_landing/app/ui/views/contact_view.dart';
import 'package:base_web_landing/app/ui/views/home_view.dart';
import 'package:base_web_landing/app/ui/views/location_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.page,
  }) : super(key: key);

  final String page;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        decoration: buildBoxDecoration(),
        child: Stack(
          children: [
            PageView(
              controller: pageProvider.controller,
              scrollDirection: Axis.vertical,
              children: const [
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

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
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
