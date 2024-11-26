import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../../models/offer_model.dart';
import '../../../../../../providers/admin/offers/offer_services.dart';
import '../../../../../../utils/photo_handling.dart';
import '../../../../../common/photos/photo_rect_large.dart';

class AdminOfferEditPhoto extends ConsumerStatefulWidget {
  final OfferModel offer;
  const AdminOfferEditPhoto({super.key, required this.offer});

  @override
  AdminOfferEditPhotoState createState() => AdminOfferEditPhotoState();
}

class AdminOfferEditPhotoState extends ConsumerState<AdminOfferEditPhoto> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _offer = widget.offer;
  }

  Future _save() async {
    BuildContext contextNav = context;

    setState(() {
      _isSaving = true;
    });

    await ServicesAdminOffer().updateOffer(_offer);

    setState(() {
      _isSaving = false;
    });

    if (context.mounted) {
      Navigator.pop(contextNav);
    }
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
        title: Text(AppLocalizations.of(context)!.photo),
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
      body: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(height: 20),
            PhotoRectLarge(imageUrl: _offer.mainPhotoLarge, height: 300),
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
    );
  }
}
