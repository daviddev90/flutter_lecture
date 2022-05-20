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

  void _horswipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.left){
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

  void _verswipe(SwipeDirection direction){
    setState(() {
      if(direction == SwipeDirection.down){
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
        body: SimpleGestureDetector(
          onHorizontalSwipe: _horswipe,
          onVerticalSwipe: _verswipe,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/$imgIdx.jpeg'
                )
              ],
            ),
          ),
        ),
      );
  }

  // -- Functions

}
