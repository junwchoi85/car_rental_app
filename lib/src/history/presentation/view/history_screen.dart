import 'package:car_rental_app/core/common/widgets/not_found_text.dart';
import 'package:car_rental_app/src/history/presentation/bloc/history_bloc.dart';
import 'package:car_rental_app/src/history/presentation/widget/history_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HistoryBloc>().add(const LoadHistoryEvent());

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Booking History'),
      ),
      body: BlocConsumer<HistoryBloc, HistoryState>(
        listener: (context, state) {
          if (state is HistoryError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          if (state is HistoryLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if ((state is HistoryLoaded && state.historyList.isEmpty) ||
              state is HistoryError) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HistoryBloc>().add(const LoadHistoryEvent());
              },
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return const NotFoundText('No history available.');
                },
              ),
              // child: const Center(child: Text('No history available.')),
              // child: const NotFoundText('No history available.'),
            );
          } else if (state is HistoryLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HistoryBloc>().add(const LoadHistoryEvent());
              },
              child: ListView.builder(
                itemCount: state.historyList.length,
                itemBuilder: (context, index) {
                  final history = state.historyList[index];
                  return HistoryListTile(history: history);
                },
              ),
            );
          } else if (state is HistoryError) {
            return Center(child: Text('Error: ${state.message}'));
          } else {
            return const Center(child: Text('No history available.'));
          }
        },
      ),
    );
  }
}
