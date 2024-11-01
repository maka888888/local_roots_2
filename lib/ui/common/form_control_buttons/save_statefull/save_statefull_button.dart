import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormControlButtonSaveState extends StatelessWidget {
  final bool isSaving;
  const FormControlButtonSaveState({super.key, required this.isSaving});

  @override
  Widget build(BuildContext context) {
    if (isSaving) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      );
    } else {
      return Text(AppLocalizations.of(context)!.save.toUpperCase());
    }
  }
}
