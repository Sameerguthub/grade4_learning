class GeneralItem {
  final String name;
  final String category;
  final String image;
  final String description;
  final String lives;
  final String eats;

  GeneralItem({
    required this.name,
    required this.category,
    required this.image,
    required this.description,
    required this.lives,
    required this.eats,
  });
}

class GeneralCategory {
  final String name;
  final String subtitle;
  final String image;
  final List<GeneralItem> items;

  GeneralCategory({
    required this.name,
    required this.subtitle,
    required this.image,
    required this.items,
  });
}