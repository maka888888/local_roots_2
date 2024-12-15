import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CustomerAboutAppName extends StatelessWidget {
  const CustomerAboutAppName({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30.0),
              // Text(
              //   AppLocalizations.of(context)!.appName,
              //   style: Theme.of(context).textTheme.headlineMedium,
              // ),
              const SizedBox(height: 20.0),
              Text(
                AppLocalizations.of(context)!.appSlogan,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
        // const Image(
        //   image: AssetImage('assets/images/photo_apples.jpg'),
        //   height: 200,
        //   width: double.infinity,
        //   fit: BoxFit.cover,
        // ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
