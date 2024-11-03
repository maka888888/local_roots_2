import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/customer_model.dart';

import '../../../../../models/app_user_model.dart';
import '../../../../../providers/admin/customer_new/new_customer.dart';
import '../../../../../providers/customer/new_customer/new_customer.dart';
import '../../../../../utils/photo_handling.dart';
import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_stateless/next_stateles_main.dart';
import '../../../../common/photos/photo_oval_large.dart';
import '../../../../customer/onboarding/onboarding_main.dart';

class AdminCustomerOnboardingStepPhoto extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  final double progress;
  const AdminCustomerOnboardingStepPhoto({super.key,
    required this.appUser,
    required this.progress});

  @override
  AdminCustomerOnboardingStepPhotoState createState() =>
      AdminCustomerOnboardingStepPhotoState();
}

class AdminCustomerOnboardingStepPhotoState
    extends ConsumerState<AdminCustomerOnboardingStepPhoto> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _customer = ref.read(refAdminCustomerNewProvider(widget.appUser));
  }

  Future _save() async {
    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.address;
    });
    ref
        .read(refAdminCustomerNewProvider(widget.appUser).notifier)
        .updateCustomerNew(_customer);
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    CustomerModel customerWithPic =
        await uploadCustomerPictureProfile(ImageSource.gallery, _customer);

    setState(() {
      _customer = customerWithPic;
      _isSaving = false;
    });
  }

  Future _takePicture() async {
    setState(() {
      _isSaving = true;
    });

    CustomerModel customerWithPic =
        await uploadCustomerPictureProfile(ImageSource.camera, _customer);

    setState(() {
      _customer = customerWithPic;
      _isSaving = false;
    });
  }

  Future _removePicture() async {
    setState(() {
      _isSaving = true;
    });

    setState(() {
      _customer.photoLarge = null;
      _customer.photoSmall = null;
      _isSaving = false;
    });
  }

  _back() {
    setState(() {
      _customer.onboardingStep = CustomerOnboardingStep.name;
    });
    ref
        .read(refCustomerNewProvider.notifier)
        .updateCustomerNew(_customer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.registration),
        actions: [
          TextButton(
            onPressed: () {
              _back();
            },
            child: const FormControlButtonBack(),
          ),
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _save();
              }
            },
            child: const FormControlButtonNext(),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: LinearProgressIndicator(
            value: widget.progress,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: PhotoOvalLarge(photoUrl: _customer.photoLarge),
                ),
              ),
              const SizedBox(height: 40),
              _isSaving
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        SizedBox(
                          width: 200,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              await _selectPicture();
                            },
                            icon: const Icon(Icons.photo_library_outlined),
                            label:
                                Text(AppLocalizations.of(context)!.selectPicture),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: OutlinedButton.icon(
                            onPressed: () async {
                              await _takePicture();
                            },
                            icon: const Icon(Icons.camera_alt_outlined),
                            label:
                                Text(AppLocalizations.of(context)!.takePicture),
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: OutlinedButton.icon(
                            onPressed: _customer.photoLarge == null ||
                                    _customer.photoLarge == ''
                                ? null
                                : () async {
                                    await _removePicture();
                                  },
                            icon: const Icon(Icons.highlight_remove),
                            label: Text(AppLocalizations.of(context)!.remove),
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
