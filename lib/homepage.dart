import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:whether_app/temperaturewidget.dart';

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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          const Padding(padding:EdgeInsets.only(top: 40,left: 10),
            child: Row(
              children: [
                CircleAvatar(backgroundColor: Colors.black,radius: 25,
                  child: Icon(CupertinoIcons.location_fill,color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(backgroundColor: Colors.black,radius: 25,
                  child: Icon(CupertinoIcons.plus,color: Colors.white),
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
          ),
          const Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Berlin',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
                Text('Mostly sunny',
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: height / 1.95,
            child: Text('26°',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 150,
                    color: Colors.black)),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: height / 16,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: CupertinoColors.black,
                  borderRadius: BorderRadius.circular(25)),
              height: height / 5.5,
              width: width,
              child: const Row(
                  children: [
                    TempWidget(),
                    TempWidget(),
                    TempWidget(),
                    TempWidget(),
                    TempWidget(),
                  ]),
            ),
          )
        ],
      ),
    );
  }
}
