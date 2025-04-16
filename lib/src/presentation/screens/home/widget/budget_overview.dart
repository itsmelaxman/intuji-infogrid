import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../../src.dart';

class BudgetOverviewWidget extends StatelessWidget {
  final Budget budget;

  const BudgetOverviewWidget({super.key, required this.budget});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Budget Overview', style: AppStyles.text16PxSemiBold),
            const SizedBox(height: 8.0),
            Text(
              'Summary of the budget plan for November',
              style: AppStyles.text14PxRegular,
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              height: 150,
              child: SfRadialGauge(
                axes: [
                  RadialAxis(
                    minimum: 0,
                    showLabels: false,
                    showAxisLine: false,
                    showTicks: false,
                    maximum: budget.spent + budget.remaining.toDouble(),
                    ranges: [
                      GaugeRange(
                        startValue: 0,
                        endValue: budget.spent.toDouble(),
                        gradient: const SweepGradient(
                          colors: [
                            Color(0xFFFB812C),
                            Color(0xFF15C098),
                            Color(0xFF5AB713),
                          ],
                        ),
                      ),
                      GaugeRange(
                        startValue: budget.spent.toDouble(),
                        endValue: budget.spent + budget.remaining.toDouble(),
                        color: AppColors.greyColor.withValues(alpha: 0.5),
                      ),
                    ],
                    pointers: [],
                    axisLineStyle: AxisLineStyle(
                      thickness: 0.1,
                      color: Colors.transparent,
                      cornerStyle: CornerStyle.bothFlat,
                    ),
                    annotations: [
                      GaugeAnnotation(
                        widget: Column(
                          children: [
                            Text(
                              '\$${budget.spent}',
                              style: AppStyles.text14PxBold,
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              'Budget Spent',
                              style: AppStyles.text14PxRegular,
                            ),
                          ],
                        ),
                        angle: 90,
                        positionFactor: 0.8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'You still have \$${budget.remaining} left in your budget.',
              style: AppStyles.text14PxRegular,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
