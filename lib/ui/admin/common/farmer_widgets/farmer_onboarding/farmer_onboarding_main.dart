import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/admin/farmer_candidates/farmer_candidate_get.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../providers/admin/app_users/app_users_services.dart';
import '../../../../../utils/geo.dart';

class AdminFarmerOnboarding extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const AdminFarmerOnboarding({super.key, required this.appUser});

  @override
  AdminFarmerOnboardingState createState() => AdminFarmerOnboardingState();
}

class AdminFarmerOnboardingState extends ConsumerState<AdminFarmerOnboarding> {
  bool _isSaving = false;
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  FarmerCandidateModel? _farmerCandidate;

  @override
  void initState() {
    super.initState();
    _farmer = FarmerModel(
      appUserId: widget.appUser.id,
      name: '',
      email: widget.appUser.email,
      phone: '',
      companyId: '',
      vatId: '',
      street: '',
      city: '',
      country: 'Lietuva',
      latitude: 0,
      longitude: 0,
      isSellingInFarm: false,
      farmPhotos: [],
      categories: [],
      certificatesPhotos: [],
      yearsExperience: 0,
      description: '',
      isApproved: false,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: DateTime.now(),
      uid: '',
    );

    _getFarmerCandidate();
  }

  Future<void> _getFarmerCandidate() async {
    FarmerCandidateModel? farmerCandidate = await ref
        .read(refAdminFarmerCandidateGetProvider(widget.appUser.email).future);

    if (farmerCandidate != null) {
      setState(() {
        _farmerCandidate = farmerCandidate;
      });
    }
  }

  Future<void> _save() async {
    setState(() {
      _isSaving = true;
    });

    LatLng? coordinates = await getCoordinatesFromAddress(
        '${_farmer.street}, ${_farmer.city}, ${_farmer.country}');

    if (coordinates != null) {
      setState(() {
        _farmer.latitude = coordinates.latitude;
        _farmer.longitude = coordinates.longitude;
      });
    }

    AppUserModel appUser = widget.appUser;
    appUser.isFarmer = true;
    appUser.farmer = _farmer;

    await ServiceAdminAppUser().updateAppUser(appUser).then((value) {
      setState(() {
        _isSaving = false;
      });
      Navigator.pop(context);
    });
  }

  OutlinedButton _getDataFromFarmerCandidateButton() {
    return OutlinedButton(
      onPressed: () {
        if (_farmerCandidate != null) {
          setState(() {
            _farmer.name = _farmerCandidate!.name;
            _farmer.phone = _farmerCandidate!.phone;
            _farmer.street = _farmerCandidate!.street;
            _farmer.city = _farmerCandidate!.city;
            _farmer.country = _farmerCandidate!.country;
            _farmer.yearsExperience = _farmerCandidate!.yearsExperience;
            _farmer.description = _farmerCandidate!.description;
            _farmer.categories = _farmerCandidate!.categories;
            _farmer.certificatesPhotos = _farmerCandidate!.certificatesPhotos;
          });
          _formKey.currentState!.fields['name']!.didChange(_farmer.name);
          _formKey.currentState!.fields['phone']!.didChange(_farmer.phone);
          _formKey.currentState!.fields['street']!.didChange(_farmer.street);
          _formKey.currentState!.fields['city']!.didChange(_farmer.city);
          _formKey.currentState!.fields['country']!.didChange(_farmer.country);
          _formKey.currentState!.fields['yearsExperience']!
              .didChange(_farmer.yearsExperience.toString());
          _formKey.currentState!.fields['description']!
              .didChange(_farmer.description);
        }
      },
      child: Text(AppLocalizations.of(context)!.copyFromCandidateForm),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newFarmer),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
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
              OverflowBar(
                alignment: MainAxisAlignment.end,
                children: [
                  if (_farmerCandidate != null)
                    _getDataFromFarmerCandidateButton(),
                ],
              ),
              FormBuilderTextField(
                name: 'name',
                initialValue: _farmer.name,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.nameSurname}*',
                  helperText:
                      AppLocalizations.of(context)!.thisNameWillBeSeenByFarmers,
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.name = value!;
                  });
                },
                maxLength: 80,
                textCapitalization: TextCapitalization.words,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.minLength(5),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'email',
                initialValue: _farmer.email,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.email}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.email = value!;
                  });
                },
                keyboardType: TextInputType.emailAddress,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.email(),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'phone',
                initialValue: _farmer.phone,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.phone}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.phone = value!;
                  });
                },
                keyboardType: TextInputType.phone,
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(),
                  FormBuilderValidators.numeric(),
                ]),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'companyId',
                initialValue: _farmer.companyId,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.companyID,
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.companyId = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'vatId',
                initialValue: _farmer.vatId,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.vatID,
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.vatId = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'street',
                initialValue: _farmer.street,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.street}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.street = value!;
                  });
                },
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'city',
                initialValue: _farmer.city,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.city}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.city = value!;
                  });
                },
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'country',
                initialValue: _farmer.country,
                decoration: InputDecoration(
                  labelText: '${AppLocalizations.of(context)!.country}*',
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.country = value!;
                  });
                },
                validator: FormBuilderValidators.required(),
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'yearsExperience',
                initialValue: _farmer.yearsExperience.toString(),
                decoration: InputDecoration(
                  labelText:
                      AppLocalizations.of(context)!.howManyYearsDoingBusiness,
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.yearsExperience = int.parse(value!);
                  });
                },
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              FormBuilderTextField(
                name: 'description',
                initialValue: _farmer.description,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context)!.description,
                ),
                onChanged: (value) {
                  setState(() {
                    _farmer.description = value!;
                  });
                },
                maxLines: 5,
                minLines: 3,
              ),
              const SizedBox(height: 20),
              FormBuilderSwitch(
                name: 'isApproved',
                title: Text(AppLocalizations.of(context)!.approved),
                initialValue: _farmer.isApproved,
                onChanged: (value) {
                  setState(() {
                    _farmer.isApproved = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderSwitch(
                name: 'active',
                title: Text(AppLocalizations.of(context)!.active),
                initialValue: _farmer.isActive,
                onChanged: (value) {
                  setState(() {
                    _farmer.isActive = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
