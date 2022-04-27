import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/initial_route_page.dart';
import 'package:tour_live_draft/presentation/pages/login/login_selection_page.dart';

class SplashPage extends StatefulWidget {
  static const routeName = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late Size size;
  double opacityValue = 0.0;

  @override
  void initState() {
    super.initState();
    _popupSplashImage();
  }

  void _popupSplashImage() async {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      opacityValue = 1.0;
    });
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushNamedAndRemoveUntil(context, LoginSelectionPage.routeName, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: opacityValue,
        duration: const Duration(seconds: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logos/appstore_logo.png'),
            const SizedBox(
              height: 20,
            ),
            const Text(
              '투어라이브 - 지식여행의 시작',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
