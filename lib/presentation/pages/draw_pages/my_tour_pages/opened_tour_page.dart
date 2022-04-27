import 'package:flutter/material.dart';

class OpenedTourPage extends StatelessWidget {
  const OpenedTourPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26, right: 26, top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '오픈한 투어',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Icon(Icons.navigate_next, size: 24,)
        ],
      ),
    );
  }
}
