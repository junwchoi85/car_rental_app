import 'dart:convert';
import 'dart:io';

import 'package:car_rental_app/core/common/enums/update_user.dart';
import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/utils/core_utils.dart';
import 'package:car_rental_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental_app/src/profile/presentation/widgets/edit_profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final oldPasswordController = TextEditingController();

  File? pickedImage;

  Future<void> pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        pickedImage = File(image.path);
      });
    }
  }

  bool get nameChanged =>
      context.currentUser?.fullName.trim() != fullNameController.text.trim();
  bool get emailChanged => emailController.text.trim().isNotEmpty;
  bool get passwordChanged => passwordController.text.trim().isNotEmpty;
  bool get imageChanged => pickedImage != null;
  bool get nothingChanged =>
      !nameChanged && !emailChanged && !passwordChanged && !imageChanged;

  @override
  void initState() {
    fullNameController.text = context.currentUser!.fullName.trim();
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    oldPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: const NestedBackButton(),
            title: const Text(
              'Edit Profile',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  if (nothingChanged) context.pop();
                  final bloc = context.read<AuthBloc>();
                  if (passwordChanged) {
                    if (oldPasswordController.text.trim().isEmpty) {
                      CoreUtils.showSnackBar(
                        context,
                        'Please enter your old password',
                      );
                      return;
                    }
                    bloc.add(
                      UpdateUserEvent(
                        action: UpdateUserAction.password,
                        userData: jsonEncode({
                          'oldPassword': oldPasswordController.text.trim(),
                          'newPassword': passwordController.text.trim(),
                        }),
                      ),
                    );
                  }
                  if (nameChanged) {
                    bloc.add(
                      UpdateUserEvent(
                        action: UpdateUserAction.displayName,
                        userData: fullNameController.text.trim(),
                      ),
                    );
                  }
                  if (emailChanged) {
                    bloc.add(
                      UpdateUserEvent(
                        action: UpdateUserAction.email,
                        userData: emailController.text.trim(),
                      ),
                    );
                  }
                  if (imageChanged) {
                    bloc.add(
                      UpdateUserEvent(
                        action: UpdateUserAction.profilePic,
                        userData: pickedImage,
                      ),
                    );
                  }
                },
                child: state is AuthLoading
                    ? const Center(child: CircularProgressIndicator())
                    : StatefulBuilder(builder: (_, refresh) {
                        fullNameController.addListener(() => refresh(() {}));
                        emailController.addListener(() => refresh(() {}));
                        passwordController.addListener(() => refresh(() {}));

                        return Text(
                          'Done',
                          style: TextStyle(
                            color: nothingChanged
                                ? context.theme.primaryColor
                                : Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
              ),
            ],
          ),
          body: GradientBackground(
            image: MediaRes.defaultGradientBackground,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Builder(builder: (context) {
                  final user = context.currentUser!;
                  final userImage =
                      user.profilePic == null || user.profilePic!.isEmpty
                          ? null
                          : user.profilePic;
                  return CircleAvatar(
                    radius: 50,
                    backgroundImage: pickedImage != null
                        ? FileImage(pickedImage!)
                        : userImage != null
                            ? NetworkImage(userImage)
                            : const AssetImage(MediaRes.emptyAvatar)
                                as ImageProvider,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        IconButton(
                          icon: Icon((pickedImage != null || userImage != null)
                              ? Icons.edit
                              : Icons.add_a_photo),
                          onPressed: pickImage,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'We recommend an image of at least 400X400',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                EditProfileForm(
                  fullNameController: fullNameController,
                  emailController: emailController,
                  oldPasswordController: oldPasswordController,
                  passwordController: passwordController,
                ),
              ],
            ),
          ),
        );
      },
      listener: (context, state) {
        if (state is UserUpdated) {
          CoreUtils.showSnackBar(context, 'Profile updated successfully');
          context.pop();
        } else if (state is AuthError) {
          CoreUtils.showSnackBar(context, state.message);
        }
      },
    );
  }
}
