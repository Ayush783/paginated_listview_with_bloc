part of 'paginated_listview_bloc.dart';

class PaginatedListviewBlocState {
  final List<ProductEntity> products;
  final bool isLoading;
  final String errorMessage;

  PaginatedListviewBlocState({
    this.products = const [],
    this.isLoading = true,
    this.errorMessage = '',
  });

  PaginatedListviewBlocState copyWith({
    List<ProductEntity>? products,
    bool? isLoading,
    String? errorMessage,
  }) =>
      PaginatedListviewBlocState(
        errorMessage: errorMessage ?? this.errorMessage,
        isLoading: isLoading ?? this.isLoading,
        products: products ?? this.products,
      );
}
