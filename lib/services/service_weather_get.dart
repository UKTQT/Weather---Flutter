import 'dart:convert';
import 'package:http/http.dart' as http;

List? data;
Future getJsonData() async {
  var response = await http.get(
      Uri.parse(
          'https://api.collectapi.com/weather/getWeather?data.lang=tr&data.city=eskişehir'),
      headers: {
        'content-type': 'application/json',
        'authorization': 'apikey 05wzdRQgyXLmQq1fJ92zpk:0dFbx5ZQ7xPQZfUtdegnXn'
      });

  var convertDatatoJson = json.decode(response.body);
  data = convertDatatoJson['result'];
  print(data![0]['day']);
  return data;
}
