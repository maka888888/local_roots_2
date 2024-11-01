import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/app_user_model.dart';
import 'package:local_roots_2/models/customer_model.dart';
import 'package:local_roots_2/providers/common/app_user/app_user.dart';
import 'package:local_roots_2/providers/common/app_user/app_user_services.dart';

import '../../../../utils/photo_handling.dart';
import '../../../common/photos/photo_oval_large.dart';

class CustomerSetupCustomerProfilePhoto extends ConsumerStatefulWidget {
  const CustomerSetupCustomerProfilePhoto({super.key});

  @override
  CustomerSetupCustomerProfilePhotoState createState() =>
      CustomerSetupCustomerProfilePhotoState();
}

class CustomerSetupCustomerProfilePhotoState
    extends ConsumerState<CustomerSetupCustomerProfilePhoto> {
  late CustomerModel _customer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _customer = ref.read(refAppUserProvider).value!.customer!;
  }

  Future _save() async {
    //BuildContext context = this.context;

    setState(() {
      _isSaving = true;
    });
    AppUserModel appUser = ref.read(refAppUserProvider).value!;
    appUser.customer = _customer;

    await ServiceAppUser().updateAppUser(appUser).then(
      (value) {
        setState(() {
          _isSaving = false;
        });

        // if (context.mounted) {
        //   Navigator.pop(context);
        // }
      },
    );
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    CustomerModel customerWithPic =
        await uploadCustomerPictureProfile(ImageSource.gallery, _customer);

    setState(() {
      _customer = customerWithPic;
    });

    await _save();
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

    await _save();
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

    await _save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.photo),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                height: 200,
                width: 200,
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
    );
  }
}
