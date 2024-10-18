import 'package:car_rental_app/src/history/domain/entities/history.dart';
import 'package:flutter/material.dart';

class HistoryListTile extends StatelessWidget {
  final History history;
  const HistoryListTile({
    super.key,
    required this.history,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      subtitle: Text(history.vehicleName),
      trailing: Text(history.pickUpDate),
    );
  }
}
