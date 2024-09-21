import 'dart:async';

import 'package:car_rental_app/core/common/widgets/popup_item.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:car_rental_app/src/profile/presentation/views/edit_profile_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Account',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        PopupMenuButton(
          itemBuilder: (_) => [
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Edit Profile',
                icon: Icon(
                  Icons.edit_outlined,
                  color: context.theme.primaryColor,
                ),
              ),
              onTap: () => context.push(
                BlocProvider(
                  create: (_) => sl<AuthBloc>(),
                  child: const EditProfileView(),
                ),
              ),
            ),
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Notification',
                icon: Icon(
                  Icons.notifications,
                  color: context.theme.primaryColor,
                ),
              ),
              onTap: () => context.push(const Placeholder()),
            ),
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Help',
                icon: Icon(
                  Icons.help_outline,
                  color: context.theme.primaryColor,
                ),
              ),
              onTap: () => context.push(const Placeholder()),
            ),
            const PopupMenuItem<void>(
              height: 1,
              padding: EdgeInsets.zero,
              child: Divider(
                height: 1,
                color: Colors.grey,
                indent: 16,
                endIndent: 16,
              ),
            ),
            PopupMenuItem<void>(
              child: PopupItem(
                title: 'Log Out',
                icon: Icon(
                  Icons.logout_outlined,
                  color: context.theme.primaryColor,
                ),
              ),
              onTap: () async {
                final navigator = Navigator.of(context);
                await FirebaseAuth.instance.signOut();
                unawaited(
                  navigator.pushNamedAndRemoveUntil(
                    '/',
                    (route) => false,
                  ),
                );
              },
            ),
          ],
          offset: const Offset(0, 50),
          icon: const Icon(
            Icons.more_horiz,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
