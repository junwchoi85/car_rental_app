import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:flutter/material.dart';

class ReviewDetailsView extends StatefulWidget {
  const ReviewDetailsView({super.key});

  @override
  State<ReviewDetailsView> createState() => _ReviewDetailsViewState();
}

class _ReviewDetailsViewState extends State<ReviewDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
        title: Text('Review Details'),
      ),
      body: Center(
        child: Text('Review Details'),
      ),
    );
  }
}
