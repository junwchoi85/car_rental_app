import 'package:flutter/material.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Car Hire'),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
