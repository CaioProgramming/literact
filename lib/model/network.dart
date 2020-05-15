import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  String url;

  NetworkHelper(this.url);

  Future getData() async {
    try {
      print('requesting -> $url');
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        print(response.body);
        double temperature = decodedData['main']['temp'];
        int condition = decodedData['weather'][0]['id'];
        String city = decodedData['name'];
        print('Temperature $temperature');
        print('Condition $condition');
        print('City $city');
        return jsonDecode(response.body);
      } else {
        print('Response error status: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
