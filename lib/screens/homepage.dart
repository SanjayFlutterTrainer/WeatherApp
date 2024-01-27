import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:whether_app/Provider/weather_provider.dart';
import 'package:whether_app/constants/colors.dart';
import 'package:whether_app/screens/widgets/circle_icon_container.dart';
import 'package:whether_app/screens/widgets/temperaturewidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(vsync: this);
    Provider.of<WeatherProvider>(context, listen: false).fetchData();
    super.initState();
  }

  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final providerWeather = Provider.of<WeatherProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: providerWeather.currentWeather == null
            ?  const Center(child: CircularProgressIndicator())
            : Container(
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitHeight,
                        image:isPressed?const AssetImage('assets/images/Japan---mt.-fuji.png.png'):const AssetImage('assets/images/Japan---mt.-fuji-night-.png'))),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 10),
                      child: Row(
                        children: [
                          const IconButtonWidget(
                              icon: CupertinoIcons.location_fill),
                          const SizedBox(
                            width: 10,
                          ),
                          const IconButtonWidget(icon: CupertinoIcons.plus),
                          Spacer(),
                          InkWell(onTap: (){
                            setState(() {
                              isPressed=!isPressed;
                            });
                            print(isPressed);
                           if(isPressed) {
                             _controller.animateTo(0.125);
                           }
                             else{
                            _controller.animateBack(0);
                           }

                          },
                            child: Container(
                              child: Lottie.asset(
                                  height:60 ,
                                  'assets/json/switch.json',
                                  repeat: false,
                                  reverse: false,
                                controller: _controller,
                                onLoaded: (composition){
                                    _controller.duration=composition.duration;
                                }
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              providerWeather.currentWeather!.location.name
                                  .toString(),
                              style:  TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 35,color: isPressed?kblack:kWhite)),
                          Text(
                              providerWeather
                                  .currentWeather!.current.condition.text
                                  .toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 20,color:isPressed?kblack:kWhite)),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: height / 1.95,
                      child: Text(
                          '${providerWeather.currentWeather?.current.tempC.round().toString()}°',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 150,
                              color:isPressed?kblack:kWhite)),
                    ),
                    Positioned(
                      left: 10,
                      right: 10,
                      bottom: height / 16,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color:kblack,
                            borderRadius: BorderRadius.circular(25)),
                        height: height / 5.5,
                        width: width,
                        child: const Row(children: [
                          TempWidget(
                              temperature: '27',
                              time: 'Now',
                              url:
                                  'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'),
                          TempWidget(
                              temperature: '28',
                              time: '11:00',
                              url:
                                  'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'),
                          TempWidget(
                              temperature: '29',
                              time: '12:00',
                              url:
                                  'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'),
                          TempWidget(
                              temperature: '31',
                              time: '13:00',
                              url:
                                  'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'),
                          TempWidget(
                              temperature: '27',
                              time: '14:00',
                              url:
                                  'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'),
                        ]),
                      ),
                    )
                  ],
                ),
              ));
  }
}
