import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'package:local_roots_2/utils/photo_handling.dart';

import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../common/photos/photo_oval_large.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepPhotoMain extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepPhotoMain({super.key, required this.progress});

  @override
  FarmerOnboardingStepPhotoMainState createState() =>
      FarmerOnboardingStepPhotoMainState();
}

class FarmerOnboardingStepPhotoMainState
    extends ConsumerState<FarmerOnboardingStepPhotoMain> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmer = ref.read(refFarmerOnboardingProvider);
  }

  _back() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.address;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  _save() {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.farmPhotos;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    FarmerModel farmerWithPic =
        await uploadFarmerPictureProfile(ImageSource.gallery, _farmer);

    setState(() {
      _farmer = farmerWithPic;
      _isSaving = false;
    });
  }

  Future _takePicture() async {
    setState(() {
      _isSaving = true;
    });

    FarmerModel farmerWithPic =
        await uploadFarmerPictureProfile(ImageSource.camera, _farmer);

    setState(() {
      _farmer = farmerWithPic;
      _isSaving = false;
    });
  }

  Future _removePicture() async {
    setState(() {
      _isSaving = true;
    });

    setState(() {
      _farmer.largePhoto = null;
      _farmer.smallPhoto = null;
      _isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerOnboarding),
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
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: PhotoOvalLarge(photoUrl: _farmer.largePhoto),
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
                          onPressed: _farmer.largePhoto == null ||
                                  _farmer.largePhoto == ''
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
    );
  }
}
