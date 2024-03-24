import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';


@RoutePage()
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({ super.key, });

  @override
  Widget build(BuildContext context) =>
    const Text('My profile');
}
