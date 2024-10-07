import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/view/bloc/paginated_listview_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/view/widget/paginated_listview_builder.dart';
import 'package:pagination_with_bloc/paginated_list/view/widget/product_list_item.dart';

class PaginatedListView extends StatelessWidget {
  const PaginatedListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<PaginatedListviewBloc, PaginatedListviewBlocState>(
        builder: (context, state) {
          if (state.isLoading && state.products.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state.errorMessage.isNotEmpty && state.products.isEmpty) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return PaginatedListviewBuilder(products: state.products);
        },
        listener: (context, state) {},
      ),
    );
  }
}
