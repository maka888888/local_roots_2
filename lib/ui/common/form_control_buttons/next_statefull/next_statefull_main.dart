import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FormControlButtonNextState extends StatelessWidget {
  final bool isSaving;
  const FormControlButtonNextState({super.key, required this.isSaving});

  @override
  Widget build(BuildContext context) {
    if (isSaving) {
      return const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      );
    } else {
      return Text(AppLocalizations.of(context)!.next.toUpperCase());
    }
  }
}
