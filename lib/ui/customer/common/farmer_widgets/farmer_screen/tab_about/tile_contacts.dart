import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:local_roots_2/models/farmer_model.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomerFarmerTileContacts extends StatelessWidget {
  final FarmerModel farmer;
  const CustomerFarmerTileContacts({super.key, required this.farmer});

  @override
  Widget build(BuildContext context) {
    Future<void> makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    Future<void> makeEmail(String email) async {
      final Uri launchUri = Uri(
        scheme: 'mailto',
        path: email,
      );
      await launchUrl(launchUri);
    }

    Future copyToClipboard(String text) async {
      await Clipboard.setData(ClipboardData(text: text));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.copiedToClipboard),
        ),
      );
    }

    return Column(
      children: [
        ListTile(
          title: Text(AppLocalizations.of(context)!.contacts),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(farmer.phone),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.phone_outlined),
                        onPressed: () => makePhoneCall(farmer.phone),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy_outlined),
                        onPressed: () => copyToClipboard(farmer.phone),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                dense: true,
                contentPadding: EdgeInsets.zero,
                title: Text(farmer.email),
                trailing: SizedBox(
                  width: 100,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.email_outlined),
                        onPressed: () => makeEmail(farmer.email),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy_outlined),
                        onPressed: () => copyToClipboard(farmer.email),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
