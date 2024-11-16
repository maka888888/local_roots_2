import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../providers/common/app_user/app_user_services.dart';
import '../../../../../utils/photo_handling.dart';
import '../../../../common/photos/photo_oval_large.dart';

class FarmerFarmMyFarmEditMainPhoto extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const FarmerFarmMyFarmEditMainPhoto({super.key, required this.appUser});

  @override
  FarmerFarmMyFarmEditMainPhotoState createState() =>
      FarmerFarmMyFarmEditMainPhotoState();
}

class FarmerFarmMyFarmEditMainPhotoState
    extends ConsumerState<FarmerFarmMyFarmEditMainPhoto> {
  late FarmerModel _farmer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmer = widget.appUser.farmer!;
  }

  Future _save() async {
    BuildContext contextNav = context;

    setState(() {
      _isSaving = true;
    });

    AppUserModel appUser = widget.appUser;

    appUser.farmer = _farmer;

    await ServiceAppUser().updateAppUser(appUser);

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
        title: Text(AppLocalizations.of(context)!.farmerProfile),
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
