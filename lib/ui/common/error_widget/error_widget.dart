import 'package:flutter/material.dart';

class ErrorWidgetMain extends StatelessWidget {
  final String? errorText;
  const ErrorWidgetMain({super.key, this.errorText});

  @override
  Widget build(BuildContext context) {
    String error = errorText ?? 'Unknown error';

    return Center(
      child: Text('Error: $error'),
    );
  }
}
