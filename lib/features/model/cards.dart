class Cards {
  final String icon;
  final String property;
  dynamic value;
  final String unit;
  final String description;

  Cards({
    required this.icon,
    required this.property,
    this.value,
    required this.unit,
    required this.description,
  });
}
