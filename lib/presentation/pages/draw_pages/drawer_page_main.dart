import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/dash_board_page/dash_board_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/education_page/education_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/my_tour_pages/my_tour_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/my_tour_pages/my_Tour_List.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/profile_page/profile_pate.dart';
import 'business_pages/business_page.dart';
import 'notice_page/notice_page.dart';

class DrawMainPage extends StatefulWidget {
  static const routeName = '/drawerMain';

  const DrawMainPage({Key? key}) : super(key: key);

  @override
  State<DrawMainPage> createState() => _DrawMainPageState();
}

class _DrawMainPageState extends State<DrawMainPage> {
  late final PageController _pageController;

  void pageChange () {
    _pageController.jumpToPage(5);
  }

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/images/TourLive.png',
          fit: BoxFit.cover,
          width: 70,
        ),
        centerTitle: false,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              color: Colors.black,
              icon: const Icon(
                Icons.menu,
                size: 35,
              ),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            );
          }),
        ],
      ),
      endDrawer: SizedBox(
        width: size.width * 0.6,
        child: Drawer(
            child: ListView(
          children: [
            Container(
              height: size.height * 0.15,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              child: GestureDetector(
                onTap: (){
                  _pageController.jumpToPage(6);
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                      radius: 30.0,
                    ),
                    Text(
                      'Tom Cruise',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 18.0),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              title: const Text('홈', style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(0);
                  Navigator.pop(context);
                });
              },
            ),
            Container(color: Colors.grey.shade300, height: 1),
            ListTile(
              title: const Text('비지니스', style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                });
              },
            ),
            Container(color: Colors.grey.shade300, height: 1),
            ListTile(
              title: const Text('나의투어', style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                });
              },
            ),
            Container(color: Colors.grey.shade300, height: 1),
            ListTile(
              title: const Text('교육', style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(3);
                  Navigator.pop(context);
                });
              },
            ),
            Container(color: Colors.grey.shade300, height: 1),
            ListTile(
              title: const Text('공지사항', style: TextStyle(fontSize: 18, color: Colors.black54)),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                setState(() {
                  _pageController.jumpToPage(4);
                  Navigator.pop(context);
                });
              },
            ),
            Container(color: Colors.grey.shade300, height: 1),
          ],
        )),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const DashBoardPage(),
          const BusinessPage(),
          MyTourPage(changePage: pageChange,),
          const EducationPage(),
          const Notice(),
          MyTourList(),
          const ProfilePage(),
        ],
      ),
    );
  }
}
