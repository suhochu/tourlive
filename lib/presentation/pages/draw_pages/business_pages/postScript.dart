import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/review.dart';

class PostScript extends StatefulWidget {
  const PostScript({Key? key}) : super(key: key);

  @override
  State<PostScript> createState() => _PostScriptState();
}

class _PostScriptState extends State<PostScript> {
  final List<String> _answerReviews = ['답글 달지 않은 후기', '달글 단 후기'];
  final List<String> _tourItems = ['[덕수궁 투어] 궁노리터와 함께 덕수궁에서 놀자', '[잠실 투어] 잠실 타워'];
  ReviewData _reviewData1 = ReviewData.initial();
  late ReviewData _reviewData2;

  late String _selectedReviewFilter;
  late String _selectedTourItem;

  @override
  void initState() {
    _selectedReviewFilter = _answerReviews[0];
    _selectedTourItem = _tourItems[0];
    _reviewData1 = _reviewData1.copyWith(
      name: '박주연',
      uploadDate: '2020.11.10',
      tourItem: '[덕수궁 투어] 궁노리터와 함께 덕수궁에서 놀자',
      starCount: 5,
      reviewContents:
          '스토리로 설명이 되어 이해하기 쉽고 머리에 쏙쏙 들어와요~ \n글구 혼자만의 리듬으로 천천히 들을 수 있어 좋아요~^^ \n좀 더 다양한 상품이 늘어나길 바랄게요~!!',
    );

    _reviewData2 = const ReviewData(
        name: '박주연',
        imageUrl: 'https://eurobike.kr/upload/goods_data/132018530425108.jpg',
        uploadDate: '2020.11.10',
        tourItem: '[덕수궁 투어] 궁노리터와 함께 덕수궁에서 놀자',
        starCount: 5,
        reviewContents:
            '스토리로 설명이 되어 이해하기 쉽고 머리에 쏙쏙 들어와요~ \n글구 혼자만의 리듬으로 천천히 들을 수 있어 좋아요~^^ \n좀 더 다양한 상품이 늘어나길 바랄게요~!!',
        reviewAnswer: '');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
          child: Row(
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
                  value: _selectedReviewFilter,
                  items: _answerReviews
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              style: const TextStyle(fontSize: 13),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedReviewFilter = value.toString();
                    });
                  },
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                width: 180,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: DropdownButton(
                  iconSize: 24,
                  underline: const SizedBox(),
                  isExpanded: true,
                  value: _selectedTourItem,
                  items: _tourItems
                      .map((value) => DropdownMenuItem(
                            child: Text(
                              value,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: const TextStyle(fontSize: 13),
                            ),
                            value: value,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedTourItem = value.toString();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Review(size: size, reviewData: _reviewData1),
        Review(size: size, reviewData: _reviewData2),
      ],
    ));
  }
}
