import 'package:chat_app/src/app/routes/app_routes.dart';
import 'package:chat_app/src/package/resocues/theme.dart';
import 'package:chat_app/src/package/resocues/theme_provider.dart';
import 'package:chat_app/src/ui/splash/splash_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      darkTheme: darkTheme,
      themeMode: themeProvider.themeMode,
      routes: AppRoutes.myRoutes,
      initialRoute: SplashScreenView.routeName,
    );
  }
}
