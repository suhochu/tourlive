import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

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
            '프로필',
            style: TextStyle(fontSize: 26),
          ),
        ),        ],
    );
  }
}
