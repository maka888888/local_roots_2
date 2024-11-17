import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

import '../../../../../../../providers/common/app_user/app_user_services.dart';
import '../../../../../../../utils/photo_handling.dart';
import '../../farmer_screen_main.dart';

class AdminFarmMyFarmEditPhotos extends ConsumerStatefulWidget {
  final AppUserModel appUser;
  const AdminFarmMyFarmEditPhotos({super.key, required this.appUser});

  @override
  AdminFarmMyFarmEditPhotosState createState() =>
      AdminFarmMyFarmEditPhotosState();
}

class AdminFarmMyFarmEditPhotosState
    extends ConsumerState<AdminFarmMyFarmEditPhotos> {
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AdminFarmer(appUser: appUser),
        ),
      );
    }
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
        title: Text(AppLocalizations.of(context)!.farmPhotos),
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
            _isSaving
                ? const SizedBox(
                    height: 30,
                    width: 30,
                    child: CircularProgressIndicator(),
                  )
                : SizedBox(
                    height: 30,
                    child: Text(AppLocalizations.of(context)!.uploadFarmPhotos,
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
    );
  }
}
