import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/dash_board_page/empty_tour_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/my_tour_pages/opened_tour_page.dart';

import '../../../components/tourItem.dart';

class MyTourPage extends StatefulWidget {
  MyTourPage({Key? key, required this.changePage}) : super(key: key);
  Function changePage;

  @override
  State<MyTourPage> createState() => _MyTourPageState();
}

class _MyTourPageState extends State<MyTourPage> {
  double currentPage = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.grey.shade200,
            alignment: Alignment.centerLeft,
            child: const Text(
              '나의 투어',
              style: TextStyle(fontSize: 26),
            ),
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Text(
                '나의 투어',
                style: TextStyle(fontSize: 20),
              )),
          Expanded(
            child: Column(
              children: [
                GestureDetector(
                  child: const OpenedTourPage(),
                  onTap: () {
                    widget.changePage();
                  },
                ),
                TourItem(tourItemData: TourItemData.initial()),
                TourItem(tourItemData: TourItemData.initial().copyWith(hasDoneWorking: true)),
                TourItem(tourItemData: TourItemData.initial().copyWith(hasDoneWorking: true)),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: 2,
                    position: currentPage,
                    decorator: const DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 60,
          ),
        ],
      ),
    );
  }
}
