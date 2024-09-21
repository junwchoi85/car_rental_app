import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NestedBackButton extends StatelessWidget {
  const NestedBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        try {
          context.pop();
          return false;
        } catch (_) {
          return true;
        }
      },
      child: IconButton(
        icon: defaultTargetPlatform == TargetPlatform.iOS
            ? const Icon(Icons.arrow_back_ios_new)
            : const Icon(Icons.arrow_back),
        onPressed: () {
          try {
            context.pop();
          } catch (_) {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
