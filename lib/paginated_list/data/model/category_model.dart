import 'package:pagination_with_bloc/paginated_list/domain/entity/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    super.id,
    super.name,
    super.image,
    super.creationAt,
    super.updatedAt,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
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

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
