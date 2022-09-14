import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../routes/routes.gr.dart';

class DashboardWrapper extends StatelessWidget {
  const DashboardWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: [
          const HomeWrapper(),
          FavoriteRoute(inHome: true),
          const NewsWrapper(),
          const SettingsWrapper(),
        ],
        appBarBuilder: (_, tabsRouter) {
          return AppBar(
            title: const Text("Moviezzz"),
          );
        },
        bottomNavigationBuilder: (_, tabsRouter) {
          return Theme(
            data: ThemeData(
              textTheme: Theme.of(context).textTheme.copyWith(
                    caption: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
            ),
            child: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (idx) {
                tabsRouter.setActiveIndex(idx);
              },
              items: [
                BottomNavigationBarItem(
                  label: "Home",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.home,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Favorite",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "News",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.newspaper,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: "Settings",
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  icon: Icon(
                    Icons.settings,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
