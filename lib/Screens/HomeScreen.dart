// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:menu_web_app/Models/MenuModel1.dart';

class HomeScreen extends StatefulWidget {
  List<HomeData> homeData;
  HomeScreen({this.homeData});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Column(
              children: [
                for (var item in widget.homeData)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          child: Text(
                        item.stepTitle,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(child: Text(item.stepDesc)),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
