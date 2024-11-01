import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormControlButtonNext extends StatelessWidget {
  const FormControlButtonNext({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(AppLocalizations.of(context)!.next.toUpperCase());
  }
}
