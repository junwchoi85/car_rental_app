import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// A class that represents a tab navigator
/// - [_initialPage] the initial page to be displayed
/// - [_navigationStack] the stack of pages
/// - [currentPage] the current page
/// - [push] push a new page to the stack
/// - [pop] pop the current page from the stack
/// - [popToRoot] pop all pages from the stack except the initial page
/// - [popTo] pop all pages from the stack until the specified page
/// - [popUntil] pop all pages from the stack until the specified page
/// - [pushAndRemoveUntil] push a new page to the stack and remove all pages from the stack except the new page
/// - [notifyListeners] notify the listeners
class TabNavigator extends ChangeNotifier {
  TabNavigator(this._initialPage) {
    _navigationStack.add(_initialPage);
  }

  final TabItem _initialPage;
  final List<TabItem> _navigationStack = [];

  TabItem get currentPage => _navigationStack.last;

  void push(TabItem page) {
    _navigationStack.add(page);
    notifyListeners();
  }

  void pop() {
    if (_navigationStack.length > 1) _navigationStack.removeLast();
    notifyListeners();
  }

  void popToRoot() {
    _navigationStack
      ..clear()
      ..add(_initialPage);
    notifyListeners();
  }

  void popTo(TabItem page) {
    _navigationStack.remove(page);
    notifyListeners();
  }

  void popUntil(TabItem? page) {
    if (page == null) return popToRoot();
    if (_navigationStack.length > 1) {
      _navigationStack.removeRange(1, _navigationStack.indexOf(page) + 1);
      notifyListeners();
    }
  }

  void pushAndRemoveUntil(TabItem page) {
    _navigationStack
      ..clear()
      ..add(page);
    notifyListeners();
  }
}

/// A class that provides the tab navigator
/// - [navigator] the tab navigator
/// - [of] get the tab navigator
/// - [TabNavigatorProvider] the tab navigator provider
/// - [TabItem] the tab item
/// - [TabNavigator] the tab navigator
/// - [TabNavigatorProvider] the tab navigator provider
class TabNavigatorProvider extends InheritedNotifier<TabNavigator> {
  const TabNavigatorProvider({
    required this.navigator,
    required super.child,
    super.key,
  }) : super(notifier: navigator);

  final TabNavigator navigator;

  static TabNavigator? of(BuildContext context) {
    final navigator =
        context.dependOnInheritedWidgetOfExactType<TabNavigatorProvider>();
    return navigator?.navigator;
  }
}

/// A class that represents a tab item
///  - [child] the widget to be displayed
/// - [id] the unique identifier of the tab
class TabItem extends Equatable {
  TabItem({required this.child}) : id = const Uuid().v1();

  final Widget child;
  final String id;

  @override
  List<Object?> get props => [child, id];
}
