import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../src.dart';

class NoDataWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final String? icon;
  const NoDataWidget({super.key, this.title, this.description, this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon ?? Assets.homeIcon, height: 200, width: 200),
            SizedBox(width: 20.0),
            Text(title ?? 'No Data Found', style: AppStyles.text18PxSemiBold),
            SizedBox(height: 10.0),
            Text(
              description ?? 'Sorry, but we could not find any data.',
              textAlign: TextAlign.center,
              style: AppStyles.text14PxRegular,
            ),
          ],
        ),
      ),
    );
  }
}
