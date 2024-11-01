import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/common/locale/locale.dart';

class LocaleDropdownMain extends ConsumerWidget {
  const LocaleDropdownMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(refLocaleProvider);

    return FormBuilderDropdown(
      name: 'locale',
      decoration: const InputDecoration(
        isDense: true,
        border: InputBorder.none,
      ),
      initialValue: locale.languageCode,
      items: const [
        DropdownMenuItem(
          value: 'en',
          child: Text('English'),
        ),
        DropdownMenuItem(
          value: 'lt',
          child: Text('Lietuvių'),
        ),
      ],
      onChanged: (String? value) {
        ref.read(refLocaleProvider.notifier).changeLocale(Locale(value!));
      },
    );
  }
}
