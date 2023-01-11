import 'package:app_dual_theme/app/utils/Theme/theme_app.dart';
import 'package:app_dual_theme/app/utils/colors/app_colosrs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BodyInformations extends StatelessWidget {
  const BodyInformations({
    Key? key,
    required this.size,
    required this.themeAppProvider,
  }) : super(key: key);

  final Size size;
  final ThemeAppProvider themeAppProvider;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.H().format(DateTime.now()),
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              width: size.width * .2,
              child: const Divider(
                height: 0,
                thickness: 1,
                color: AppColorsTheme.white,
              ),
            ),
            Text(
              DateFormat.m().format(DateTime.now()),
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: AppColorsTheme.white,
                  ),
            ),
            const Spacer(),
            const Text(
              "Claro/Escuro\nPersonalizar\nAlternar",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              width: size.width * .2,
              height: size.width * .2,
              decoration: BoxDecoration(
                color: themeAppProvider.themeMode().switchColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.nights_stay_outlined,
                size: 50,
                color: AppColorsTheme.white,
              ),
            ),
            SizedBox(
              width: size.width * .2,
              child: const Divider(
                // height: 0,
                thickness: 1,
                color: AppColorsTheme.white,
              ),
            ),
            Text(
              "30\u00B0C",
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: AppColorsTheme.white,
                  ),
            ),
            Text(
              "Claro",
              style: Theme.of(context).textTheme.headline6,
            ),
            Text(
              DateFormat.MMMEd('pt_BR').format(DateTime.now()),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
