import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import '../../components/button_style.dart';
import '../../components/textfield_style.dart';

enum passwordStatus { sendingEmail, confirmed, passwordChange }

class EmailResetPage extends StatefulWidget {
  static const routeName = '/emailReset';

  const EmailResetPage({Key? key}) : super(key: key);

  @override
  State<EmailResetPage> createState() => _EmailResetPageState();
}

class _EmailResetPageState extends State<EmailResetPage> {
  String _email = 'hello@tourlive.co.kr';
  String _newPassword = '';
  int _authNumber = -1;
  bool _isEmailSent = false;

  passwordStatus _passwordstatus = passwordStatus.sendingEmail;
  late TextEditingController _emailController;
  late TextEditingController _confirmNumberController;
  late TextEditingController _newPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _confirmNumberController = TextEditingController();
    _newPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                  Text(
                    _passwordstatus != passwordStatus.passwordChange ? '비밀번호 찾기' : '비밀번호 변경',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  if (_passwordstatus == passwordStatus.sendingEmail)
                    Column(
                      children: [
                        const SizedBox(height: 30.0),
                        TextFormField(
                          controller: _emailController,
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
                            _email = value ??= '';
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _email = _emailController.text;
                              _passwordstatus = passwordStatus.confirmed;
                            });
                          },
                          style: elevatedButtonStyle(size),
                          child: const Text(
                            '이메일로 인증번호 전송',
                          ),
                        ),
                      ],
                    ),
                  if (_passwordstatus == passwordStatus.confirmed)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40.0,
                        ),
                        const Text(
                          '가입하신 이메일로 인증번호가 발송 됩니다.',
                          style: TextStyle(fontSize: 15, color: Colors.black45),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(_email, style: const TextStyle(fontSize: 15, color: Colors.black54)),
                        TextFormField(
                          controller: _confirmNumberController,
                          keyboardType: TextInputType.number,
                          autocorrect: false,
                          decoration: textFieldDecoration('인증번호'),
                          // validator: (String? value) { },
                          // onSaved: (String? value) {},
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _authNumber = -1;
                              if (_confirmNumberController.text.isNotEmpty) {
                                print(_confirmNumberController.text);
                                _authNumber = int.parse(_confirmNumberController.text);
                              }
                                _passwordstatus = passwordStatus.passwordChange;
                            });
                          },
                          style: elevatedButtonStyle(size),
                          child: const Text(
                            '비밀번호 설정',
                          ),
                        ),
                      ],
                    ),
                  if (_passwordstatus == passwordStatus.passwordChange)
                    Column(
                      children: [
                        const SizedBox(height: 30.0),
                        TextFormField(
                          controller: _newPasswordController,
                          obscureText: true,
                          decoration: textFieldDecoration('', hint: '영문, 숫자 조합 16자리'),
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
                            _newPassword = value!;
                          },
                        ),
                        const SizedBox(height: 20.0,),
                        TextFormField(
                          obscureText: true,
                          decoration: textFieldDecoration('', hint: '비밀번호 확인'),
                          validator: (String? value) {
                            if (value != _newPasswordController.text) {
                              return 'Password are not matched';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _passwordstatus = passwordStatus.sendingEmail;
                            });
                          },
                          style: elevatedButtonStyle(size),
                          child: const Text(
                            '변경하기',
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            )
          ].reversed.toList(),
        ),
      ),
    );
  }
}
