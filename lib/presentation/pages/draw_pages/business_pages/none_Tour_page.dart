import 'package:flutter/material.dart';

class NoneTourPage extends StatelessWidget {
  const NoneTourPage({Key? key, required this.hasClicked}) : super(key: key);
  final Function hasClicked;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              hasClicked(true);
            },
            child: const Icon(
              Icons.error_outline,
              size: 100,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            '아직 오픈한 투어가 없습니다.',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          const Text('당신의 여행지식으로'),
          const Text('새로운 수익을 만들어 보세요'),
          const SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
