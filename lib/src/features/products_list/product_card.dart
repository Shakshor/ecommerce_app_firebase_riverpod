import 'package:ecommerce_app_firebase_riverpod/src/localization/string_hardcoded.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/custom_image.dart';
import '../../constants/app_sizes.dart';
import '../../models/product.dart';
import '../../utils/currency_formatter.dart';
import '../product_page/product_average_rating.dart';

/// Used to show a single product inside a card.
class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, this.onPressed});
  final Product product;
  final VoidCallback? onPressed;

  // * Keys for testing using find.byKey()
  static const productCardKey = Key('product-card');

  @override
  Widget build(BuildContext context) {
    // TODO: Inject formatter
    final priceFormatted = kCurrencyFormatter.format(product.price);
    return Card(
      child: InkWell(
        key: productCardKey,
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomImage(imageUrl: product.imageUrl),
              gapH8,
              const Divider(),
              gapH8,
              Text(product.title, style: Theme.of(context).textTheme.titleLarge),
              if (product.numRatings >= 1) ...[
                gapH8,
                ProductAverageRating(product: product),
              ],
              gapH24,
              Text(priceFormatted,
                  style: Theme.of(context).textTheme.headlineSmall),
              gapH4,
              Text(
                product.availableQuantity <= 0
                    ? 'Out of Stock'.hardcoded
                    : 'Quantity: ${product.availableQuantity}'.hardcoded,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
