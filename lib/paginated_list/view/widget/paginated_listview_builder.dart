import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';
import 'package:pagination_with_bloc/paginated_list/view/bloc/paginated_listview_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/view/widget/product_list_item.dart';

class PaginatedListviewBuilder extends StatefulWidget {
  const PaginatedListviewBuilder({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  State<PaginatedListviewBuilder> createState() =>
      _PaginatedListviewBuilderState();
}

class _PaginatedListviewBuilderState extends State<PaginatedListviewBuilder> {
  final scrollController = ScrollController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        scrollController.addListener(
          () {
            if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
              context
                  .read<PaginatedListviewBloc>()
                  .add(FetchDataEvent(offset: widget.products.length ~/ 10));
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: widget.products.length + 1,
      itemBuilder: (context, index) {
        if (index == widget.products.length) {
          return LoaderOrErrorWidget();
        }

        return ProductListItem(
          product: widget.products[index],
        );
      },
    );
  }
}

class LoaderOrErrorWidget extends StatelessWidget {
  const LoaderOrErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: BlocBuilder<PaginatedListviewBloc, PaginatedListviewBlocState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ],
            );
          }

          return Text(state.errorMessage);
        },
      ),
    );
  }
}
