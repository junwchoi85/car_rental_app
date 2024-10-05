import 'package:car_rental_app/core/common/app/providers/tab_navigator.dart';
import 'package:car_rental_app/core/common/views/persistent_view.dart';
import 'package:car_rental_app/src/booking/presentation/view/booking_screen.dart';
import 'package:car_rental_app/src/profile/presentation/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// A class that represents a dashboard controller
/// - [_indexHistory] the history of indexes
/// - [_screens] the list of screens
/// - [_currentIndex] the current index
/// - [changeIndex] change the current index
/// - [goBack] go back to the previous index
/// - [resetIndex] reset the current index
class DashboardController extends ChangeNotifier {
  List<int> _indexHistory = [0];
  final List<Widget> _screens = [
    ChangeNotifierProvider(
      create: (_) => TabNavigator(
        TabItem(child: const BookingScreen()
            // child: BlocProvider(
            //   create: (_) => sl<BranchBloc>(),
            //   child: const CarHireScreen(),
            // ),
            ),
      ),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const Placeholder())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const Placeholder())),
      child: const PersistentView(),
    ),
    ChangeNotifierProvider(
      create: (_) => TabNavigator(TabItem(child: const ProfileScreen())),
      child: const PersistentView(),
    ),
  ];

  List<Widget> get screens => _screens;
  int _currentIndex = 3;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    _indexHistory.add(index);
    notifyListeners();
  }

  void goBack() {
    if (_indexHistory.length > 1) {
      _indexHistory.removeLast();
      _currentIndex = _indexHistory.last;
      notifyListeners();
    }
  }

  void resetIndex() {
    _indexHistory = [0];
    _currentIndex = 0;
    notifyListeners();
  }
}
