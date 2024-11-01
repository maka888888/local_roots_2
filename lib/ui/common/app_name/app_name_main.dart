import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppNameMain extends StatelessWidget {
  const AppNameMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/images/logo_512_no_back.png',
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(AppLocalizations.of(context)!.appName),
      ],
    );
  }
}
