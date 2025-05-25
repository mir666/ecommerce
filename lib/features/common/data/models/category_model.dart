class CategoryModel {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String icon;

  CategoryModel(
      {required this.id,
        required this.title,
        required this.slug,
        required this.description,
        required this.icon});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
      id: jsonData['_id'],
      title: jsonData['title'],
      slug: jsonData['slug'],
      description: jsonData['description'],
      icon: jsonData['icon'],
    );
  }
}