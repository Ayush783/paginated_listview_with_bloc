import 'package:pagination_with_bloc/paginated_list/domain/entity/category_entity.dart';

abstract class ProductEntity {
  final int? id;
  final String? title;
  final int? price;
  final String? description;
  final List<String>? images;
  final DateTime? creationAt;
  final DateTime? updatedAt;
  final CategoryEntity? category;

  ProductEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  Map<String, dynamic> toMap();
}
