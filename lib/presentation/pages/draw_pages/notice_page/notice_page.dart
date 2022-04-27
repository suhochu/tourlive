import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  const Notice({Key? key}) : super(key: key);

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
            '공지사항',
            style: TextStyle(fontSize: 26),
          ),
        ),        ],
    );
  }
}
