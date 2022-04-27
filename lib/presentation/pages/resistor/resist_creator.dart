import 'package:flutter/material.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/dash_board_page/dash_board_page.dart';
import 'package:tour_live_draft/presentation/pages/draw_pages/drawer_page_main.dart';
import '../../components/button_style.dart';
import '../../components/textfield_style.dart';

enum HowToKnowTourLive { one, two, three, four, five, six }

enum DoYouHaveExperience { one, two, three, four }

class RegisterCreatorPage extends StatefulWidget {
  static const routeName = '/registerCreator';

  const RegisterCreatorPage({Key? key}) : super(key: key);

  @override
  State<RegisterCreatorPage> createState() => _RegisterCreatorPageState();
}

class _RegisterCreatorPageState extends State<RegisterCreatorPage> {
  String _name = '';
  String _nickName = '';
  String _profileURL = '';
  String _phoneNumber = '';
  String _kakaoId = '';
  String _wroteOptionContent = '';
  bool _trailing = false;

  HowToKnowTourLive? _howToKnowTourLive;
  DoYouHaveExperience? _doYouHaveExperience;

  final double _columnSpacing = 30.0;

  final List<String> _dropDownMenu = ['+82 (대한민국)', '+1 (미국)', '41 (스위스)'];
  final List<String> _countryName = ['스페인', '일본', '이탈리아', '프랑스'];

  late String _selectedNationNumber;
  late String _selectedSpecialNation;
  late String _selectedLivingNation;

