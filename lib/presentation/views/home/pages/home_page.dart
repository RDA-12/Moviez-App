import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../routes/routes.gr.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Under development"),
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is Authenticating) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                      content: Text("Loading ..."),
                    ));
                }
                if (state is UnAuthenticated) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(const SnackBar(
                      content: Text(kLogoutSuccess),
                    ));
                  context.router.replaceAll([const LoginRoute()]);
                }
                if (state is AuthenticationError) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      content: Text(state.msg),
                    ));
                }
              },
              child: ElevatedButton(
                child: const Text("Logout"),
                onPressed: () {
                  context.read<AuthBloc>().add(Logout());
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
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
      ),
    );
  }
}
