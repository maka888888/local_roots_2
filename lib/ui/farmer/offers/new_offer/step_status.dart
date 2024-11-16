import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/offer_model.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';

import '../../../../providers/farmer/offer/offer_new.dart';
import '../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';
import 'offer_new_main.dart';

class FarmerOfferStepStatus extends ConsumerStatefulWidget {
  final double progress;
  const FarmerOfferStepStatus({super.key, required this.progress});

  @override
  FarmerOfferStepStatusState createState() => FarmerOfferStepStatusState();
}

class FarmerOfferStepStatusState extends ConsumerState<FarmerOfferStepStatus> {
  late OfferModel _offer;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _offer = ref.read(refFarmerOfferNewProvider);
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });
    await ref.read(refFarmerOfferNewProvider.notifier).saveOffer(_offer);
    Navigator.pop(context);
  }

  _back() {
    setState(() {
      _offer.onboardingStep = FarmerOfferNewStep.price;
    });
    ref.read(refFarmerOfferNewProvider.notifier).updateOffer(_offer);
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
            children: [
              const SizedBox(height: 40),
              FormBuilderSwitch(
                name: 'isActive',
                title: Text('${AppLocalizations.of(context)!.offerIsActive}?'),
                initialValue: _offer.isActive,
                onChanged: (value) {
                  setState(() {
                    _offer.isActive = value!;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
