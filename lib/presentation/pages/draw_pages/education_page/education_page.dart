import 'package:flutter/material.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.grey.shade200,
          alignment: Alignment.centerLeft,
          child: const Text(
            '교육',
            style: TextStyle(fontSize: 26),
          ),
        ),
      ],
    );
  }
}
