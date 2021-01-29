import 'package:http/http.dart' as http;
import 'dart:convert';

class Networkhelper{

  final String query;
  Networkhelper(this.query);

  Future getresdata() async {
    var headers = {
      'Accept': 'application/json',
      'user-key': 'd53b089bb5464fcff6dcba255ece9ae4',
    };

    var res = await http.get('https://developers.zomato.com/api/v2.1/geocode?$query', headers: headers);
    if (res.statusCode != 200) throw Exception('http.get error: statusCode= ${res.statusCode}');
    if(res.statusCode == 200)
        {
          print(res.body);
          return jsonDecode(res.body);
        }

  }


}

