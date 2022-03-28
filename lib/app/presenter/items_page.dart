import 'package:base_web_landing/app/ui/core/header_item_uim.dart';
import 'package:flutter/material.dart';

final itemsPage = [
  HeaderItemUIModel(
    id: 0,
    title: 'Home',
    route: '/home',
    isSelected: true,
    icon: Icons.home,
  ),
  HeaderItemUIModel(
    id: 1,
    title: 'About',
    route: '/about',
    icon: Icons.account_box_outlined,
  ),
  HeaderItemUIModel(
      id: 2,
      title: 'Contact',
      route: '/contact',
      icon: Icons.contact_page_sharp),
  HeaderItemUIModel(
    id: 3,
    title: 'Location',
    route: '/location',
    icon: Icons.location_on,
  ),
  HeaderItemUIModel(
    id: 4,
    title: 'Other',
    route: '/other',
    icon: Icons.abc_sharp,
  ),
];
