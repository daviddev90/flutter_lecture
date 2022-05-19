import 'package:flutter/material.dart';

class Page07 extends StatelessWidget {
  const Page07({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('덤벨 컬'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('images/01.png'),
              const SizedBox(
                height: 30,
              ),
              const Text(
                '푸시업의 기본 동작은 ▶ 바닥에 엎드린 자세에서 ▶ 몸통을 일직선으로 하고▶ 팔로 바닥을 밀어내는 동작을 반복하는 것이다. 손은 어깨보다 약간 넓게, 손바닥은 약간 바깥쪽으로 향한다. 몸통을 반듯하게 하되 엉덩이를 내밀어선 안된다. 허리가 처지거나 휘어서도 안된다. 몸을 내리면서 들이쉬고, 숨을 내쉬면서 몸통을 들어 올린다.',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '팔운동을 전혀 하질 않아 완전히 엎드려서 하는 것이 안 되는 초보자의 경우, 먼저 무릎을 꿇고 하는 팔굽혀 펴기가 권장되며 양 팔의 간격을 같은 간격으로 하는 것보다는 좁거나 넓게 바꿔주면서 하는 것이 좀 더 덜 힘들고 근육도 다양하게 단련할 수 있는 좋은 방법이다. 물론 딱딱한 땅바닥에 무릎을 그대로 대면 무릎에 당연히 안좋고, 무릎이 검게 변해버릴 수도 있으므로 요가에 쓰는 패드 같은 것을 무릎 쪽에 놓고 한다. ',
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
