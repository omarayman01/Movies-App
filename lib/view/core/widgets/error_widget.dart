import 'package:flutter/material.dart';

class ErrorWidgett extends StatelessWidget {
  const ErrorWidgett({super.key, required this.errMessgae});
  final String errMessgae;

  @override
  Widget build(BuildContext context) {
    return Text(
      errMessgae,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}
