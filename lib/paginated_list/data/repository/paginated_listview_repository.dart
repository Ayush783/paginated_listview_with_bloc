import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pagination_with_bloc/paginated_list/data/model/product_model.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';
import 'package:pagination_with_bloc/paginated_list/domain/usecase/paginated_listview_usecase.dart';

class PaginatedListviewRepository implements PaginatedListviewUsecase {
  static const LIMIT = 10;
  static const endpoint = 'https://api.escuelajs.co/api/v1/products';

  @override
  Future<List<ProductEntity>> fetchData(int offset) async {
    final response =
        await http.get(Uri.parse('$endpoint?offset=$offset&limit=$LIMIT'));

    final data = List<Map<String, dynamic>>.from(jsonDecode(response.body));

    return data.map((e) => ProductModel.fromMap(e)).toList();
  }
}
