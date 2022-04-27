import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/login/email_login_page.dart';

import '../draw_pages/drawer_page_main.dart';

class LoginSelectionPage extends StatelessWidget {
  static const routeName = '/loginSelection';

  const LoginSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, top: 40),
              child: Image.asset('assets/images/TourLive.png', fit: BoxFit.cover),
              width: size.width * 0.35,
            ),
            Expanded(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: InkWell(
                        child: Image.asset(
                          'assets/images/kakaoLogin.png',
                          fit: BoxFit.cover,
                        ),
                        onTap: () {
                          Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => DrawMainPage()),
                                  );
                        },
                      ),
                      width: size.width * 0.85,
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, EmailLogInPage.routeName);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                            border: Border(bottom: BorderSide(color: Colors.grey))),
                        child: const Text(
                          '이메일로 로그인',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
