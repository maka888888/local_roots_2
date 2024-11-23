import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

class FarmerSalesLocationTileHours extends StatelessWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationTileHours({super.key, required this.salesLocation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.workingHours),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnMonday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.monday),
              ),
              Expanded(
                  child: !salesLocation.workOnMonday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnMondayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnMondayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnTuesday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.tuesday),
              ),
              Expanded(
                  child: !salesLocation.workOnTuesday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnTuesdayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnTuesdayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnWednesday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.wednesday),
              ),
              Expanded(
                  child: !salesLocation.workOnWednesday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnWednesdayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnWednesdayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnThursday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.thursday),
              ),
              Expanded(
                  child: !salesLocation.workOnThursday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnThursdayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnThursdayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnFriday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.friday),
              ),
              Expanded(
                  child: !salesLocation.workOnFriday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnFridayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnFridayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnSaturday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.saturday),
              ),
              Expanded(
                  child: !salesLocation.workOnSaturday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnSaturdayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnSaturdayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.circle_rounded,
                    size: 16,
                    color: salesLocation.workOnSunday
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
              SizedBox(
                width: 110,
                child: Text(AppLocalizations.of(context)!.sunday),
              ),
              Expanded(
                  child: !salesLocation.workOnSunday
                      ? const SizedBox.shrink()
                      : Text(
                          '${Jiffy.parseFromDateTime(salesLocation.workOnSundayStart).format(pattern: 'HH:mm')} - ${Jiffy.parseFromDateTime(salesLocation.workOnSundayEnd).format(pattern: 'HH:mm')}')),
            ],
          ),
        ],
      ),
    );
  }
}
