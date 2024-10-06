import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTimePicker extends StatefulWidget {
  final Function(TimeOfDay) onTimeSelected;

  const CustomTimePicker({super.key, required this.onTimeSelected});

  @override
  State<CustomTimePicker> createState() => _CustomTimePickerState();
}

class _CustomTimePickerState extends State<CustomTimePicker> {
  // from 9 AM to 6 PM
  final List<int> _hours = List<int>.generate(10, (index) => 9 + index);
  // 15-minute intervals
  final List<int> _minutes = [0, 15, 30, 45];

  int _selectedHour = 9;
  int _selectedMinute = 0;
  TimeOfDay? _selectedTime;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 시 선택 Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedHour = _hours[index];
                      });
                    },
                    children: _hours.map((hour) {
                      final formattedHour = hour < 12
                          ? 'AM  ${hour.toString().padLeft(2, '0')}'
                          : 'PM  ${(hour == 12 ? 12 : hour - 12).toString().padLeft(2, '0')}';
                      return Center(
                        child: Text(
                          formattedHour,
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                // 분 선택 Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController:
                        FixedExtentScrollController(initialItem: 0),
                    itemExtent: 40,
                    onSelectedItemChanged: (index) {
                      setState(() {
                        _selectedMinute = _minutes[index];
                      });
                    },
                    children: _minutes.map((minute) {
                      return Center(
                        child: Text(
                          minute.toString().padLeft(2, '0'),
                          style: const TextStyle(fontSize: 20),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          // OK 버튼
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: context.theme.secondaryHeaderColor,
              foregroundColor: context.theme.colorScheme.onSecondary,
            ),
            onPressed: () {
              setState(() {
                _selectedTime =
                    TimeOfDay(hour: _selectedHour, minute: _selectedMinute);
              });
              widget.onTimeSelected(_selectedTime!);
              Navigator.pop(context);
            },
            child: const Text("Select Time"),
          ),
        ],
      ),
    );
  }
}
