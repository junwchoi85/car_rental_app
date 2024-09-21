import 'package:car_rental_app/core/common/app/providers/user_provider.dart';
import 'package:car_rental_app/src/profile/presentation/widgets/user_info_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, provider, __) {
        final user = provider.user;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                    infoThemeColor: Colors.white,
                    infoIcon: const Icon(
                      Icons.book,
                      size: 24,
                    ),
                    infoTitle: 'Something',
                    infoValue: user!.points.toString(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: UserInfoCard(
                    infoThemeColor: Colors.white,
                    infoIcon: const Icon(
                      Icons.calendar_month,
                      size: 24,
                    ),
                    infoTitle: 'Something',
                    infoValue: user.points.toString(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: UserInfoCard(
                    infoThemeColor: Colors.white,
                    infoIcon: const Icon(
                      Icons.car_crash,
                      size: 24,
                    ),
                    infoTitle: 'Something',
                    infoValue: user.points.toString(),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: UserInfoCard(
                    infoThemeColor: Colors.white,
                    infoIcon: const Icon(
                      Icons.point_of_sale,
                      size: 24,
                    ),
                    infoTitle: 'Something',
                    infoValue: user.points.toString(),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
