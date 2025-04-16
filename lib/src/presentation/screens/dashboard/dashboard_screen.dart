import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intuji_infogrid/src/src.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    const TeamScreen(),
    const ProductDetailScreen(),
    const MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          bottomNavItems[_currentIndex].label,
          style: AppStyles.text16PxBold.copyWith(color: AppColors.kWhite),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kBlack,
        elevation: 0,
        actions: [
          if (_currentIndex == 0) ...[
            IconButton(
              icon: SvgPicture.asset(
                Assets.searchIcon,
                colorFilter: const ColorFilter.mode(
                  AppColors.kWhite,
                  BlendMode.srcIn,
                ),
              ),
              onPressed: () {},
            ),
            CircleAvatar(radius: 12, backgroundImage: AssetImage(Assets.logo)),
          ],
          const SizedBox(width: 16.0),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: const BoxDecoration(color: AppColors.kWhite),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(bottomNavItems.length, (index) {
            final isSelected = _currentIndex == index;
            final item = bottomNavItems[index];

            return GestureDetector(
              onTap: () => _onItemTapped(index),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? const Color(0xFFFFF7D1)
                              : Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        SvgPicture.asset(
                          item.icon,
                          width: 24,
                          height: 24,
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? AppColors.kBlack
                                : const Color(0xFF999999),
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            fontWeight:
                                isSelected
                                    ? FontWeight.w600
                                    : FontWeight.normal,
                            fontSize: 12,
                            color:
                                isSelected
                                    ? AppColors.kBlack
                                    : const Color(0xFF999999),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
