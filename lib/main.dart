import 'package:car_rental_app/core/common/app/providers/user_provider.dart';
import 'package:car_rental_app/core/services/injection_container.dart';
import 'package:car_rental_app/core/services/router.dart';
import 'package:car_rental_app/firebase_options.dart';
import 'package:car_rental_app/src/dashboard/providers/dashboard_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // Theme
  ThemeMode systemThemeMode = ThemeMode.system;
  bool useMaterial3 = true;

  @override
  Widget build(BuildContext context) {
    const FlexScheme usedFlexScheme = FlexScheme.bigStone;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car Rental App',
        theme: FlexThemeData.light(
          scheme: usedFlexScheme,
          visualDensity: FlexColorScheme.comfortablePlatformDensity,
          appBarElevation: 0.5,
          useMaterial3: useMaterial3,
          typography: Typography.material2021(platform: defaultTargetPlatform),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        darkTheme: FlexThemeData.dark(
          scheme: usedFlexScheme,
          appBarElevation: 2,
          useMaterial3: useMaterial3,
          typography: Typography.material2021(platform: defaultTargetPlatform),
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        themeMode: systemThemeMode,
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
