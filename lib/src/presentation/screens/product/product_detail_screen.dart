import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../src.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    super.initState();
    Misc.onLayoutRendered(
      () => context.read<ProductProvider>().fetchProductDetail("prod-00123"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductProvider>(
        builder: (context, provider, child) {
          if (provider.status == DataFetchStatus.loading) {
            return const CustomLoader();
          } else if (provider.status == DataFetchStatus.error) {
            return const Center(child: Text('Failed to show data'));
          } else if (provider.productDetail == null) {
            return const NoDataWidget(
              title: 'No Product Found',
              description: 'Sorry, we could not find the product details.',
            );
          }

          final product = provider.productDetail!;
          return ProductDetailCard(product: product);
        },
      ),
    );
  }
}
