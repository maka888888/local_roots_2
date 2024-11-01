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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SignInButton(
              buttonType: ButtonType.mail,
              buttonSize: ButtonSize.medium,
              btnText: AppLocalizations.of(context)!.signInWithEmail,
              //width: 250,
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
              //width: 250,
              onPressed: () async {
                await ServicesAuth().signInWithGoogle().then((value) {
                  Navigator.pop(context);
                  // if (value != null) {
                  //   Navigator.pop(context);
                  // }
                });
              },
            ),
            // const SizedBox(height: 20),
            // SignInButton(
            //   buttonType: ButtonType.facebook,
            //   buttonSize: ButtonSize.medium,
            //   btnText: AppLocalizations.of(context)!.signInWithGoogle,
            //   //width: 250,
            //   onPressed: () {
            //     print('click');
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
