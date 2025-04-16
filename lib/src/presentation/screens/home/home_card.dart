import 'package:flutter/material.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import '../../../src.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final int count;
  final double value;
  final double changePercent;

  const HomeCard({
    super.key,
    required this.title,
    required this.count,
    required this.value,
    required this.changePercent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title, style: AppStyles.text16PxSemiBold),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Sparkline(
                data: [
                  0.0,
                  1.0,
                  1.5,
                  2.0,
                  0.0,
                  0.0,
                  -0.5,
                  -1.0,
                  -0.5,
                  0.0,
                  0.0,
                ],
                lineWidth: 2.0,
                fallbackHeight: 50.0,
                lineGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blue[800]!, Colors.blue[200]!],
                ),
              ),
            ),
            const SizedBox(width: 45.0),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('$count', style: AppStyles.text24PxBold),
                      const SizedBox(width: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.darkBlue10,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.trending_up_outlined,
                              size: 16.0,
                              color: AppColors.darkBlueColor,
                            ),
                            const SizedBox(width: 4.0),
                            Text(
                              '${changePercent.toStringAsFixed(1)}%',
                              style: AppStyles.text12PxBold.copyWith(
                                color: AppColors.darkBlueColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    'Value ${Utility.formatMoney(value)}',
                    style: AppStyles.text14PxRegular,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
