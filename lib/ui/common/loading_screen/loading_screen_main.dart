import 'package:flutter/material.dart';

class LoadingScreenMain extends StatelessWidget {
  const LoadingScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
