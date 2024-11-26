import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jiffy/jiffy.dart';
import 'package:local_roots_2/models/view_farmer_model.dart';

import '../../../../providers/farmer/farmer_views/farmer_views_get.dart';

class FarmerSalesStatistics extends ConsumerWidget {
  const FarmerSalesStatistics({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final farmerViews = ref.watch(refFarmerViewsGetProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.farmerProfileViews),
      ),
      body: farmerViews.when(
        data: (data) {
          List<ViewFarmerModel> farmerViews = data;
          DateTime now = DateTime.now();

          //List<DateTime> dates = farmerViews.map((e) => e.createdAt).toList();
          // DateTime minDate = dates.reduce(
          //     (value, element) => value.isBefore(element) ? value : element);
          DateTime minDate = DateTime(now.year, now.month, now.day - 30);
          DateTime maxDate = DateTime.now();
          List<DateTime> allDays = [];

          for (int i = 0; i <= maxDate.difference(minDate).inDays + 1; i++) {
            allDays.add(
              minDate.add(
                Duration(days: i),
              ),
            );
          }

          List<DateViewStat> dateViewStats = [];
          for (int i = 0; i < allDays.length; i++) {
            int views = 0;
            for (int j = 0; j < farmerViews.length; j++) {
              if (farmerViews[j].createdAt.day == allDays[i].day &&
                  farmerViews[j].createdAt.month == allDays[i].month &&
                  farmerViews[j].createdAt.year == allDays[i].year) {
                views++;
              }
            }
            dateViewStats.add(DateViewStat(date: allDays[i], views: views));
          }

          return ListView.builder(
            itemCount: dateViewStats.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Text(
                    Jiffy.parseFromDateTime(dateViewStats[index].date)
                        .format(pattern: 'yyyy.MM.dd'),
                  ),
                  const Text(
                    ' - ',
                  ),
                  Text(
                    '${dateViewStats[index].views}',
                  ),
                ],
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text('Error: $error'),
      ),
    );
  }
}

class DateViewStat {
  DateTime date;
  int views;

  DateViewStat({required this.date, required this.views});
}
