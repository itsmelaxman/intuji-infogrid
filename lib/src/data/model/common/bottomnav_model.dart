import '../../../src.dart';

class BottomNavModel {
  final String label;
  final String icon;
  final String route;

  BottomNavModel({required this.label, required this.icon, required this.route})
    : assert(label.isNotEmpty, 'Label is required'),
      assert(icon.isNotEmpty, 'Icon is required');
}

final List<BottomNavModel> bottomNavItems = [
  BottomNavModel(
    label: 'Dashboard',
    icon: Assets.homeIcon,
    route: AppRouter.home,
  ),
  BottomNavModel(
    label: 'Members',
    icon: Assets.teamIcon,
    route: AppRouter.team,
  ),
  BottomNavModel(
    label: 'Orders',
    icon: Assets.orderIcon,
    route: AppRouter.product,
  ),
  BottomNavModel(label: 'More', icon: Assets.moreIcon, route: AppRouter.more),
];
