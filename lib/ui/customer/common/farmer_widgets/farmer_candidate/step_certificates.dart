import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:local_roots_2/models/farmer_candidate_model.dart';
import 'package:local_roots_2/providers/customer/farmer_candidate/farmer_candidate.dart';

import '../../../../../utils/photo_handling.dart';
import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import '../../../../common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'farmer_candidate_main.dart';

class CustomerFarmerCandidateStepCertificates extends ConsumerStatefulWidget {
  final double progress;
  const CustomerFarmerCandidateStepCertificates(
      {super.key, required this.progress});

  @override
  CustomerFarmerCandidateStepCertificatesState createState() =>
      CustomerFarmerCandidateStepCertificatesState();
}

class CustomerFarmerCandidateStepCertificatesState
    extends ConsumerState<CustomerFarmerCandidateStepCertificates> {
  late FarmerCandidateModel _farmerCandidate;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _farmerCandidate = ref.read(refCustomerFarmerCandidateProvider);
  }

  _back() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.experience;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  _save() {
    setState(() {
      _farmerCandidate.step = FarmerCandidateStep.description;
    });
    ref
        .read(refCustomerFarmerCandidateProvider.notifier)
        .updateCustomerFarmerCandidate(_farmerCandidate);
  }

  Future _selectPicture() async {
    setState(() {
      _isSaving = true;
    });

    await uploadCertificatePhoto(context, ImageSource.gallery).then((value) {
      if (value != null) {
        setState(() {
          _farmerCandidate.certificatesPhotos.add(value);
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
          _farmerCandidate.certificatesPhotos.add(value);
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
        _farmerCandidate.certificatesPhotos.remove(url);
        _isSaving = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.candidateApplication),
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
                          AppLocalizations.of(context)!
                              .uploadRelatedCertificates,
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
              if (_farmerCandidate.certificatesPhotos.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  itemCount: _farmerCandidate.certificatesPhotos.length,
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
                            _farmerCandidate.certificatesPhotos[index],
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
                              _removePicture(
                                  _farmerCandidate.certificatesPhotos[index]);
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
