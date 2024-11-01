import 'package:flutter/material.dart';

class LoadingWidgetMain extends StatelessWidget {
  const LoadingWidgetMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
