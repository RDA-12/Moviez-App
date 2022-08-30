import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController emailCtrl;
  late final TextEditingController pwdCtrl;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
    pwdCtrl = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void dispose() {
    emailCtrl.dispose();
    pwdCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Login",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                kLoginWords,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const VerticalSpace(height: 18),
              EmailInput(controller: emailCtrl),
              const VerticalSpace(height: 10),
              PasswordInput(controller: pwdCtrl),
              const VerticalSpace(height: 10),
              SizedBox(
                width: double.infinity,
                child: BlocListener<AuthBloc, AuthState>(
                  listener: (context, state) {
                    if (state is Authenticating) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Loading ..."),
                        ));
                    }
                    if (state is Authenticated) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text(kLoginSuccess),
                        ));
                      context.router.replaceAll([const HomeWrapper()]);
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
                    child: const Text("Login"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        final String email = emailCtrl.text;
                        final String password = pwdCtrl.text;
                        context.read<AuthBloc>().add(Login(
                              email: email,
                              password: password,
                            ));
                      }
                    },
                  ),
                ),
              ),
              const VerticalSpace(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(kDontHaveAnAccount),
                  GestureDetector(
                    child: Text(
                      kRegisterHere,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    onTap: () {
                      context.router.replace(const RegisterRoute());
                    },
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
