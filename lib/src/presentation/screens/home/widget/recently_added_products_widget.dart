import 'package:flutter/material.dart';

import '../../../../src.dart';

class RecentlyAddedProductsWidget extends StatefulWidget {
  final List<RecentProduct> products;

  const RecentlyAddedProductsWidget({super.key, required this.products});

  @override
  State<RecentlyAddedProductsWidget> createState() =>
      _RecentlyAddedProductsWidgetState();
}

class _RecentlyAddedProductsWidgetState
    extends State<RecentlyAddedProductsWidget> {
  int currentIndex = 0;

  void goToPrevious() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + widget.products.length) % widget.products.length;
    });
  }

  void goToNext() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.products.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.products[currentIndex];

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.kWhite,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recently Added Products',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Browse new products from us',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.greyColor),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Image.asset(product.imageUrl, height: 100, fit: BoxFit.contain),
                const SizedBox(height: 12),
                Text(
                  product.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () {
                    Utility.navigate(context, AppRouter.product);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'View Product Details',
                        style: TextStyle(
                          color: AppColors.blueColor,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.open_in_new,
                        size: 16,
                        color: AppColors.blueColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: goToPrevious,
                icon: const Icon(Icons.chevron_left),
              ),
              ...List.generate(widget.products.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        index == currentIndex
                            ? AppColors.blueColor
                            : Colors.grey[300],
                  ),
                );
              }),
              IconButton(
                onPressed: goToNext,
                icon: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
