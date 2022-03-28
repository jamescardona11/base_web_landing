import 'package:flutter/material.dart';

class HeaderItemUIModel {
  HeaderItemUIModel({
    required this.id,
    required this.title,
    required this.route,
    required this.icon,
    this.isSelected = false,
  });

  final int id;
  final String title;
  final String? route;
  final bool isSelected;
  final IconData icon;

  HeaderItemUIModel copyWith({
    int? id,
    String? title,
    String? route,
    bool? isSelected,
  }) =>
      HeaderItemUIModel(
        id: id ?? this.id,
        title: title ?? this.title,
        route: route ?? this.route,
        isSelected: isSelected ?? this.isSelected,
        icon: icon,
      );
}
