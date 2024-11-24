import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/sales_location_model.dart';

import 'edit_screen/edit_payments.dart';

class FarmerSalesLocationTilePayments extends StatelessWidget {
  final SalesLocationModel salesLocation;
  const FarmerSalesLocationTilePayments(
      {super.key, required this.salesLocation});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.paymentOptions),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.showInfoAboutPaymentOptions,
          ),
          Text(
            salesLocation.paymentOptionsShow
                ? AppLocalizations.of(context)!.yes
                : AppLocalizations.of(context)!.no,
          ),
          const SizedBox(height: 10),
          Visibility(
            visible: salesLocation.paymentOptionsShow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                salesLocation.paymentOptionsCash
                    ? Text(AppLocalizations.of(context)!.acceptingCash)
                    : const SizedBox(),
                salesLocation.paymentOptionsCard
                    ? Text(AppLocalizations.of(context)!.acceptingCards)
                    : const SizedBox(),
                salesLocation.paymentOptionsTransfer
                    ? Text(
                        AppLocalizations.of(context)!.acceptingTransfers +
                            (salesLocation.paymentAccountNumber != null &&
                                    salesLocation.paymentAccountNumber != ''
                                ? ' (${salesLocation.paymentAccountNumber!})'
                                : ''),
                      )
                    : const SizedBox(),
              ],
            ),
          )
        ],
      ),
      trailing: const Icon(Icons.edit_outlined),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                FarmerSalesLocationEditPayments(salesLocation: salesLocation),
          ),
        );
      },
    );
  }
}
