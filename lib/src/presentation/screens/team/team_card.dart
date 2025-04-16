import 'package:flutter/material.dart';
import '../../../src.dart';

class TeamCard extends StatelessWidget {
  final TeamModel member;

  const TeamCard({super.key, required this.member});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 0,

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name, style: AppStyles.text16PxSemiBold),
                  const SizedBox(height: 4.0),
                  Text(
                    member.role,
                    style: AppStyles.text14PxMedium.copyWith(
                      color: AppColors.kTextSecondary,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    member.email,
                    style: AppStyles.text12PxLight.copyWith(
                      color: AppColors.kBlack54,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              member.avatar,
              width: 100,
              height: 88,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
