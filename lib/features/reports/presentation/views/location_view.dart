import 'package:flutter/material.dart';

import 'widgets/location view/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LocationViewBody(),
    );
  }
}
