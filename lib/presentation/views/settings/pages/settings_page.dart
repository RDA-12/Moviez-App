import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../routes/routes.gr.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
