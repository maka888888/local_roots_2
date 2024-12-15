import 'package:flutter/material.dart';
import 'package:local_roots_2/ui/customer/about/tile_about.dart';

class CustomerAbout extends StatelessWidget {
  const CustomerAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        CustomerAboutAppName(),
      ],
    );
  }
}
