import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/components/tourItem.dart';

class MyTourList extends StatefulWidget {
  MyTourList({Key? key}) : super(key: key);

  @override
  State<MyTourList> createState() => _MyTourListState();
}

class _MyTourListState extends State<MyTourList> {
  int count = 7;
  int selectedPage = 1;
  List<TourItemData> tourItemDataList = [
    TourItemData.initial(),
    TourItemData.initial(),
    TourItemData.initial(),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
    TourItemData.initial().copyWith(hasDoneWorking: true),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
          Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey))),
            child: Row(
              children: [
                const Text(
                  '상태',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: size.width * 0.3,
                ),
                const Text(
                  '투어명',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 11,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var tourItem = tourItemDataList[index];
                return tourItemTile(tourItem.description, tourItem.hasDoneWorking);
              },
              padding: const EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(7), bottomLeft: Radius.circular(7)),
                          ),
                          child: const Icon(Icons.chevron_left)),
                    );
                  } else if (index == (count - 1)) {
                    return Center(
                      child: Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 36,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(7), bottomRight: Radius.circular(7)),
                            color: Colors.white,
                          ),
                          child: const Icon(Icons.chevron_right)),
                    );
                  } else {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPage = index;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 30,
                          height: 36,
                          decoration: BoxDecoration(
                              border: Border(
                                top: const BorderSide(color: Colors.grey),
                                bottom: const BorderSide(color: Colors.grey),
                                right: BorderSide(
                                    color: index == (count - 2) ? Colors.transparent : Colors.grey),
                              ),
                              color: (index) == selectedPage ? Colors.red : Colors.white),
                          child: Text(
                            (index).toString(),
                            style: TextStyle(
                                fontSize: 20,
                                color: (index) == selectedPage ? Colors.white : Colors.black),
                          ),
                        ),
                      ),
                    );
                  }
                },
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: count,
              ),
            ),
          ),
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  ListTile tourItemTile(String title, bool hasDoneWorking) {
    return ListTile(
      dense: true,
      leading: Container(
        alignment: Alignment.center,
        width: 60,
        height: 28,
        child: Text(
          hasDoneWorking ? '판매중' : '작업중',
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: hasDoneWorking ? Colors.green : Colors.redAccent),
      ),
      title: Center(child: Text(title, style: const TextStyle(fontSize: 13),)),
      trailing: TextButton(
        child: const Text('보기', style: TextStyle(decoration: TextDecoration.underline, fontSize: 13),),
        onPressed: (){},
      ),
    );
  }
}
