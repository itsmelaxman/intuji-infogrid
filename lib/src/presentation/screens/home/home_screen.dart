import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../src.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Misc.onLayoutRendered(() {
      context.read<HomeProvider>().fetchDashboardData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) {
          if (provider.status == DataFetchStatus.loading) {
            return const CustomLoader();
          } else if (provider.status == DataFetchStatus.error) {
            return const Center(child: Text('Failed to show data'));
          } else if (provider.dashboardData == null) {
            return const NoDataWidget(
              title: 'No Data Found',
              description: 'Sorry, we could not find any dashboard data.',
            );
          }

          final dashboard = provider.dashboardData!;
          return HomeServices(dashboard: dashboard);
        },
      ),
    );
  }
}
