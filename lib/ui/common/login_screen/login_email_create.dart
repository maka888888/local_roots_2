import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../providers/common/auth/auth_services.dart';
import 'login_email_signin_screen.dart';

class CustomerLoginEmailCreate extends StatefulWidget {
  const CustomerLoginEmailCreate({super.key});

  @override
  State<CustomerLoginEmailCreate> createState() =>
      _CustomerLoginEmailCreateState();
}

class _CustomerLoginEmailCreateState extends State<CustomerLoginEmailCreate> {
  String email = '';
  String password = '';
  String passwordRepeat = '';
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  Future _createAccount() async {
    final navigator = Navigator.of(context);

    setState(() {
      _isSaving = true;
    });
    await ServicesAuth()
        .createUserWithEmailAndPassword(context, email, password)
        .then(
      (value) {
        setState(() {
          _isSaving = false;
        });

        if (value != null) {
          navigator.pop();
          navigator.pop();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.createAccount),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'email',
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.email,
              ),
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                setState(() {
                  email = value!;
                });
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.email(),
              ]),
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'password',
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (value) {
                password = value!;
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
              ]),
            ),
            const SizedBox(height: 20),
            FormBuilderTextField(
              name: 'passwordRepeat',
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.repeatPassword,
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
              onChanged: (value) {
                passwordRepeat = value!;
              },
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.minLength(6),
                (val) {
                  if (val != password) {
                    return AppLocalizations.of(context)!.passwordsDoNotMatch;
                  }
                  return null;
                },
              ]),
            ),
            const SizedBox(height: 20),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CustomerLoginEmailSignin(),
                      ),
                    );
                  },
                  child: Text(AppLocalizations.of(context)!.alreadyHaveAccount),
                ),
                ElevatedButton(
                  onPressed: _isSaving
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await _createAccount();
                          }
                        },
                  child: _isSaving
                      ? const CircularProgressIndicator()
                      : Text(AppLocalizations.of(context)!.createAccount),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
