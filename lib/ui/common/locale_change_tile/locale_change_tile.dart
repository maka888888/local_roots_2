import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/common/locale/locale.dart';

class ChangeLocaleTile extends ConsumerWidget {
  const ChangeLocaleTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(refLocaleProvider);

    FlagsCode code;
    String language;

    switch (locale.languageCode) {
      case 'en':
        code = FlagsCode.GB;
        language = 'English';
        break;
      case 'lt':
        code = FlagsCode.LT;
        language = 'Lietuvių';
        break;
      default:
        code = FlagsCode.GB;
        language = 'English';
    }

    Future languageSelectionDialog() async {
      await showDialog(
          context: context,
          builder: (BuildContext context) {
            return SimpleDialog(
              title: Text(AppLocalizations.of(context)!.language),
              children: <Widget>[
                SimpleDialogOption(
                  onPressed: () async {
                    await ref
                        .read(refLocaleProvider.notifier)
                        .changeLocale(
                          const Locale('lt'),
                        )
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: ListTile(
                    title: const Text('Lietuvių'),
                    leading: Flag.fromCode(
                      FlagsCode.LT,
                      height: 20,
                      width: 30,
                      flagSize: FlagSize.size_4x3,
                    ),
                  ),
                ),
                const Divider(),
                SimpleDialogOption(
                  onPressed: () async {
                    await ref
                        .read(refLocaleProvider.notifier)
                        .changeLocale(
                          const Locale('en'),
                        )
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: ListTile(
                    title: const Text('English'),
                    leading: Flag.fromCode(
                      FlagsCode.GB,
                      height: 20,
                      width: 30,
                      flagSize: FlagSize.size_4x3,
                    ),
                  ),
                ),
              ],
            );
          });
    }

    return ListTile(
      dense: true,
      leading: const Icon(Icons.language_outlined),
      title: Text(AppLocalizations.of(context)!.language),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Flag.fromCode(
              code,
              height: 20,
              width: 30,
              flagSize: FlagSize.size_4x3,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(language),
          ],
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () async {
        await languageSelectionDialog();
      },
    );
  }
}
