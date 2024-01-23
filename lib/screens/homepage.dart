import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whether_app/data/models/wheather.dart';
import 'package:whether_app/screens/widgets/temperaturewidget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  //late AnimationController _animationController;
  String? cityName;
  String? weatherCondition;
  var temperature;
  fetchData() async {
    String baseUrl = 'api.weatherapi.com';
    String token = 'aa5da7ccfa1b4ab4be044825231912';
    final queryParameters = {
      'key': token,
      'q': 'kochi',
    };

    var url = Uri.https(baseUrl, '/v1/current.json', queryParameters);
    print(url);
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var currentWeather = weatherFromJson(response.body);
        setState(() {
          cityName = currentWeather.location.name;
          weatherCondition = currentWeather.current.condition.text;
          temperature = currentWeather.current.tempC.round();
        });
      } else {
        print('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error during data fetching: $error');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(microseconds: 100));
  }

  // bool ispressed = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fitHeight, image: AssetImage('assets/day.jpg'))),
      child: Stack(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 10),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child:
                      Icon(CupertinoIcons.location_fill, color: Colors.white),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                  child: Icon(CupertinoIcons.plus, color: Colors.white),
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
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cityName.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 35)),
                Text(weatherCondition.toString(),
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 20)),
              ],
            ),
          ),
          Positioned(
            left: 20,
            top: height / 1.95,
            child: Text('${temperature}°',
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
              child: Row(children: [
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
