import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 100));
  }

  bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                CircleAvatar(
                  child: Icon(CupertinoIcons.location_fill),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  child: Icon(CupertinoIcons.add),
                ),
                // GestureDetector(
                //     onTap: () {
                //       setState(() {
                //         ispressed = !ispressed;
                //       });
                //       ispressed
                //           ? _animationController.forward()
                //           : _animationController.reverse();
                //     },
                //     child: Lottie.network(onLoaded: (composition) {
                //       _animationController.duration = composition.duration;
                //     }, 'https://lottie.host/12aec9b5-6c8b-489a-ad32-54975abc5e5c/adLDoVgTl6.json',
                //         controller: _animationController, repeat: false))
              ],
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Berlin',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
                  Text('Mostly sunny',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                ],
              ),
            ),
            Positioned(
                bottom: 180,
                left: 10,
                child: Text('26°',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 150,
                        color: Colors.black))),
            Positioned(
              bottom: 40,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: CupertinoColors.black,
                        borderRadius: BorderRadius.circular(20)),
                    width: 373,
                    height: 150
                ,child:Row(children: [
                  Column(
                    children: [
                      Text('data',style: TextStyle(color:Colors.white))
                    ],
                  )
                ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
