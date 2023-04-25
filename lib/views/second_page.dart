import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../apiModel/apidatamodel.dart';

class Second_page extends StatefulWidget {
  const Second_page({Key? key}) : super(key: key);

  @override
  State<Second_page> createState() => _Second_pageState();
}

class _Second_pageState extends State<Second_page> {
  final token = 'token 2f8692b89331cc8:c0b6275c3573da3';

  @override
  void initState() {
    apidat();
    super.initState();
  }

  List<Apidatamodel> lst = [Apidatamodel(name: 'sameer')];

  Future<List<Apidatamodel>> apidat() async {
    Response response = await get(
        Uri.parse(
            'https://demo.extensionerp.com/api/resource/Employee Checkin'),
        headers: {'Authorization': 'token 2f8692b89331cc8:c0b6275c3573da3'});

    var data = jsonDecode(response.body)["data"];
    for (Map i in data) {
      lst.add(Apidatamodel.fromJson(i));
      // log(i.toString());
      // log(data.toString());
    }
    log("random" + lst.toString());
    // print(lst);
    return lst;
    // print(data);
  }

  @override
  Widget build(BuildContext context) {
    print(lst.toString());
    return Scaffold(
      body: Center(
          // child:
          child: ListView.builder(
        itemCount: lst.length,
        itemBuilder: (context, index) => Text(lst[index].name),
      )),
    );
  }
}
