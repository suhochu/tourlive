import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'button_style.dart';

class ReviewData extends Equatable {
  final String name;
  final String imageUrl;
  final String uploadDate;
  final String tourItem;
  final double starCount;
  final String reviewContents;
  final String reviewAnswer;

  const ReviewData({
    required this.name,
    required this.imageUrl,
    required this.uploadDate,
    required this.tourItem,
    required this.starCount,
    required this.reviewContents,
    required this.reviewAnswer,
  });

  factory ReviewData.initial() {
    return ReviewData(
        name: '',
        imageUrl: '',
        uploadDate: '',
        tourItem: '',
        starCount: -1,
        reviewContents: '',
        reviewAnswer: '');
  }

  @override
  List<Object> get props => [
        name,
        imageUrl,
        uploadDate,
        tourItem,
        starCount,
        reviewContents,
        reviewAnswer,
      ];

  ReviewData copyWith({
    String? name,
    String? imageUrl,
    String? uploadDate,
    String? tourItem,
    double? starCount,
    String? reviewContents,
    String? reviewAnswer,
  }) {
    return ReviewData(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      uploadDate: uploadDate ?? this.uploadDate,
      tourItem: tourItem ?? this.tourItem,
      starCount: starCount ?? this.starCount,
      reviewContents: reviewContents ?? this.reviewContents,
      reviewAnswer: reviewAnswer ?? this.reviewAnswer,
    );
  }

  @override
  String toString() {
    return 'ReviewData{name: $name, imageUrl: $imageUrl, uploadDate: $uploadDate, tourItem: $tourItem, starCount: $starCount, reviewContents: $reviewContents, reviewAnswer: $reviewAnswer}';
  }
}

class Review extends StatefulWidget {
  ReviewData reviewData;
  final Size size;

  Review({Key? key, required this.reviewData, required this.size}) : super(key: key);

  @override
  State<Review> createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  late TextEditingController _textEditingController;
  String answerReview = '';
  bool hasAnswerWrote = false;
  bool hasClickedAnswerButton = false;

  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      width: widget.size.width - 40,
      height: widget.reviewData.imageUrl == '' ? 400 : 640,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 30,
                  ), //todo SVG 로 변경 할 것
                ),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.reviewData.name,
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      widget.reviewData.uploadDate,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Flexible(child: Text(widget.reviewData.tourItem, maxLines: 2)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Divider(
              color: Colors.grey,
              height: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 0, left: 20, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.orangeAccent,
                  size: 30,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  widget.reviewData.starCount.toString(),
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Text(
              widget.reviewData.reviewContents,
              style: const TextStyle(
                fontSize: 11,
                height: 2,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          if (widget.reviewData.imageUrl != '')
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 15, top: 5),
                width: widget.size.width * 0.55,
                height: widget.size.width * 0.57,
                color: Colors.grey.shade200,
                child: Image.network(
                  widget.reviewData.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          if (!hasClickedAnswerButton)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Center(
                child: TextField(
                  maxLines: 5,
                  style: const TextStyle(fontSize: 11, color: Colors.black54, height: 2),
                  controller: _textEditingController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    hintText: '${widget.reviewData.name}에게 댓글을 남겨주세요',
                    filled: true,
                    focusColor: Colors.grey.shade100,
                    focusedBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: const BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        gapPadding: 0,
                        borderSide: BorderSide(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(5)),
                    isDense: true,
                  ),
                  onChanged: (String? value) {
                    if (value != '') {
                      setState(() {
                        hasAnswerWrote = true;
                      });
                    } else {
                      setState(() {
                        hasAnswerWrote = false;
                      });
                    }
                  },
                ),
              ),
            ),
          if (hasClickedAnswerButton)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.grey,
                  ),
                  Container(
                    height: 104,
                    child: Text(
                      widget.reviewData.reviewAnswer,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        height: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: hasAnswerWrote
                      ? () {
                          if (hasClickedAnswerButton == false) {
                            hasClickedAnswerButton = true;
                            setState(() {
                              widget.reviewData = widget.reviewData
                                  .copyWith(reviewAnswer: _textEditingController.text);
                            });
                          } else {
                            setState(() {
                              hasClickedAnswerButton = false;
                            });
                          }
                        }
                      : null,
                  style: elevatedButtonStyle(widget.size,
                      flex: 0.6, height: 35, toggled: hasClickedAnswerButton),
                  child: Text(
                    hasClickedAnswerButton == false ? '답변하기' : '수정',
                    style: TextStyle(
                      color:
                          hasClickedAnswerButton == false ? Colors.white : const Color(0xffff5a5f),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
