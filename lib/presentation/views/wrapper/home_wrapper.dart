import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:moviez_app/presentation/routes/routes.gr.dart';

class HomeWrapper extends StatelessWidget {
  const HomeWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
        routes: const [
          HomeRoute(),
          FavoriteRoute(),
          NewsRoute(),
          SettingsRoute(),
        ],
        appBarBuilder: (_, tabsRouter) {
          return AppBar(
            title: const Text("Moviezzz"),
          );
        },
        bottomNavigationBuilder: (_, tabsRouter) {
          return BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (idx) {
              tabsRouter.setActiveIndex(idx);
            },
            items: [
              BottomNavigationBarItem(
                label: "Home",
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: "Favorite",
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.favorite),
              ),
              BottomNavigationBarItem(
                label: "News",
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.newspaper),
              ),
              BottomNavigationBarItem(
                label: "Settings",
                backgroundColor: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.settings),
              ),
            ],
          );
        });
  }
}
