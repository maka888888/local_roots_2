import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../providers/common/auth/auth_services.dart';

class CustomerLoginEmailSignin extends StatefulWidget {
  const CustomerLoginEmailSignin({super.key});

  @override
  State<CustomerLoginEmailSignin> createState() =>
      _CustomerLoginEmailSigninState();
}

class _CustomerLoginEmailSigninState extends State<CustomerLoginEmailSignin> {
  String email = '';
  String password = '';
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  Future _save() async {
    final navigator = Navigator.of(context);

    setState(() {
      _isSaving = true;
    });
    await ServicesAuth()
        .signInWithEmailAndPassword(context, email, password)
        .then((value) {
      setState(() {
        _isSaving = false;
      });
      if (value != null) {
        navigator.pop();
        navigator.pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.signin),
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
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(AppLocalizations.of(context)!.forgotPassword),
                ),
                ElevatedButton(
                  onPressed: _isSaving
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            await _save();
                          }
                        },
                  child: _isSaving
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(),
                        )
                      : Text(AppLocalizations.of(context)!.signin),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
