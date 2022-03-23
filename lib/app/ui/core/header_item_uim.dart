class HeaderItemUIModel {
  HeaderItemUIModel({
    required this.id,
    required this.title,
    required this.route,
    this.isSelected = false,
  });

  final int id;
  final String title;
  final String? route;
  final bool isSelected;

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
      );
}
