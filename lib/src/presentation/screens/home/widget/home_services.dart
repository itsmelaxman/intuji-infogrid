import 'package:flutter/material.dart';
import 'recently_added_products_widget.dart';
import 'live_order_tracking_widget.dart';
import '../../../../src.dart';

class HomeServices extends StatelessWidget {
  final DashboardModel dashboard;

  const HomeServices({super.key, required this.dashboard});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300.0,
            margin: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: AppColors.kWhite,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                HomeCard(
                  title: 'Total Quotes',
                  count: dashboard.totalQuotes.count,
                  value: dashboard.totalQuotes.value,
                  changePercent: dashboard.totalQuotes.changePercent,
                ),
                const SizedBox(height: 16.0),
                Divider(
                  color: AppColors.greyColor.withValues(alpha: 0.5),
                  thickness: 1.0,
                ),
                const SizedBox(height: 16.0),
                HomeCard(
                  title: 'Total Orders',
                  count: dashboard.totalOrders.count,
                  value: dashboard.totalOrders.value,
                  changePercent: dashboard.totalOrders.changePercent,
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),

          // Budget Overview Section
          BudgetOverviewWidget(budget: dashboard.budget),

          // Live Order Tracking Section
          LiveOrderTrackingWidget(orderTracking: dashboard.orderTracking),

          // Recently Added Products Section
          RecentlyAddedProductsWidget(products: dashboard.recentProducts),
        ],
      ),
    );
  }
}
