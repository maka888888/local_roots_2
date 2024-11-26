import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sign_button/constants.dart';
import 'package:sign_button/create_button.dart';

import '../../../providers/common/auth/auth_services.dart';
import 'login_email_create.dart';

class LoginScreenMain extends StatelessWidget {
  const LoginScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.login),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 100),
          Image.asset(
            'assets/images/logo_512_no_back.png',
            height: 150,
          ),
          const SizedBox(height: 40),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.appName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.center,
            child: Text(
              AppLocalizations.of(context)!.loginOrCreateAccount,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              SignInButton(
                buttonType: ButtonType.mail,
                buttonSize: ButtonSize.medium,
                btnText: AppLocalizations.of(context)!.signInWithEmail,
                width: 250,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerLoginEmailCreate(),
                      ));
                },
              ),
              const SizedBox(height: 20),
              SignInButton(
                buttonType: ButtonType.google,
                buttonSize: ButtonSize.medium,
                btnText: AppLocalizations.of(context)!.signInWithGoogle,
                width: 250,
                onPressed: () async {
                  await ServicesAuth().signInWithGoogle().then((value) {
                    Navigator.pop(context);
                    // if (value != null) {
                    //   Navigator.pop(context);
                    // }
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
