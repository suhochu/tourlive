import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import '../../../components/button_style.dart';
import 'empty_tour_page.dart';

class DashBoardPage extends StatefulWidget {

  const DashBoardPage({Key? key}) : super(key: key);

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  double currentIndexPage = 1;
  bool hasMyTours = false;
  void setButton(bool value) {
    if (hasMyTours == false) {
      setState(() {
        hasMyTours = value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.grey.shade200,
            alignment: Alignment.centerLeft,
            child: const Text(
              '안녕하세요. 홍길동 님',
              style: TextStyle(fontSize: 26),
            ),
          ),
          if(!hasMyTours)
            Expanded(child: Center(child: EmptyTourPage(setButton: setButton))),
          if(hasMyTours)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '나의 투어',
                  style: TextStyle(fontSize: 20),
                ),
                _myTourItem(size,
                    place: '세비아',
                    date: '2020-01-01',
                    hashTag: '세비아 야간 산책투어 #감성투어',
                    function: () {}),
                _myTourItem(size,
                    place: '세비아',
                    date: '2020-01-01',
                    hashTag: '세비아 야간 산책투어 #감성투어',
                    function: () {}),
                _myTourItem(size,
                    place: '세비아',
                    date: '2020-01-01',
                    hashTag: '세비아 야간 산책투어 #감성투어',
                    function: () {}),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: 2,
                    position: currentIndexPage,
                    decorator: const DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
  }

  Widget _myTourItem(Size size,
      {required String place,
      required String date,
      required String hashTag,
      required Function()? function}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      place,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      date,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      hashTag,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: function,
              child: const Text('작업중'),
              style: elevatedButtonStyle(size, flex: 0.3, height: 35, fontSize: 15),
            ),
          ],
        ));
  }
}
