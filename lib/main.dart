import 'package:app_dual_theme/app/utils/Theme/theme_app.dart';
import 'package:app_dual_theme/app/utils/colors/app_colosrs.dart';
import 'package:app_dual_theme/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  bool isLightTheme = preferences.getBool(SPref.isLight) ?? true;
  runApp(AppStart(
    isLightTheme: isLightTheme,
  ));
}

class AppStart extends StatelessWidget {
  final bool isLightTheme;
  const AppStart({super.key, required this.isLightTheme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeAppProvider(isLightTheme: isLightTheme),
        )
      ],
      child: const AppWidget(),
    );
  }
}
