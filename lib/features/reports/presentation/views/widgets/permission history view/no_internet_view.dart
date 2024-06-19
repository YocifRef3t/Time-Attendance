import 'package:flutter/material.dart';

class NoInternetScreen extends StatelessWidget {
  final String appBarTitle;
  const NoInternetScreen({Key? key, required this.appBarTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset('assets/images/no_internet.png'),
    );
  }
}
