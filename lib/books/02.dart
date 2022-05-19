import 'package:flutter/material.dart';

class Page02 extends StatelessWidget {
  const Page02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('플랭크'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/02.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '‘엎드려 뻗쳐’ 자세와 비슷한 플랭크(plank)는 집에서도 쉽게 할 수 있다. 단순하고 평범해 보이는 동작이지만 신체의 중심 근육인 코어를 강화할 수 있는 대표적 운동이다.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '뉴욕에서 활동하는 공인 트레이너 애니 멀그류는 “코어의 힘은 안정성과 밸런스를 제공하고 전반적 근력을 개선함으로서 일상 업무에 임하는 능력을 향상시킨다”고 설명했다. 코어가 강하면 움직임과 호흡이 좋아지며 모든 기능이 더 나아진다는 것.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '요가 패드는 팔굽혀펴기 말고도 여러 운동에 유용하게 쓸 수 있고, 인터넷이나 집 근처 대형마트에 저렴한 제품도 많으니 집에서 운동을 해보겠다면 하나 구매하는 것이 좋다. 귀찮다면 집에 있는 이불이라도 깔아서 하면 된다.',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }
}
