import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../bloc/auth/auth_bloc.dart';
import '../../../routes/routes.gr.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/email_input.dart';
import '../widgets/password_input.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late final TextEditingController emailCtrl;
  late final TextEditingController pwdCtrl;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailCtrl = TextEditingController();
    pwdCtrl = TextEditingController();
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
                kRegister,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                kRegisterWords,
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const VerticalSpace(height: 18),
              EmailInput(controller: emailCtrl),
              const VerticalSpace(height: 10),
              PasswordInput(controller: pwdCtrl),
              const VerticalSpace(height: 10),
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
                        content: Text(kRegisterSuccess),
                      ));
                    context.router.replace(const LoginRoute());
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
                  content: const Text(kRegister),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      FocusManager.instance.primaryFocus?.unfocus();
                      final String email = emailCtrl.text;
                      final String password = pwdCtrl.text;
                      context.read<AuthBloc>().add(Register(
                            email: email,
                            password: password,
                          ));
                    }
                  },
                ),
              ),
              const VerticalSpace(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(kAlreadyHaveAnAccount),
                  GestureDetector(
                    child: Text(
                      kLoginHere,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    onTap: () {
                      context.router.replace(const LoginRoute());
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
