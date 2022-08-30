import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/strings.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../routes/routes.gr.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      context.read<AuthBloc>().add(LoginCheck());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (_, state) {
        if (state is Authenticated) {
          context.router.replaceAll([const HomeRoute()]);
        } else if (state is UnAuthenticated) {
          context.router.replaceAll([const DashboardWrapper()]);
        } else {
          context.router.replaceAll([
            ErrorRoute(message: kUnexpectedError),
          ]);
        }
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
