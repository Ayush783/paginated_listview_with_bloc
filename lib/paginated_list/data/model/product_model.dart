import 'package:pagination_with_bloc/paginated_list/data/model/category_model.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    super.id,
    super.title,
    super.price,
    super.description,
    super.images,
    super.creationAt,
    super.updatedAt,
    super.category,
  });

  factory ProductModel.fromMap(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"] == null
            ? []
            : List<String>.from(json["images"]!.map((x) => x)),
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        category: json["category"] == null
            ? null
            : CategoryModel.fromMap(json["category"]),
      );

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images":
            images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category": category?.toMap(),
      };
}

class Category {
  final int? id;
  final String? name;
  final String? image;
  final DateTime? creationAt;
  final DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        creationAt: json["creationAt"] == null
            ? null
            : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
