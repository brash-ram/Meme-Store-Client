import 'package:flutter/material.dart';

import '../logging.dart';
import '/api.dart';


class ErrorText extends StatelessWidget {
  const ErrorText(this.error, {
    super.key,
  });

  final Object error;

  @override
  Widget build(BuildContext context) => Text(
    switch(error) {
      ApiException(:final message) => message,
      _ => () {
        talker.error('An unknown error occurred.', error);
        return 'An error occurred.';
      }(),
    },
  );
}
