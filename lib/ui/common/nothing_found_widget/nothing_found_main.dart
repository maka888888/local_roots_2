import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NothingFoundMainWidgetMain extends StatelessWidget {
  const NothingFoundMainWidgetMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(Icons.search_off_outlined),
        const SizedBox(height: 10),
        Text(AppLocalizations.of(context)!.nothingFound),
      ],
    );
  }
}
