import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/business_pages/calculation_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/business_pages/none_Tour_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/business_pages/postScript.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/business_pages/statistics.dart';

class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> with TickerProviderStateMixin {
  late TabController _tabController;
  bool hasMyOwnTour = false;

  void hasClicked(bool value) {
    setState(() {
      hasMyOwnTour = value;
    });
  }

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          padding: const EdgeInsets.symmetric(horizontal: 24),
          color: Colors.grey.shade200,
          alignment: Alignment.centerLeft,
          child: const Text(
            '비지니스',
            style: TextStyle(fontSize: 26),
          ),
        ),
        if (hasMyOwnTour)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
              ),
              child: TabBar(
                tabs: _tabs(),
                indicator: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.red, width: 2))),
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
              ),
            ),
          ),
        if (hasMyOwnTour)
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _tabViews(),
            ),
          ),
        if (!hasMyOwnTour) NoneTourPage(hasClicked: hasClicked),
      ],
    );
  }

  List<Widget> _tabs({double height = 40}) {
    return [
      Container(
        height: height,
        alignment: Alignment.center,
        child: const Text('정산내역'),
      ),
      Container(
        height: height,
        alignment: Alignment.center,
        child: const Text('후기'),
      ),
      Container(
        height: height,
        alignment: Alignment.center,
        child: const Text('통계'),
      ),
    ];
  }

  List<Widget> _tabViews() {
    return [
      const CalculationPage(),
      const PostScript(),
      const Statistics(),
    ];
  }
}
