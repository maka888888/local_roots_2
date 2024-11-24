import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_roots_2/models/sales_location_model.dart';
import 'package:local_roots_2/providers/farmer/sales_location/sales_location_service.dart';
import 'package:local_roots_2/ui/common/form_control_buttons/save_statefull/save_statefull_button.dart';

class FarmerSalesLocationEditName extends ConsumerStatefulWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationEditName({super.key, required this.salesLocation});

  @override
  FarmerSalesLocationEditNameState createState() =>
      FarmerSalesLocationEditNameState();
}

class FarmerSalesLocationEditNameState
    extends ConsumerState<FarmerSalesLocationEditName> {
  late SalesLocationModel _salesLocation;
  final _formKey = GlobalKey<FormBuilderState>();
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _salesLocation = widget.salesLocation;
  }

  Future _save() async {
    setState(() {
      _isSaving = true;
    });

    await ServicesFarmerSalesLocation().updateSalesLocation(_salesLocation);

    setState(() {
      _isSaving = false;
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.edit),
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
      body: SingleChildScrollView(
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnMonday',
                title: Text(AppLocalizations.of(context)!.weWorkOnMonday),
                initialValue: _salesLocation.workOnMonday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnMonday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnMonday,
                name: 'workOnMondayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnMondayStart.hour.toDouble(),
                  _salesLocation.workOnMondayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnMondayStart = DateTime(
                      _salesLocation.workOnMondayStart.year,
                      _salesLocation.workOnMondayStart.month,
                      _salesLocation.workOnMondayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnMondayEnd = DateTime(
                      _salesLocation.workOnMondayEnd.year,
                      _salesLocation.workOnMondayEnd.month,
                      _salesLocation.workOnMondayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnTuesday',
                title: Text(AppLocalizations.of(context)!.weWorkOnTuesday),
                initialValue: _salesLocation.workOnTuesday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnTuesday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnTuesday,
                name: 'workOnTuesdayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnTuesdayStart.hour.toDouble(),
                  _salesLocation.workOnTuesdayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnTuesdayStart = DateTime(
                      _salesLocation.workOnTuesdayStart.year,
                      _salesLocation.workOnTuesdayStart.month,
                      _salesLocation.workOnTuesdayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnTuesdayEnd = DateTime(
                      _salesLocation.workOnTuesdayEnd.year,
                      _salesLocation.workOnTuesdayEnd.month,
                      _salesLocation.workOnTuesdayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnWednesday',
                title: Text(AppLocalizations.of(context)!.weWorkOnWednesday),
                initialValue: _salesLocation.workOnWednesday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnWednesday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnWednesday,
                name: 'workOnWednesdayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnWednesdayStart.hour.toDouble(),
                  _salesLocation.workOnWednesdayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnWednesdayStart = DateTime(
                      _salesLocation.workOnWednesdayStart.year,
                      _salesLocation.workOnWednesdayStart.month,
                      _salesLocation.workOnWednesdayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnWednesdayEnd = DateTime(
                      _salesLocation.workOnWednesdayEnd.year,
                      _salesLocation.workOnWednesdayEnd.month,
                      _salesLocation.workOnWednesdayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnThursday',
                title: Text(AppLocalizations.of(context)!.weWorkOnThursday),
                initialValue: _salesLocation.workOnThursday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnThursday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnThursday,
                name: 'workOnThursdayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnThursdayStart.hour.toDouble(),
                  _salesLocation.workOnThursdayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnThursdayStart = DateTime(
                      _salesLocation.workOnThursdayStart.year,
                      _salesLocation.workOnThursdayStart.month,
                      _salesLocation.workOnThursdayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnThursdayEnd = DateTime(
                      _salesLocation.workOnThursdayEnd.year,
                      _salesLocation.workOnThursdayEnd.month,
                      _salesLocation.workOnThursdayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnFriday',
                title: Text(AppLocalizations.of(context)!.weWorkOnFriday),
                initialValue: _salesLocation.workOnFriday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnFriday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnFriday,
                name: 'workOnFridayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnFridayStart.hour.toDouble(),
                  _salesLocation.workOnFridayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnFridayStart = DateTime(
                      _salesLocation.workOnFridayStart.year,
                      _salesLocation.workOnFridayStart.month,
                      _salesLocation.workOnFridayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnFridayEnd = DateTime(
                      _salesLocation.workOnFridayEnd.year,
                      _salesLocation.workOnFridayEnd.month,
                      _salesLocation.workOnFridayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnSaturday',
                title: Text(AppLocalizations.of(context)!.weWorkOnSaturday),
                initialValue: _salesLocation.workOnSaturday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnSaturday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnSaturday,
                name: 'workOnSaturdayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnSaturdayStart.hour.toDouble(),
                  _salesLocation.workOnSaturdayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnSaturdayStart = DateTime(
                      _salesLocation.workOnSaturdayStart.year,
                      _salesLocation.workOnSaturdayStart.month,
                      _salesLocation.workOnSaturdayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnSaturdayEnd = DateTime(
                      _salesLocation.workOnSaturdayEnd.year,
                      _salesLocation.workOnSaturdayEnd.month,
                      _salesLocation.workOnSaturdayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
              const SizedBox(height: 20),
              FormBuilderCheckbox(
                name: 'workOnSunday',
                title: Text(AppLocalizations.of(context)!.weWorkOnSunday),
                initialValue: _salesLocation.workOnSunday,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnSunday = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              FormBuilderRangeSlider(
                enabled: _salesLocation.workOnSunday,
                name: 'workOnSundayStart',
                min: 6,
                max: 23,
                initialValue: RangeValues(
                  _salesLocation.workOnSundayStart.hour.toDouble(),
                  _salesLocation.workOnSundayEnd.hour.toDouble(),
                ),
                divisions: 17,
                onChanged: (value) {
                  setState(() {
                    _salesLocation.workOnSundayStart = DateTime(
                      _salesLocation.workOnSundayStart.year,
                      _salesLocation.workOnSundayStart.month,
                      _salesLocation.workOnSundayStart.day,
                      value!.start.toInt(),
                    );
                    _salesLocation.workOnSundayEnd = DateTime(
                      _salesLocation.workOnSundayEnd.year,
                      _salesLocation.workOnSundayEnd.month,
                      _salesLocation.workOnSundayEnd.day,
                      value.end.toInt(),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
