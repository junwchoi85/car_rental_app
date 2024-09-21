import 'dart:io';

import 'package:car_rental_app/core/common/widgets/gradient_background.dart';
import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/utils/core_utils.dart';
import 'package:car_rental_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
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
          ),
          body: GradientBackground(
            child: ListView(),
            image: MediaRes.defaultGradientBackground,
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
