import 'package:pagination_with_bloc/paginated_list/data/repository/paginated_listview_repository.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';

abstract class PaginatedListviewUsecase {
  factory PaginatedListviewUsecase() => PaginatedListviewRepository();

  Future<List<ProductEntity>> fetchData(int offset);
}
