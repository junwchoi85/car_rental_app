import 'package:car_rental_app/core/common/app/providers/user_provider.dart';
import 'package:car_rental_app/core/extensions/context_extension.dart';
import 'package:car_rental_app/src/auth/data/models/user_model.dart';
import 'package:car_rental_app/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:car_rental_app/src/dashboard/presentation/utils/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();

    /// Set the orientation of the screen to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LocalUserModel>(
      stream: DashboardUtils.userDataStream,
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data is LocalUserModel) {
          context.read<UserProvider>().user = snapshot.data;
        }
        return Consumer<DashboardController>(builder: (_, controller, __) {
          return Scaffold(
            body: IndexedStack(
              index: controller.currentIndex,
              children: controller.screens,
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.currentIndex,
              showSelectedLabels: false,
              backgroundColor: Colors.white,
              elevation: 8,
              onTap: controller.changeIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.directions_car_filled_outlined,
                    color: controller.currentIndex == 0
                        ? context.theme.primaryColor
                        : Colors.grey,
                    // size: controller.currentIndex == 0 ? 30 : 24,
                  ),
                  label: 'Booking',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.book_outlined,
                    color: controller.currentIndex == 1
                        ? context.theme.primaryColor
                        : Colors.grey,
                    // size: controller.currentIndex == 1 ? 30 : 24,
                  ),
                  label: 'History',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.chat,
                    color: controller.currentIndex == 2
                        ? context.theme.primaryColor
                        : Colors.grey,
                    // size: controller.currentIndex == 2 ? 30 : 24,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.white,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.account_circle,
                    color: controller.currentIndex == 3
                        ? context.theme.primaryColor
                        : Colors.grey,
                    // size: controller.currentIndex == 3 ? 30 : 24,
                  ),
                  label: 'Home',
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          );
        });
      },
    );
  }
}
