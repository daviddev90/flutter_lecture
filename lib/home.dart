import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late int imgIdx;

  @override
  void initState() {
    super.initState();
    imgIdx = 0;
  }

  void _changeIdx(bool isRight){
    setState(() {
      if(isRight){
        imgIdx += 1;
        if(imgIdx >= 13){
          imgIdx = 0;
        }
      }else{
        imgIdx -= 1;
        if(imgIdx < 0){
          imgIdx = 12;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Image Swiping'),
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('여행지-${imgIdx+1}'),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            _changeIdx(false);
                          }, icon: const Icon(Icons.arrow_left)),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blueAccent,
                                width: 10
                              ),
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Image.asset(
                              'images/$imgIdx.jpeg',width: 280,height: 600,fit: BoxFit.fill,
                            ),
                          ),
                        IconButton(
                          onPressed: () {
                            _changeIdx(true);
                          }, icon: const Icon(Icons.arrow_right)),
                      ],
                    ),
                    Positioned(
                      right: 12,
                      top: 12,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.cyanAccent,
                            width: 5
                          )
                        ),
                        child:Image.asset('images/${imgIdx < 12 ? imgIdx + 1 : 0}.jpeg',
                        width: 100,
                        height: 80,
                        fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
      );
  }

  // -- Functions

}
