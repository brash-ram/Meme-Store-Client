import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';


@RoutePage()
class LogsScreen extends StatelessWidget {
  const LogsScreen({ super.key, });

  @override
  Widget build(BuildContext context) =>
    TalkerScreen(talker: context.read());
}
