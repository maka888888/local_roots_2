import 'package:flutter/material.dart';

class ErrorScreenMain extends StatelessWidget {
  final String? errorText;
  const ErrorScreenMain({super.key, this.errorText});

  @override
  Widget build(BuildContext context) {
    String error = errorText ?? 'Unknown error';

    return Scaffold(
      body: Center(
        child: Text('Error: $error'),
      ),
    );
  }
}
