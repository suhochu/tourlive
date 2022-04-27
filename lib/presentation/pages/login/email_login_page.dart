import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/components/button_style.dart';
import 'package:tour_live_draft/presentation/pages/login/email_reset_page.dart';
import 'package:tour_live_draft/presentation/pages/resistor/resist_creator.dart';
import 'package:tour_live_draft/presentation/pages/login/signup_page.dart';
import 'package:validators/validators.dart';

import '../../components/textfield_style.dart';

class EmailLogInPage extends StatefulWidget {
  static const routeName = '/signIn';

  const EmailLogInPage({Key? key}) : super(key: key);

  @override
  State<EmailLogInPage> createState() => _EmailLogInPageState();
}

class _EmailLogInPageState extends State<EmailLogInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: ListView(
              reverse: true,
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16, top: 40),
                      child: Image.asset(
                        'assets/images/TourLive.png',
                        fit: BoxFit.cover,
                        width: 150,
                      ),
                      // width: size.width * 0.1,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: size.height * 0.1,),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        decoration: textFieldDecoration('이메일'),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email required';
                          }
                          if (!isEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        obscureText: true,
                        decoration: textFieldDecoration('비밀번호'),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Password required';
                          }
                          if (value.trim().length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _password = value;
                        },
                      ),
                      const SizedBox(height: 30.0),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RegisterCreatorPage.routeName, (route) => false);
                        },
                        child: const Text('로그인'),
                        style: elevatedButtonStyle(size),
                      ),
                      const SizedBox(height: 30.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, SignUpPage.routeName);
                        },
                        child: Container(
                          child: const Text(
                            '이메일로 회원가입',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          decoration: const BoxDecoration(
                              border: Border(bottom: BorderSide(color: Colors.black))),
                        ),
                      ),
                      // const SizedBox(height: 10,),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, EmailResetPage.routeName);
                        },
                        child: const Text(
                          '비밀번호가 기억이 안나시나요?',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ),
              ].reversed.toList(),
            ),
          ),
        ),
      ),
    );
  }
}
