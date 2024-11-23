import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_new.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/next_statefull/next_statefull_main.dart';
import 'package:local_roots_2/ui/farmer/common/sales_location_widgets/sales_location_new/sales_location_main.dart';

import '../../../../common/form_control_buttons/back_stateless/back_stateless_main.dart';

class FarmerSalesLocationStepStatus extends ConsumerStatefulWidget {
  final double progress;
  const FarmerSalesLocationStepStatus({super.key, required this.progress});

  @override
  FarmerSalesLocationStepStatusState createState() =>
      FarmerSalesLocationStepStatusState();
}

class FarmerSalesLocationStepStatusState
    extends ConsumerState<FarmerSalesLocationStepStatus> {
  late SalesLocationModel _salesLocation;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();

    _salesLocation = ref.read(refFarmerSalesLocationNewProvider);
  }

  _back() {
    setState(() {
      _salesLocation.onboardingStep = SalesLocationNewStep.paymentMethods;
    });
    ref
        .read(refFarmerSalesLocationNewProvider.notifier)
        .updateSalesLocation(_salesLocation);
  }

  _save() async {
    setState(() {
      _isSaving = true;
    });
    await ServicesFarmerSalesLocation().createSalesLocation(_salesLocation);

    setState(() {
      _isSaving = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.newSalesLocation),
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
                title: Text(
                    '${AppLocalizations.of(context)!.salesLocationIsActive}?'),
                initialValue: _salesLocation.isActive,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.isActive = value!;
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
