import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviez_app/presentation/views/settings/widgets/account_item.dart';

import '../../../routes/routes.gr.dart';
import '../../widgets/vertical_space.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
              ),
        ),
        const VerticalSpace(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AccountItem(
              title: "Profile",
              onTap: () {
                context.router.push(const ProfileRoute());
              },
            ),
            AccountItem(
              title: "Favorites",
              onTap: () {
                context.router.push(FavoriteRoute(inHome: false));
              },
            ),
            AccountItem(
              title: "Watchlists",
              onTap: () {
                context.router.push(const WatchlistRoute());
              },
            ),
          ],
        ),
      ],
    );
  }
}
