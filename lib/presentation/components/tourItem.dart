import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'button_style.dart';

class TourItemData extends Equatable {
  final String place;
  final String date;
  final String description;
  final int totalSales;
  final int profits;
  final int freeDownload;
  final bool hasDoneWorking;

  const TourItemData({
    required this.place,
    required this.date,
    required this.description,
    required this.totalSales,
    required this.profits,
    required this.freeDownload,
    required this.hasDoneWorking,
  });

  factory TourItemData.initial() {
    return TourItemData(
      place: '세비야',
      date: '2020-01-01',
      description: '세비야 아간 산책투어 #감성투어',
      totalSales: 103,
      profits: 500000,
      freeDownload: 1,
      hasDoneWorking: false,
    );
  }

  @override
  List<Object> get props => [
        place,
        date,
        description,
        totalSales,
        profits,
        freeDownload,
        hasDoneWorking,
      ];

  TourItemData copyWith({
    String? place,
    String? date,
    String? description,
    int? totalSales,
    int? profits,
    int? freeDownload,
    bool? hasDoneWorking,
  }) {
    return TourItemData(
      place: place ?? this.place,
      date: date ?? this.date,
      description: description ?? this.description,
      totalSales: totalSales ?? this.totalSales,
      profits: profits ?? this.profits,
      freeDownload: freeDownload ?? this.freeDownload,
      hasDoneWorking: hasDoneWorking ?? this.hasDoneWorking,
    );
  }

  @override
  String toString() {
    return 'TourItemData{place: $place, date: $date, description: $description, totalSales: $totalSales, profits: $profits, freeDownload: $freeDownload, hasDoneWorking: $hasDoneWorking}';
  }
}

class TourItem extends StatelessWidget {
  const TourItem({Key? key, required this.tourItemData}) : super(key: key);
  final TourItemData tourItemData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var f = NumberFormat('###,###,###,###');
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    tourItemData.place,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    tourItemData.date,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              const Text('세비아 야간 산책투어 #감성투어', style: TextStyle(fontSize: 12)),
              const SizedBox(height: 12),
              Row(
                children: [
                  Text.rich(
                    TextSpan(
                      text: '총 판매수 ',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                            text: tourItemData.totalSales.toString(),
                            style: const TextStyle(
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline,
                                fontSize: 12)),
                        const TextSpan(
                            text: '건', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text.rich(
                    TextSpan(
                      text: '총 수익금 ',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                            text: f.format(tourItemData.profits),
                            style: const TextStyle(
                                color: Colors.redAccent,
                                decoration: TextDecoration.underline,
                                fontSize: 12)),
                        const TextSpan(
                            text: '원', style: TextStyle(fontSize: 12, color: Colors.redAccent)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text.rich(
                    TextSpan(
                      text: '무료다운로드 ',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                      children: [
                        TextSpan(
                          text: tourItemData.freeDownload.toString(),
                          style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                              decoration: TextDecoration.underline),
                        ),
                        const TextSpan(
                            text: '건', style: TextStyle(color: Colors.redAccent, fontSize: 12)),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          right: 30,
          top: 20,
          child: ElevatedButton(
            onPressed: () {},
            style: elevatedButtonStyle(size,
                flex: 0.25,
                height: 14,
                padding: 5,
                color: tourItemData.hasDoneWorking ? Colors.green : const Color(0xffff5a5f)),
            child: Text(
              tourItemData.hasDoneWorking ? '판매중' : '작업중',
              style: const TextStyle(fontSize: 13),
            ),
          ),
        ),
      ],
    );
  }
}
