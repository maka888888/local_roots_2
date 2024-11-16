import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/farmer_candidates/candidate_get.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'package:local_roots_2/ui/common/loading_widget/loading_widget.dart';

import '../../../providers/common/app_user/app_user.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepName extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepName({super.key, required this.progress});

  @override
  FarmerOnboardingStepNameState createState() =>
      FarmerOnboardingStepNameState();
}

class FarmerOnboardingStepNameState
    extends ConsumerState<FarmerOnboardingStepName> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _farmer = FarmerModel(
      appUserId: '',
      name: '',
      email: '',
      phone: '',
      companyId: '',
      vatId: '',
      street: '',
      city: '',
      country: '',
      latitude: 0.0,
      longitude: 0.0,
      isSellingInFarm: false,
      smallPhoto: '',
      largePhoto: '',
      farmPhotos: [],
      categories: [],
      certificatesPhotos: [],
      yearsExperience: 3,
      description: '',
      isApproved: false,
      isActive: true,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      lastLogin: DateTime.now(),
      onboardingStep: FarmerOnboardingStep.name,
      uid: '',
    );

    _getCandidateApplication();
  }

  Future _getCandidateApplication() async {
    setState(() {
      _isLoading = true;
    });
    AppUserModel appUser = ref.read(refAppUserProvider).value!;

    setState(() {
      _farmer.appUserId = appUser.uid;
      _farmer.uid = appUser.uid;
    });

    if (appUser.customer != null) {
      setState(() {
        _farmer.name = appUser.customer!.name;
        _farmer.email = appUser.email;
        _farmer.phone = appUser.customer!.phone;
        _farmer.street = appUser.customer!.street;
        _farmer.city = appUser.customer!.city;
        _farmer.country = appUser.customer!.country;
        _farmer.latitude = appUser.customer!.latitude;
        _farmer.longitude = appUser.customer!.longitude;
        _farmer.smallPhoto = appUser.customer!.photoSmall;
        _farmer.largePhoto = appUser.customer!.photoLarge;
      });
    }

    FarmerCandidateModel? candidate =
        await ref.read(refFarmerCandidateGetProvider(appUser.email).future);

    if (candidate != null) {
      setState(() {
        _farmer.name = candidate.name;
        _farmer.email = candidate.email;
        _farmer.phone = candidate.phone;
        _farmer.street = candidate.street;
        _farmer.city = candidate.city;
        _farmer.country = candidate.country;
        _farmer.latitude = candidate.latitude;
        _farmer.longitude = candidate.longitude;
        _farmer.categories = candidate.categories;
        _farmer.certificatesPhotos = candidate.certificatesPhotos;
        _farmer.yearsExperience = candidate.yearsExperience;
        _farmer.description = candidate.description;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  _save() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.company;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerOnboarding),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
              }
            },
            child: const FormControlButtonNextState(isSaving: false),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: widget.progress,
          ),
        ),
      ),
      body: _isLoading
          ? const LoadingWidgetMain()
          : FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  FormBuilderTextField(
                    name: 'name',
                    initialValue: _farmer.name,
                    decoration: InputDecoration(
                      labelText: '${AppLocalizations.of(context)!.farmName}*',
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
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {
                      setState(() {
                        _farmer.email = value!;
                      });
                    },
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
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        _farmer.phone = value!;
                      });
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.numeric(),
                    ]),
                  ),
                ],
              ),
            ),
    );
  }
}
