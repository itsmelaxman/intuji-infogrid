import 'package:flutter/material.dart';

import '../../../../src.dart';

class LiveOrderTrackingWidget extends StatelessWidget {
  final OrderTracking orderTracking;

  const LiveOrderTrackingWidget({super.key, required this.orderTracking});

  @override
  Widget build(BuildContext context) {
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
            'Live Order Tracking',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            'Progress of all orders from placement to delivery',
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.greyColor),
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              Assets.mapImagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(Icons.chevron_left),
              Text(
                orderTracking.orderId,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
          const Divider(height: 24),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From",
                      style: TextStyle(color: AppColors.greyColor600),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      orderTracking.from,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("To", style: TextStyle(color: AppColors.greyColor600)),
                    const SizedBox(height: 4),
                    Text(
                      orderTracking.to,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'View Order Details',
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
    );
  }
}
