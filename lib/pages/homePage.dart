import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List exerciseNames = [
      '푸쉬업',
      '플랭크',
      '런지',
      '스쿼트',
      '벤치프레스',
      '데드리프트',
      '덤벨 컬',
      '암 프레스',
      '레그프레스'
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('다이어트 운동 도서관',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          children: List.generate(
              9,
              (index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/0${index + 1}');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(65 - index * 3,
                                135 + index * 2, 105 + index * 7, 1)),
                        child: Text(exerciseNames[index],
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold))),
                  )),
        )
      ],
    );
  }
}
