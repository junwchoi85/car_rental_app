import 'package:car_rental_app/src/branch/presentation/bloc/branch_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BranchBloc, BranchState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Container();
      },
    );
  }
}
