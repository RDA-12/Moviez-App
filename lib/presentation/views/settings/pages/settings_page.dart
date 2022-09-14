import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../bloc/bloc.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/account_section.dart';
import '../widgets/preferences_section.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AccountSection(),
            const VerticalSpace(height: 12),
            const PreferencesSection(),
            const VerticalSpace(height: 12),
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
              child: CustomElevetedButton(
                content: const Text(kLogOut),
                onPressed: () {
                  context.read<AuthBloc>().add(Logout());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
