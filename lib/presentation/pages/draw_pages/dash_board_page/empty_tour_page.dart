import 'package:flutter/material.dart';

import '../../../components/button_style.dart';

class EmptyTourPage extends StatelessWidget {
  EmptyTourPage({Key? key, required this.setButton}) : super(key: key);
  Function setButton;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '첫 투어를 만들어보세요',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () {
            setButton(true);
          },
          style: elevatedButtonStyle(size, height: 30),
          child: const Text(
            '투어 등록하기',
            style: TextStyle(fontSize: 16),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          '당신의 여행지식으로',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          '새로운 수익을 만들어 보세요.',
          style: TextStyle(fontSize: 12),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
