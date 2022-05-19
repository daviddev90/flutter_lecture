import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late TextEditingController firstController;
  late TextEditingController secondController;
  late double calcResult;

  @override
  void initState() {
    firstController = TextEditingController();
    secondController = TextEditingController();
    calcResult = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //scaffold를 감싸고 아래 내용을 줘야 키보드를 없앨 수 있다.
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Single Textfield'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text('결과: $calcResult'),
              TextField(
                controller: firstController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: secondController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        calcResult = double.parse(firstController.text) +
                            double.parse(secondController.text);
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        calcResult = double.parse(firstController.text) -
                            double.parse(secondController.text);
                      });
                    },
                    child: const Icon(Icons.remove),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        calcResult = double.parse(firstController.text) *
                            double.parse(secondController.text);
                      });
                    },
                    child: const Icon(Icons.close),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        calcResult = double.parse(firstController.text) /
                            double.parse(secondController.text);
                      });
                    },
                    child: const Icon(Icons.percent),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // -- Functions

}
