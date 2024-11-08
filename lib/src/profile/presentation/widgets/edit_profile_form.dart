import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/extensions/string_extensions.dart';
import 'package:car_rental_app/src/profile/presentation/widgets/edit_profile_form_field.dart';
import 'package:flutter/material.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({
    super.key,
    required this.fullNameController,
    required this.emailController,
    required this.oldPasswordController,
    required this.passwordController,
  });

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController oldPasswordController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EditProfileFormField(
          fieldTitle: 'Full Name',
          controller: fullNameController,
          hintText: context.currentUser!.fullName,
        ),
        EditProfileFormField(
          fieldTitle: 'Email',
          controller: emailController,
          hintText: context.currentUser!.email.obscureEmail,
          readOnly: true,
        ),
        EditProfileFormField(
          fieldTitle: 'Current Password',
          controller: oldPasswordController,
          hintText: '*******',
        ),
        StatefulBuilder(builder: (_, setState) {
          oldPasswordController.addListener(() => setState(() {}));
          return EditProfileFormField(
            fieldTitle: 'New Password',
            controller: passwordController,
            hintText: '*******',
            readOnly: oldPasswordController.text.isEmpty,
          );
        }),
      ],
    );
  }
}
