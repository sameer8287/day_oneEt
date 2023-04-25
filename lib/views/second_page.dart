import 'dart:convert';
import 'dart:developer';

import 'package:et/views/provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

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
    Future.delayed(Duration(seconds: 3));
    super.initState();
  }

  List lst = [];

  @override
  Widget build(BuildContext context) {
    print(lst.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: Consumer<MyProvider>(
        builder: (context, provider, _) {
          if (provider.data.isEmpty) {
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: provider.data.length,
              itemBuilder: (context, index) =>
                  ListTile(title: Text(provider.data[index])),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<MyProvider>(context, listen: false).fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
