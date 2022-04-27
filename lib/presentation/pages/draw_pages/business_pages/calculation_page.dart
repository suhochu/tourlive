import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({Key? key}) : super(key: key);

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  late String _selectedFilter;
  String _date = '날짜선택';
  bool _dateSelected = false;
  final List<String> _productFilter = ['전체상품', '결제완료', '미결제', '취소'];
  int count = 7;
  int selectedPage = 1;

  @override
  void initState() {
    _selectedFilter = _productFilter[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _selectingFilter(),
        _summeryText(),
        _calculationContents(),
        _commentText(),
      ],
    );
  }

  Padding _selectingFilter() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: 150,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3),
            ),
            child: DropdownButton(
              iconSize: 24,
              underline: const SizedBox(),
              isExpanded: true,
              value: _selectedFilter,
              items: _productFilter
                  .map((value) => DropdownMenuItem(
                        child: Text(
                          value,
                          style: const TextStyle(fontSize: 14),
                        ),
                        value: value,
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedFilter = value.toString();
                });
              },
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: 150,
            height: 35,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(3),
            ),
            child: GestureDetector(
              onTap: _timeSelection,
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today,
                    color: Colors.black87,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(_date),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black87,
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _timeSelection() async {
    final year = DateTime.now().year;
    final DateTime? dateTime = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(year),
        lastDate: DateTime(year + 10),
        confirmText: '선택',
        cancelText: '취소',
        fieldLabelText: '날짜를 입력하세요',
        fieldHintText: '연. 월. 일.',
        errorFormatText: '연. 월. 일. 형태로 입력하세요',
        errorInvalidText: '범위 내의 날짜를 입력하세요',
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: const ColorScheme.dark(
                primary: Color(0xffFF5722),
                onPrimary: Color(0xffD7CCC8),
                surface: Color(0xFF182233),
                onSurface: Color(0xffFFFFFF),
              ),
              dialogBackgroundColor: const Color(0xFF182233),
            ),
            child: child!,
          );
        });

    String? month, day;
    if (dateTime != null) {
      _dateSelected = true;
      if (dateTime.month.toString().length == 1) {
        month = '0' + dateTime.month.toString();
      } else {
        month = dateTime.month.toString();
      }
      if (dateTime.day.toString().length == 1) {
        day = '0' + dateTime.day.toString();
      } else {
        day = dateTime.day.toString();
      }
      setState(() {
        _date = dateTime.year.toString() + '/' + month! + '/' + day!;
      });
    }
  }

  Widget _summeryText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            '2019년 8월 전체 상품',
            style: TextStyle(fontSize: 12),
          ),
          Text.rich(
            TextSpan(
              text: '총수익금 250,000',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              children: [TextSpan(text: '원', style: TextStyle(fontSize: 14, color: Colors.red))],
            ),
          ),
          Text.rich(
            TextSpan(
              text: '총 291',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              children: [TextSpan(text: '건', style: TextStyle(fontSize: 14, color: Colors.red))],
            ),
          ),
        ],
      ),
    );
  }

  Widget _calculationContents() {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 40) * 0.27,
                  child: const Text(
                    '투어명',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.25,
                  child: const Text(
                    '결재일',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '결제상태',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '투어금액',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 1),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 40) * 0.27,
                  child: const Text(
                    '세비야별밤투어',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.25,
                  child: const Text(
                    '2020-03-01 17:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '결재완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '10,000원',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 40) * 0.27,
                  child: const Text(
                    '세비야별밤투어',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.25,
                  child: const Text(
                    '2020-03-01 17:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '결재완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '10,000원',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 40) * 0.27,
                  child: const Text(
                    '세비야별밤투어',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.25,
                  child: const Text(
                    '2020-03-01 17:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '결재완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '10,000원',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Row(
              children: [
                SizedBox(
                  width: (size.width - 40) * 0.27,
                  child: const Text(
                    '세비야별밤투어',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.25,
                  child: const Text(
                    '2020-03-01 17:00',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '결재완료',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.red),
                  ),
                ),
                SizedBox(
                  width: (size.width - 40) * 0.23,
                  child: const Text(
                    '10,000원',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
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
          )
        ],
      ),
    );
  }

  Widget _commentText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('매달 5일에 정산내역이 메일로 발송됩니다.'),
          Text('총 수익금에서 세금 3.3%가 공제되어 송금됩니다.'),
        ],
      ),
    );
  }
}
