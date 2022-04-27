import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/components/button_style.dart';
import 'package:tour_live_draft/presentation/components/textfield_style.dart';
import 'package:validators/validators.dart';

class SignUpPage extends StatefulWidget {
  static const routeName = '/signUp';

  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  final _passwordController = TextEditingController();

  String? _name;

  String? _email;

  String? _password;

  void _submit() {
    setState(() {
      _autoValidateMode = AutovalidateMode.always;
    });

    final form = _formKey.currentState;

    if (form == null || !form.validate()) return;

    form.save();

    print('name: $_name, email: $_email, password: $_password');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          autovalidateMode: _autoValidateMode,
          child: ListView(
            shrinkWrap: true,
            reverse: true,
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
              const SizedBox(height: 70.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '회원가입',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: textFieldDecoration('이름'),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Name required';
                        }
                        if (value.trim().length < 2) {
                          return 'Name must be at least 2 characters';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _name = value;
                      },
                    ),
                    const SizedBox(height: 20.0),
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
                      controller: _passwordController,
                      obscureText: true,
                      decoration: textFieldDecoration('비밀번호'),
                      validator: (String? value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Password required';
                        }
                        if (value.trim().length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                      onSaved: (String? value) {
                        _password = value;
                      },
                    ),
                    const SizedBox(height: 20.0),
                    TextFormField(
                      obscureText: true,
                      decoration: textFieldDecoration('비밀번호 확인'),
                      validator: (String? value) {
                        if (_passwordController.text != value) {
                          return 'Passwords not match';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  children: [
                    const Text(
                      '회원가입을 눌러, 이용약관 및 개인정보처리방침에 동의하고 14세 이상임을 인증합니다.',
                      style: TextStyle(fontSize: 15, color: Colors.black45),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {},
                      style: elevatedButtonStyle(size),
                      child: const Text(
                        '회원가입',
                      ),
                    ),
                  ],
                ),
              )
            ].reversed.toList(),
          ),
        ),
      ),
    );
  }
}
