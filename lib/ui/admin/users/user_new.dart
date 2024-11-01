import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';

import '../../../providers/common/app_user/app_user_services.dart';
import '../../../providers/common/auth/auth_services.dart';
import '../../common/form_control_buttons/save_statefull/save_statefull_button.dart';

class AdminAppUserNew extends StatefulWidget {
  const AdminAppUserNew({super.key});

  @override
  State<AdminAppUserNew> createState() => _AdminAppUserNewState();
}

class _AdminAppUserNewState extends State<AdminAppUserNew> {
  late AppUserModel _appUser;
  bool _isSaving = false;
  final _formKey = GlobalKey<FormBuilderState>();
  String _password = '';

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();

    _appUser = AppUserModel(
      id: '',
      email: '',
      isCustomer: false,
      isFarmer: false,
      isAdmin: false,
      isDistributor: false,
      lastLogin: now,
      createdAt: now,
      updatedAt: now,
      uid: '',
    );
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });

    await ServicesAuth()
        .createUserWithEmailAndPassword(context, _appUser.email, _password);

    await ServiceAppUser().createNewAppUser(_appUser);

    setState(() {
      _isSaving = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newAppUser),
        actions: [
          TextButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _save();
              }
            },
            child: FormControlButtonSaveState(isSaving: _isSaving),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'email',
                initialValue: _appUser.email,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.email}*',
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    _appUser.email = value!;
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
                initialValue: _password,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.password}*',
                ),
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {
                    _password = value!;
                  });
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderSwitch(
                name: 'userIsAppCustomer',
                title:
                    Text('${AppLocalizations.of(context)!.userIsAppCustomer}?'),
                initialValue: _appUser.isCustomer,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  setState(() {
                    _appUser.isCustomer = value!;
                  });
                },
              ),
              FormBuilderSwitch(
                name: 'userIsAppFarmer',
                title: Text('${AppLocalizations.of(context)!.userIsFarmer}?'),
                initialValue: _appUser.isFarmer,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  setState(() {
                    _appUser.isFarmer = value!;
                  });
                },
              ),
              FormBuilderSwitch(
                name: 'userIsAppDistributor',
                title:
                    Text('${AppLocalizations.of(context)!.userIsDistributor}?'),
                initialValue: _appUser.isDistributor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  setState(() {
                    _appUser.isDistributor = value!;
                  });
                },
              ),
              FormBuilderSwitch(
                name: 'userIsAppAdmin',
                title: Text('${AppLocalizations.of(context)!.userIsAdmin}?'),
                initialValue: _appUser.isAdmin,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onChanged: (value) async {
                  setState(() {
                    _appUser.isAdmin = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
