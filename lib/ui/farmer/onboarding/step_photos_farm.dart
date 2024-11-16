import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/providers/farmer/onboarding/farmer_onboarding.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../utils/photo_handling.dart';
import '../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'onboarding_main.dart';

class FarmerOnboardingStepPhotos extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOnboardingStepPhotos({super.key, required this.progress});

  @override
  FarmerOnboardingStepPhotosState createState() =>
      FarmerOnboardingStepPhotosState();
}

class FarmerOnboardingStepPhotosState
    extends ConsumerState<FarmerOnboardingStepPhotos> {
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
      _farmer.onboardingStep = FarmerOnboardingStep.mainPhoto;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  Future _save() async {
    setState(() {
      _farmer.onboardingStep = FarmerOnboardingStep.categories;
    });
    ref.read(refFarmerOnboardingProvider.notifier).updateFarmer(_farmer);
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    await uploadFarmPhoto(context, ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          _farmer.farmPhotos.add(value);
          _isSaving = false;
        });
      }
    });
  }

  Future _takePicture() async {
    setState(() {
      _isSaving = true;
    });

    await uploadCertificatePhoto(context, ImageSource.camera).then((value) {
      if (value != null) {
        setState(() {
          _farmer.farmPhotos.add(value);
          _isSaving = false;
        });
      }
    });
  }

  Future _removePicture(String url) async {
    setState(() {
      _isSaving = true;
    });

    await deletePhoto(context, url).then((value) {
      setState(() {
        _farmer.farmPhotos.remove(url);
        _isSaving = false;
      });
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
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                await _save();
              }
            },
            child: FormControlButtonNextState(isSaving: _isSaving),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              _isSaving
                  ? const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                      height: 30,
                      child: Text(
                          AppLocalizations.of(context)!.uploadFarmPhotos,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
              const SizedBox(height: 20),
              OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    child: OutlinedButton.icon(
                      onPressed: _isSaving
                          ? null
                          : () async {
                              await _selectPicture();
                            },
                      icon: const Icon(Icons.photo_library_outlined),
                      label: Text(AppLocalizations.of(context)!.selectPicture),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: OutlinedButton.icon(
                      onPressed: _isSaving
                          ? null
                          : () async {
                              await _takePicture();
                            },
                      icon: const Icon(Icons.camera_alt_outlined),
                      label: Text(AppLocalizations.of(context)!.takePicture),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (_farmer.farmPhotos.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: _farmer.farmPhotos.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 4.0,
                  ),
                  itemBuilder: (context, index) {
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Image.network(
                            _farmer.farmPhotos[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(
                              Icons.highlight_remove_rounded,
                              color: Theme.of(context).colorScheme.error,
                              size: 40,
                            ),
                            onPressed: () {
                              _removePicture(_farmer.farmPhotos[index]);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
