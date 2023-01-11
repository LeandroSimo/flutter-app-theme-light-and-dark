import 'package:app_dual_theme/app/utils/Theme/theme_app.dart';
import 'package:app_dual_theme/app/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});
  @override
  Widget build(BuildContext context) {
    ThemeAppProvider themeAppProvider = Provider.of<ThemeAppProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dual Theme',
      theme: themeAppProvider.themeData(),
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
      },
    );
  }
}
