import 'package:flutter/material.dart';

import '/data.dart' show initializeMappers;
import 'app.dart';

void main() {
  initializeMappers();
  runApp(const App());
}
