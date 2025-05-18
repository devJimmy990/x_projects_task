class OptionModel {
  final String title, value;
  final bool isSelected;

  OptionModel({
    required this.title,
    required this.value,
    this.isSelected = false,
  });
}
