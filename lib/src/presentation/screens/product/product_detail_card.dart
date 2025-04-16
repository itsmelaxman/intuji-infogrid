import 'package:flutter/material.dart';
import '../../../src.dart';

class ProductDetailCard extends StatefulWidget {
  final ProductDetailModel product;

  const ProductDetailCard({super.key, required this.product});

  @override
  State<ProductDetailCard> createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard> {
  String? selectedColor;
  String? selectedSize;
  int currentImageIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedColor =
        widget.product.colors.isNotEmpty
            ? widget.product.colors.first.name
            : null;
    selectedSize = widget.product.selectedSize;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: widget.product.imageUrls.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentImageIndex = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Image.asset(
                      widget.product.imageUrls[index],
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.product.imageUrls.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      currentImageIndex == index
                          ? AppColors.kBlack
                          : AppColors.greyColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Text(
                  '\$${widget.product.price.toStringAsFixed(2)}',
                  style: AppStyles.text24PxBold,
                ),
                const SizedBox(width: 8.0),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.darkBlueColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Text(
                    '\$${widget.product.budgetLeft} left in your current budget.',
                    style: AppStyles.text12PxRegular.copyWith(
                      color: AppColors.kWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.product.name, style: AppStyles.text18PxSemiBold),
                const SizedBox(height: 8.0),
                Text(
                  widget.product.description,
                  style: AppStyles.text14PxRegular,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Color', style: AppStyles.text16PxSemiBold),
                const SizedBox(height: 8.0),
                Row(
                  children:
                      widget.product.colors.map((color) {
                        final isSelected = color.name == selectedColor;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedColor = color.name;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8.0),
                            padding: const EdgeInsets.all(16.0),
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,

                              gradient: LinearGradient(
                                colors: Utility.parseHexColors(color.hex),
                              ),
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.blueColor
                                        : AppColors.kWhite,
                                width: 2.0,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Available Sizes', style: AppStyles.text16PxSemiBold),
                const SizedBox(height: 8.0),
                Wrap(
                  spacing: 8.0,
                  children:
                      widget.product.availableSizes.map((size) {
                        final isSelected = size == selectedSize;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            padding: const EdgeInsets.all(4.0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColors.kWhite,
                              border: Border.all(
                                color:
                                    isSelected
                                        ? AppColors.blueColor
                                        : AppColors.greyColor,
                                width: isSelected ? 2.0 : 1.0,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              size,
                              style: AppStyles.text14PxSemiBold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.skyBlueColor, AppColors.limeColor],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Text(
              'You last requested this product on ${widget.product.lastRequestedDate}.',
              style: AppStyles.text14PxSemiBold,
            ),
          ),
          const SizedBox(height: 16.0),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: CustomMaterialButton(
              onPressed: widget.product.canRequestAgain ? () {} : () {},
              text: 'Send Order Request',
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
