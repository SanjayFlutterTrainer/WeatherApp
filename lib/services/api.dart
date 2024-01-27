import 'package:http/http.dart' as http;
import 'package:whether_app/data/models/wheather.dart';
class WheatherData{

  getData()async{
    String baseurl='api.weatherapi.com/v1';
    String token ='aa5da7ccfa1b4ab4be044825231912';
    final queryParameters = {'key': '$token', 'q': 'kochi'
    };
    var url =Uri.https(baseurl,'/current.json',queryParameters);
    final response =await http.get(url);
    if(response.statusCode==200){
      var data =wheatherFromJson(response.body);
    }
    else {
      print("error");
    }  }
}