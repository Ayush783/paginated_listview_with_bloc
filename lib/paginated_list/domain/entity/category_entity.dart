abstract class CategoryEntity {
  final int? id;
  final String? name;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  CategoryEntity({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap();
}
