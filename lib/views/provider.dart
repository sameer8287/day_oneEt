//  Future<List> apidat() async {
//     Response response = await get(
//         Uri.parse(
//             'https://demo.extensionerp.com/api/resource/Employee Checkin'),
//         headers: {'Authorization': 'token 2f8692b89331cc8:c0b6275c3573da3'});

//     var data = jsonDecode(response.body)["data"];
//     for (Map i in data) {
//       // log(i.toString());
//       // log(data.toString());

//       lst.add(i.toString());
//     }
//     // for
//     // log("random" + lst.toString());
//     // print(lst);
//     return lst;
//     // print(data);
//   }
// import 'package:http/http.dart' as http;
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MyProvider with ChangeNotifier {
  List<String> _data = [];

  List<String> get data => _data;

  Future<void> fetchData() async {
    var dio = Dio();
    Response response = await dio.get(
      'https://demo.extensionerp.com/api/resource/Employee Checkin',
      options: Options(
          headers: {'Authorization': 'token 2f8692b89331cc8:c0b6275c3573da3'}),
    );

    if (response.statusCode == 200) {
      log(response.data['data'][0]['name'].toString());
      var data = response.data['data'];
      for (var element in data) {
        log("Name Data" + element['name']);
        _data.add(element['name']);
      }
      // _data.add(response.data['data'][0]['name']);
      log(_data.toString());
      notifyListeners();
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
