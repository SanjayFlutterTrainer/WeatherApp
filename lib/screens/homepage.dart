import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:whether_app/Provider/weather_provider.dart';
import 'package:whether_app/screens/widgets/circle_icon_container.dart';
import 'package:whether_app/screens/widgets/temperaturewidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {


  @override
  void initState() {
    // TODO: implement initState
    Provider.of<WeatherProvider>(context,listen: false).fetchData();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final providerWeather = Provider.of<WeatherProvider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
        body:providerWeather.currentWeather==null?Center(child: CircularProgressIndicator()): Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage('assets/day.jpg'))),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 10),
            child: Row(
              children: [
                IconButtonWidget(icon:CupertinoIcons.location_fill),
                SizedBox(
                  width: 10,
                ),
                IconButtonWidget(icon:CupertinoIcons.plus),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(providerWeather.currentWeather!.location.name.toString(),
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
                Text(providerWeather.currentWeather!.current.condition.text.toString(),
                    style:
                        const TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: height / 1.95,
            child: Text('${providerWeather.currentWeather?.current.tempC.round().toString()}°',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 150,
                    color: Colors.black)),
          ),
          Positioned(
            left: 10,
            right: 10,
            bottom: height / 16,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: CupertinoColors.black,
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
