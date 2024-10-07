import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';

class ProductListItem extends StatelessWidget {
  final ProductEntity product;

  const ProductListItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(product.id),
      title: Text(product.title ?? ''),
      subtitle: Text(
        product.description ?? '',
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ),
      leading: product.images?.isNotEmpty ?? false
          ? Image.network(
              product.images!.first,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.error,
                size: 48,
              ),
            )
          : null,
      trailing: Text('\$${product.price.toString()}'),
    );
  }
}