  late TextEditingController _nameController;
  late TextEditingController _nickNameController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _kakaoIdController;
  late TextEditingController _wroteOptionController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _nickNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _kakaoIdController = TextEditingController();
    _wroteOptionController = TextEditingController();
    _selectedNationNumber = _dropDownMenu[0];
    _selectedSpecialNation = _countryName[0];
    _selectedLivingNation = _countryName[0];
  }

  @override
  void dispose() {
    _nameController.dispose();
    _nickNameController.dispose();
    _phoneNumberController.dispose();
    _kakaoIdController.dispose();
    super.dispose();
  }

  SizedBox titleWidget(String title) {
    return SizedBox(
      child: Text(
        title,
        style: const TextStyle(fontSize: 13),
      ),
      width: 70,
    );
  }

  Widget selectionHowto(HowToKnowTourLive value, String title, {required bool trailing}) {

    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 60),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: _howToKnowTourLive,
        onChanged: (value) {
          setState(
            () {
              _howToKnowTourLive = value as HowToKnowTourLive;
              if (value == HowToKnowTourLive.six) {
                _trailing = true;
              } else {
                _trailing = false;
              }
            },
          );
        },
      ),
      trailing: trailing
          ? SizedBox(
              width: 170,
              height: 35,
              child: TextFormField(
                controller: _wroteOptionController,
                decoration: textFieldDecoration('', hint: ''),
                validator: (String? value) {
                  // if (value == null || value.trim().isEmpty) {
                  //   return '기타 내용을 입력하세요';
                  // }
                  return null;
                },
                onSaved: (String? value) {
                  _wroteOptionContent = value!;
                },
              ),
            )
          : null,
    );
  }

  Widget selectionExperience(DoYouHaveExperience value, String title) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 60),
      title: Text(title),
      leading: Radio(
        value: value,
        groupValue: _doYouHaveExperience,
        onChanged: (value) {
          setState(
            () {
              _doYouHaveExperience = value as DoYouHaveExperience;
            },
          );
        },
      ),
    );
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
          IconButton(
            color: Colors.black,
            icon: const Icon(
              Icons.menu,
              size: 35,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            color: Colors.grey.shade200,
            alignment: Alignment.centerLeft,
            child: const Text(
              '크리에이터 등록하기',
              style: TextStyle(fontSize: 26),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 20),
            child: Column(
              children: [
                // 성함
                Row(
                  children: [
                    titleWidget('성함'),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: textFieldDecoration('', hint: ''),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return '성함을 입력하세요';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _name = value!;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 닉네임
                Row(
                  children: [
                    titleWidget('닉네임'),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: textFieldDecoration('', hint: ''),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return '닉네임을 입력하세요';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _nickName = value!;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        print('중복 확인 clicked');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          '중복 확인',
                          style: TextStyle(color: Colors.red),
                        ),
                        decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                      ),
                    )
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 프로필
                Row(
                  children: [
                    titleWidget('프로필'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          'https://mblogthumb-phinf.pstatic.net/MjAyMDA0MjVfMTAx/MDAxNTg3ODE5MDEzNTA5.p3hCGnZHNY3jPLMhrHy1aXH9t20SLMsdfbnQMAbzY-wg.xfA_E3X5uMPOq3zabKoaITYGZXKkgw5TxEtMjPUmCsAg.PNG.thirdsky30/CropArea0002.png?type=w800',
                          width: 170,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            print('사진 업로드 clicked');
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Row(children: const [
                              Icon(
                                Icons.file_upload,
                                color: Colors.red,
                              ),
                              Text(
                                '사진 업로드',
                                style: TextStyle(color: Colors.red),
                              ),
                            ]),
                            decoration:
                                BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 연락처
                Row(
                  children: [
                    titleWidget('연락처'),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: DropdownButton(
                          underline: const SizedBox(),
                          value: _selectedNationNumber,
                          items: _dropDownMenu
                              .map((value) => DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedNationNumber = value.toString();
                            });
                          }),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 5, right: 10),
                        height: 50,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: textFieldDecoration('', hint: ''),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return '연락처를 입력하세요';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _phoneNumber = value!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 카카오톡 ID
                Row(
                  children: [
                    titleWidget('카카오톡 ID'),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: TextFormField(
                        controller: _kakaoIdController,
                        decoration: textFieldDecoration('', hint: ''),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return '카카오톡 ID를 입력하세요';
                          }
                          return null;
                        },
                        onSaved: (String? value) {
                          _kakaoId = value!;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 어떻게 투어라이브를 알게 되었나요?
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: 30,
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      leading: Text('어떻게 투어라이브를 알게 되었나요?'),
                    ),
                    selectionHowto(HowToKnowTourLive.one, '커뮤니티 (카페, 한인 사이트)', trailing: false),
                    selectionHowto(HowToKnowTourLive.two, '투어라이브 제안 (이메일, 전화 등)', trailing: false),
                    selectionHowto(HowToKnowTourLive.three, '복잡하게 카드 결제', trailing: false),
                    selectionHowto(HowToKnowTourLive.four, '지인추천', trailing: false),
                    selectionHowto(HowToKnowTourLive.five, '페이스북, 인스타 등 광고', trailing: false),
                    selectionHowto(HowToKnowTourLive.six, '기타', trailing: _trailing),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 전문지식 또는 현지 거주 경험이 있나요?
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemExtent: 30,
                  children: [
                    const ListTile(
                      contentPadding: EdgeInsets.only(left: 0),
                      leading: Text('전문지식 또는 현지거주경험이 있나요?'),
                    ),
                    selectionExperience(
                      DoYouHaveExperience.one,
                      '가이드투어 경험이 있습니다.(6개월 이상)',
                    ),
                    selectionExperience(
                      DoYouHaveExperience.two,
                      '전문적인 지식이 있습니다.\n(관련 학위, 공부, 업무경험)',
                    ),
                    selectionExperience(
                      DoYouHaveExperience.three,
                      '현지거주경험이 있습니다.(6개월 이상)',
                    ),
                    selectionExperience(
                      DoYouHaveExperience.four,
                      '없습니다',
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 어느 지역의 전문가 이신가요?
                Row(
                  children: [
                    const Text('어느 지역의 전문가이신가요?'),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: DropdownButton(
                          underline: const SizedBox(),
                          value: _selectedSpecialNation,
                          items: _countryName
                              .map((value) => DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedSpecialNation = value.toString();
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 어느 지역의 전문가 이신가요?
                Row(
                  children: [
                    const Text('현재 어디에 거주하고 계세요?'),
                    const SizedBox(
                      width: 25,
                    ),
                    Container(
                      width: 100,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: DropdownButton(
                          underline: const SizedBox(),
                          value: _selectedLivingNation,
                          items: _countryName
                              .map((value) => DropdownMenuItem(
                                    child: Text(
                                      value,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedLivingNation = value.toString();
                            });
                          }),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                // 소개
                Row(
                  children: [
                    const Text('소개'),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        child: TextFormField(
                          controller: _wroteOptionController,
                          style: const TextStyle(fontSize: 10),
                          maxLines: 8,
                          decoration: textFieldDecoration('',
                              hint:
                                  '여행자에게 매력적으로 보일 수 있도록 자신을 소개해주세요.\n크리에이터님의 소개가\n여행자들의 마음을 움직일 수 있을 거예요!',
                              isDense: true,
                              padding: 10),
                          validator: (String? value) {
                            if (value == null || value.trim().isEmpty) {
                              return '자기 소개를 입력하세요';
                            }
                            return null;
                          },
                          onSaved: (String? value) {
                            _wroteOptionContent = value!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: _columnSpacing),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, DrawMainPage.routeName, (route) => false);
                  },
                  child: const Text('등록'),
                  style: elevatedButtonStyle(size),
                ),
                SizedBox(height: _columnSpacing),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
