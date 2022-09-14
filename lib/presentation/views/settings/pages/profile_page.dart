import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moviez_app/presentation/routes/routes.gr.dart';
import 'package:path/path.dart' as p;

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/user.dart';
import '../../../bloc/user/user_bloc.dart';
import '../../widgets/custom_eleveted_button.dart';
import '../../widgets/vertical_space.dart';
import '../widgets/avatar.dart';
import '../widgets/info_row.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ImagePicker imagePicker;
  Map<String, dynamic> data = {};
  late final TextEditingController emailCtrl;
  late final TextEditingController usernameCtrl;
  late final TextEditingController passwordCtrl;

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(GetUser());
    imagePicker = ImagePicker();
    emailCtrl = TextEditingController();
    usernameCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (_, state) {
        if (state is LoadingUserOperation) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text("loading ..."),
              ),
            );
        }
        if (state is UserOperationSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(kUpdateSuccess),
              ),
            );
          context.read<UserBloc>().add(GetUser());
          clearState();
        }
        if (state is UserOperationFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.msg),
              ),
            );
        }
        if (state is UserDeleted) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(
                content: Text(kUserDeletedSuccessfully),
              ),
            );
          context.router.replaceAll([const AuthWrapper()]);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text("Profile")),
        body: BlocBuilder<UserBloc, UserState>(
          buildWhen: (_, currentState) {
            return (currentState is LoadingUser ||
                currentState is UserLoaded ||
                currentState is UserLoadingError);
          },
          builder: (_, state) {
            if (state is UserInitial || state is LoadingUser) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UserLoadingError) {
              return Center(
                child: IconButton(
                  icon: const Icon(Icons.restart_alt_rounded),
                  onPressed: () {
                    context.read<UserBloc>().add(GetUser());
                  },
                ),
              );
            }
            if (state is UserLoaded) {
              final User user = state.user;
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Avatar(
                        profileImgUrl: user.profileImgUrl,
                        data: data["imageBytes"],
                        onTap: () async {
                          final Map<String, dynamic>? newData =
                              await pickImage();
                          if (newData != null) {
                            setState(() {
                              data = newData;
                            });
                          }
                        },
                      ),
                      const VerticalSpace(height: 12),
                      InfoRow(
                        title: "Username",
                        data: user.username,
                        controller: usernameCtrl,
                      ),
                      InfoRow(
                        title: "Email",
                        data: user.email,
                        controller: emailCtrl,
                      ),
                      InfoRow(
                        title: "Password",
                        data: "*********",
                        controller: passwordCtrl,
                      ),
                      const VerticalSpace(height: 12),
                      CustomElevetedButton(
                        content: const Text("Save"),
                        onPressed: () {
                          if (usernameCtrl.text.isNotEmpty ||
                              emailCtrl.text.isNotEmpty ||
                              passwordCtrl.text.isNotEmpty ||
                              data.isNotEmpty) {
                            context.read<UserBloc>().add(
                                  UpdateUser(
                                    username: usernameCtrl.text,
                                    email: emailCtrl.text,
                                    password: passwordCtrl.text,
                                    image: data,
                                  ),
                                );
                          }
                        },
                      ),
                      const VerticalSpace(height: 5),
                      CustomElevetedButton(
                        color: Theme.of(context).colorScheme.error,
                        content: const Text(kDeleteAccount),
                        onPressed: () {
                          context.read<UserBloc>().add(DeleteUser());
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
            return const Center(
              child: Text(kUnexpectedError),
            );
          },
        ),
      ),
    );
  }

  void clearState() {
    emailCtrl.clear();
    passwordCtrl.clear();
    usernameCtrl.clear();
    data.clear();
  }

  Future<Map<String, dynamic>?> pickImage() async {
    final XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (imageFile != null) {
      final String fileName = p.basename(imageFile.path);
      final Uint8List imageBytes = await imageFile.readAsBytes();
      return {
        "fileName": fileName,
        "imageBytes": imageBytes,
      };
    }
    return null;
  }
}
