import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'package:local_roots_2/ui/common/photos/photo_rect_large.dart';
import 'package:local_roots_2/utils/photo_handling.dart';

import '../../../../providers/farmer/offer/offer_new.dart';
import '../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'offer_new_main.dart';

class FarmerOfferStepPhotos extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOfferStepPhotos({super.key, required this.progress});

  @override
  FarmerOfferStepPhotosState createState() => FarmerOfferStepPhotosState();
}

class FarmerOfferStepPhotosState extends ConsumerState<FarmerOfferStepPhotos> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _offer = ref.read(refFarmerOfferNewProvider);
  }

  _save() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.unit;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  _back() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.description;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    await uploadOfferPhoto(ImageSource.gallery, _offer).then((value) {
      setState(() {
        _offer = value;
        _isSaving = false;
      });
    });
  }

  Future _takePicture() async {
    setState(() {
      _isSaving = true;
    });

    await uploadOfferPhoto(ImageSource.camera, _offer).then((value) {
      setState(() {
        _offer = value;
        _isSaving = false;
      });
    });
  }

  Future _removePicture() async {
    setState(() {
      _isSaving = true;
    });

    await deletePhoto(context, _offer.mainPhotoLarge).then((value) {
      setState(() {
        _offer.mainPhotoLarge = '';
      });
    });

    await deletePhoto(context, _offer.mainPhotoSmall).then((value) {
      setState(() {
        _offer.mainPhotoSmall = '';
      });
    });

    setState(() {
      _isSaving = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newOffer),
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
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Center(
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: PhotoRectLarge(
                    imageUrl: _offer.mainPhotoLarge,
                  ),
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
                            label: Text(
                                AppLocalizations.of(context)!.selectPicture),
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
                            onPressed: _offer.mainPhotoLarge == ''
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
