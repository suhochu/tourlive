import 'package:flutter/material.dart';

class InitialRoutePage extends StatelessWidget {
  static const routeName = '/initialRoute';
  const InitialRoutePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
