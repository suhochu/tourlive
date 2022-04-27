import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_live_draft/presentation/components/route_animation.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/business_pages/business_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/drawer_page_main.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/education_page/education_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/my_tour_pages/my_tour_page.dart';
import 'presentation/pages/export.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tour Live for Guiders App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == SplashPage.routeName) {
          return SlideRightRoute(page: const SplashPage());
        }
        if (settings.name == InitialRoutePage.routeName) {
          return SlideRightRoute(page: const InitialRoutePage());
        }
        if (settings.name == LoginSelectionPage.routeName) {
          return SlideRightRoute(page: const LoginSelectionPage());
        }
        if (settings.name == SignUpPage.routeName) {
          return SlideRightRoute(page: const SignUpPage());
        }
        if (settings.name == EmailLogInPage.routeName) {
          return SlideRightRoute(page: const EmailLogInPage());
        }
        if (settings.name == EmailResetPage.routeName) {
          return SlideRightRoute(page: const EmailResetPage());
        }
        if (settings.name == RegisterCreatorPage.routeName) {
          return SlideRightRoute(page: const RegisterCreatorPage());
        }
        if (settings.name == DrawMainPage.routeName) {
          return SlideRightRoute(page: const DrawMainPage());
        }
        return null;
      },
    );
  }
}
