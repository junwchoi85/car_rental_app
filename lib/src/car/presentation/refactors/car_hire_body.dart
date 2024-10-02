import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/core/resources/media_res.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/src/branch/data/models/branch_model.dart';
import 'package:car_rental_app/src/branch/presentation/bloc/branch_bloc.dart';
import 'package:car_rental_app/src/branch/presentation/view/search_branch_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarHireBody extends StatefulWidget {
  const CarHireBody({super.key});

  @override
  State<CarHireBody> createState() => _CarHireBodyState();
}

class _CarHireBodyState extends State<CarHireBody> {
  @override
  Widget build(BuildContext context) {
    final branchModelData = context.tabNavigator.popData;
    final result = branchModelData as BranchModel?;

    return Scaffold(
      body: Column(
        children: [
          Image.asset(MediaRes.travel),
          const SizedBox(height: 8),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hire a car.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: TextEditingController(text: result?.name),
                    decoration: const InputDecoration(
                      hintText: 'Pick-Up Location',
                      border: OutlineInputBorder(),
                    ),
                    enabled: false,
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () => context.push(
                    // const SearchBranchView()),
                    BlocProvider(
                      create: (_) => sl<BranchBloc>(),
                      child: const SearchBranchView(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:car_rental_app/core/common/widgets/custom_time_picker.dart';
// import 'package:car_rental_app/src/car/presentation/widget/car_hire_app_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class CarHireScreen extends StatefulWidget {
//   const CarHireScreen({super.key});

//   @override
//   _CarHireScreenState createState() => _CarHireScreenState();
// }

// class _CarHireScreenState extends State<CarHireScreen> {
//   final TextEditingController _pickUpLocationController =
//       TextEditingController();
//   final TextEditingController _dropOffLocationController =
//       TextEditingController();
//   final TextEditingController _pickUpTimeController = TextEditingController();
//   final TextEditingController _dropOffTimeController = TextEditingController();
//   DateTime? _pickUpDate;
//   DateTime? _dropOffDate;
//   TimeOfDay? _pickUpTime;
//   TimeOfDay? _dropOffTime;

//   Future<void> _selectDate(BuildContext context, bool isPickUp) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         if (isPickUp) {
//           _pickUpDate = pickedDate;
//         } else {
//           _dropOffDate = pickedDate;
//         }
//       });
//     }
//   }

//   void _selectTime(BuildContext context, bool isPickUp) {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return CustomTimePicker(
//           onTimeSelected: (TimeOfDay selectedTime) {
//             setState(() {
//               final formattedTime = selectedTime.format(context);
//               if (isPickUp) {
//                 _pickUpTimeController.text = formattedTime;
//               } else {
//                 _dropOffTimeController.text = formattedTime;
//               }
//             });
//           },
//         );
//       },
//     );
//   }

//   String _formatDate(DateTime? date) {
//     if (date == null) return 'Select date';
//     return "${date.year}-${date.month}-${date.day}";
//   }

//   String _formatTime(TimeOfDay? time) {
//     if (time == null) return 'Select time';
//     return time.format(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const CarHireAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _pickUpLocationController,
//               decoration: const InputDecoration(labelText: 'Pick-Up Location'),
//             ),
//             TextField(
//               controller: _dropOffLocationController,
//               decoration: const InputDecoration(labelText: 'Drop-Off Location'),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration:
//                         const InputDecoration(labelText: 'Pick-Up Date'),
//                     controller: TextEditingController(
//                       text: _formatDate(_pickUpDate),
//                     ),
//                     readOnly: true,
//                     onTap: () => _selectDate(context, true),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     controller: _pickUpTimeController,
//                     onTap: () => _selectTime(context, true),
//                     readOnly: true,
//                   ),
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     decoration:
//                         const InputDecoration(labelText: 'Drop-Off Date'),
//                     controller: TextEditingController(
//                       text: _formatDate(_dropOffDate),
//                     ),
//                     readOnly: true,
//                     onTap: () => _selectDate(context, false),
//                   ),
//                 ),
//                 Expanded(
//                   child: TextField(
//                     decoration:
//                         const InputDecoration(labelText: 'Drop-Off Time'),
//                     controller: TextEditingController(
//                       text: _formatTime(_dropOffTime),
//                     ),
//                     readOnly: true,
//                     onTap: () => _selectTime(context, false),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
