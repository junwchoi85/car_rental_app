import 'package:car_rental_app/core/common/widgets/nested_back_button.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/src/booking/presentation/view/improve_trip_view.dart';
import 'package:flutter/material.dart';

class ChooseCoverageView extends StatefulWidget {
  const ChooseCoverageView({super.key});

  @override
  State<ChooseCoverageView> createState() => _ChooseCoverageViewState();
}

class _ChooseCoverageViewState extends State<ChooseCoverageView> {
  bool isNoProtection = false;
  bool _isAdded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const NestedBackButton(),
        title: const Text('Choose Coverage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Let\'s Get You Protected',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.transparent,
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0.5,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 144,
                        width: double.infinity,
                        child: Column(
                          children: [
                            SizedBox(height: 24),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Protect the car',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Icon(
                                  Icons.verified_user_rounded,
                                  color: Colors.green,
                                  size: 18.0, // Adjust the size as needed
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Rental vehicle damage',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Row(
                              children: [
                                Text(
                                  '\$ 24.10',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    '\\day',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // 상단 꾸밈
                  Positioned(
                    top: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(9),
                          // topRight: Radius.circular(16),
                          // bottomLeft: Radius.circular(4),
                          bottomRight: Radius.circular(9),
                        ),
                        border: Border.all(
                          color: Colors.green,
                          width: 2,
                        ),
                        color: Colors.green,
                      ),
                      child: const SizedBox(
                        height: 24,
                        width: 96,
                        child: Center(
                          child: Text(
                            'Recommended',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //하단 꾸밈
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            // topLeft: Radius.circular(9),
                            // topRight: Radius.circular(16),
                            bottomLeft: Radius.circular(9),
                            bottomRight: Radius.circular(9),
                          ),
                          color: Colors.lightGreen[200]),
                      child: const SizedBox(
                        height: 24,
                        width: double.infinity,
                        child: Center(
                          child: Row(
                            children: [
                              Spacer(),
                              Icon(Icons.fiber_manual_record_rounded,
                                  color: Colors.green, size: 10),
                              SizedBox(width: 4),
                              Text(
                                '1.6 bought in 2023',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // 버튼
                  Visibility(
                    visible: !_isAdded,
                    child: Positioned(
                      bottom: 24,
                      right: 12,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isAdded = true;
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.add, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Add',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _isAdded,
                    child: Positioned(
                      bottom: 24,
                      right: 12,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            _isAdded = false;
                          });
                        },
                        child: const Row(
                          children: [
                            Icon(Icons.done, color: Colors.white, size: 16),
                            SizedBox(width: 4),
                            Text(
                              'Added',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //   top: 12,
                  //   right: 24,
                  //   child: Image.asset(
                  //     MediaRes.protectCar,
                  //     width: 80, // Adjust the width as needed
                  //     height: 80, // Adjust the height as needed
                  //   ),
                  // ),
                ],
              ),
            ),
            Visibility(
              visible: !_isAdded,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: Colors.transparent,
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.5,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 260,
                          width: double.infinity,
                          child: Column(
                            children: [
                              const SizedBox(height: 24),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Continue Without Protection',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Your personal insurance or credit card may not '
                                  'fully cover this trip. You may have deductibles, '
                                  'premium increases or admin fees out of pocket.',
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.verified_user_rounded,
                                    color: Colors.green,
                                    size: 18.0, // Adjust the size as needed
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Rental vehicle damage',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                    value: isNoProtection,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isNoProtection = value!;
                                      });
                                    },
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'I accept responsibility for any damage '
                                      'to or theft of the rental vehicle.',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: isNoProtection
                                      ? () {
                                          context.push(const ImproveTripView());
                                        }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isNoProtection
                                        ? Colors.black
                                        : Colors.grey, // 버튼의 배경색
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          24), // 버튼의 둥근 테두리
                                    ),
                                  ),
                                  child: const Text(
                                    'continue',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // 상단 꾸밈
                    Positioned(
                      top: 0,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(9),
                            // topRight: Radius.circular(16),
                            // bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(9),
                          ),
                          color: Colors.red[900],
                        ),
                        child: const SizedBox(
                          height: 24,
                          width: 96,
                          child: Center(
                            child: Text(
                              'No Protection',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Visibility(
              visible: _isAdded,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.theme.primaryColor,
                      foregroundColor: context.theme.colorScheme.onPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      context.push(const ImproveTripView());
                    },
                    child: const Text(
                      'Continue',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
