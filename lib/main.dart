import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:menu_web_app/RightContainer/upper_nav.dart';
import 'Screens/GetStartedScreen.dart';
import 'Screens/HomeScreen.dart';
import 'SideContainer/header_logo.dart';
import 'Models/MenuModel1.dart';
import 'package:json_table/json_table.dart';
import 'package:hovering/hovering.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mystique Help File',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Mystique Help File'.toString()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var expanded = -2;
  var title = "";
  var description = "";
  bool pressed = false;
  List<bool> _list = [true, false, true, false];

  List<Steps> steps;
  var tableCompare;
  List<Tables> tables;

  MenuDataModel filteredMenu;
  MenuDataModel allMenu;
  bool isSelected;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final String response =
        await rootBundle.loadString('json/mystique_help_file.json');
    final String response1 =
        await rootBundle.loadString('json/mystique_help_file.json');

    var jsonDecoded = jsonDecode(response);
    var jsonDecoded1 = jsonDecode(response1);
    allMenu = MenuDataModel.fromJson(jsonDecoded);
    filteredMenu = MenuDataModel.fromJson(jsonDecoded1);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Container(
              width: 300,
              color: Colors.black,
              child: filteredMenu == null
                  ? Container()
                  : Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                            onTap: () {
                              expanded = -2;
                              setState(() {});
                            },
                            child: headerlogo),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: searchWidget(onChange: (val) {
                            var dataMenu = allMenu;
                            var data = allMenu.data;

                            var fData = data
                                .where((e) =>
                                    e.topic.toLowerCase().contains(
                                        val.toString().toLowerCase()) ||
                                    e.subTopic
                                            .where((m) => m.topic
                                                .toLowerCase()
                                                .contains(val))
                                            .toList()
                                            .length >
                                        0)
                                .toList();

                            filteredMenu.data = fData;
                            filteredMenu.homeData = dataMenu.homeData;
                            filteredMenu.docsTitle = dataMenu.docsTitle;
                            filteredMenu.docsDesc = dataMenu.docsDesc;

                            List<Data> lstData = [];
                            lstData.clear();

                            for (var item in fData) {
                              Data oneItem = Data();
                              List<SubTopic> subTopic = [];
                              for (var subItem in item.subTopic) {
                                if (subItem.topic.toLowerCase().contains(val)) {
                                  subTopic.add(subItem);
                                }
                              }
                              oneItem.topic = item.topic;
                              oneItem.content = item.content;
                              oneItem.subTopic = subTopic;
                              lstData.add(oneItem);
                            }
                            filteredMenu.data = lstData;
                            setState(() {});
                          }),
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              for (var i = 0; i < filteredMenu.data.length; i++)
                                Column(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 7),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: InkWell(
                                        onTap: () {
                                          if (expanded == i) {
                                            expanded = -1;
                                          } else {
                                            expanded = i;
                                          }
                                          if (filteredMenu
                                                  .data[i].subTopic.length >
                                              0) {
                                            title = filteredMenu.data[i]
                                                .subTopic[0].content.title;
                                            description = filteredMenu
                                                .data[i]
                                                .subTopic[0]
                                                .content
                                                .description;
                                            steps = filteredMenu.data[i]
                                                .subTopic[0].content.steps;
                                            tableCompare = filteredMenu
                                                .data[i]
                                                .subTopic[0]
                                                .content
                                                .tableCompare;
                                            tables = filteredMenu.data[i]
                                                .subTopic[0].content.tables;
                                            isSelected:
                                            false;
                                          } else {
                                            if (filteredMenu.data[i].content !=
                                                null) {
                                              title = filteredMenu
                                                  .data[i].content.title;
                                              description = filteredMenu
                                                  .data[i].content.description;
                                              steps = filteredMenu
                                                  .data[i].content.steps;
                                              tables = filteredMenu
                                                  .data[i].content.tables;
                                              isSelected:
                                              false;
                                            } else {
                                              title = "";
                                              description = "";
                                              steps = [];
                                              tableCompare = filteredMenu
                                                  .data[i].content.tableCompare;
                                              tables = [];
                                            }
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          child: Text(
                                            filteredMenu.data[i].topic,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    filteredMenu.data[i].subTopic.length < 1
                                        ? Container()
                                        : Visibility(
                                            visible:
                                                expanded == i ? true : false,
                                            child: Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 30, vertical: 5),
                                              child: Wrap(
                                                direction: Axis.vertical,
                                                children: [
                                                  for (var j = 0;
                                                      j <
                                                          filteredMenu.data[i]
                                                              .subTopic.length;
                                                      j++)
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1,
                                                              vertical: 2),
                                                      child: TextButton(
                                                          style: TextButton
                                                              .styleFrom(
                                                            textStyle:
                                                                TextStyle(
                                                                    fontSize:
                                                                        17),
                                                          ),
                                                          onPressed: () {
                                                            if (filteredMenu
                                                                    .data[i]
                                                                    .subTopic[j]
                                                                    .content !=
                                                                null) {
                                                              title =
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .content
                                                                      .title;
                                                              description =
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .content
                                                                      .description;
                                                              steps =
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .content
                                                                      .steps;
                                                              tableCompare =
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .content
                                                                      .tableCompare;
                                                              tables =
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .content
                                                                      .tables;
                                                            } else {
                                                              title = "";
                                                              description = "";
                                                              steps = [];
                                                              tableCompare = '';
                                                              tables = [];
                                                            }
                                                            setState(() {
                                                              pressed =
                                                                  !pressed;
                                                            });
                                                          },
                                                          child: Container(
                                                              child: new Text(
                                                                  filteredMenu
                                                                      .data[i]
                                                                      .subTopic[
                                                                          j]
                                                                      .topic,
                                                                  style: pressed
                                                                      ? TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontSize:
                                                                              14)
                                                                      : TextStyle(
                                                                          color: Colors
                                                                              .white,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              14)))),
                                                    )
                                                ],
                                              ),
                                            ),
                                          )
                                  ],
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UpperNav(onDocClick: () {
                    expanded = -2;
                    setState(() {});
                  }, onGetStartedClick: () {
                    expanded = 0;
                    onGetStartedClick();
                    setState(() {});
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: expanded == -2
                        ? HomeScreen(
                            homeData: filteredMenu == null
                                ? []
                                : filteredMenu.homeData)
                        : expanded == -3
                            ? GetStartedScreen()
                            : Column(
                                children: [
                                  Container(
                                    child: Text(
                                      title,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 20),
                                      child: ListView(
                                        children: [
                                          Text(description),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          steps != null && steps.length > 0
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    for (var item in steps)
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          item.stepTitle !=
                                                                      null &&
                                                                  item.stepTitle
                                                                          .length >
                                                                      0
                                                              ? Text(
                                                                  item.stepTitle,
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          14),
                                                                )
                                                              : Container(),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          item.stepDescription !=
                                                                      null &&
                                                                  item.stepDescription
                                                                          .length >
                                                                      0
                                                              ? Text(
                                                                  item.stepDescription,
                                                                )
                                                              : Container(),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Image.asset(
                                                            item.figure1,
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          item.stepDesc !=
                                                                      null &&
                                                                  item.stepDesc
                                                                          .length >
                                                                      0
                                                              ? Text(
                                                                  item.stepDesc)
                                                              : Container()
                                                        ],
                                                      )
                                                  ],
                                                )
                                              : Container(),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          tableCompare != ''
                                              ? Padding(
                                                  //view table here
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: JsonTable(tableCompare,
                                                      showColumnToggle: //filter column
                                                          true),
                                                )
                                              : Container(),
                                          tables != null && tables.length > 0
                                              ? Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    for (var item in tables)
                                                      item.data != '' &&
                                                              item.data.length >
                                                                  0
                                                          ? Padding(
                                                              //view table here
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                        item.title ??
                                                                            "not defined",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14,
                                                                            fontWeight:
                                                                                FontWeight.w600)),
                                                                  ),
                                                                  JsonTable(
                                                                      item.data)
                                                                ],
                                                              ),
                                                            )
                                                          : Container(),
                                                  ],
                                                )
                                              : Container(),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                  )

                  //Image.asset(figure1)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  onGetStartedClick() {
    if (filteredMenu.data.first.subTopic.length > 0) {
      title = filteredMenu.data.first.subTopic[0].content.title;
      description = filteredMenu.data.first.subTopic[0].content.description;
      steps = filteredMenu.data.first.subTopic[0].content.steps;
      tableCompare = filteredMenu.data.first.subTopic[0].content.tableCompare;
      tables = filteredMenu.data.first.subTopic[0].content.tables;
    } else {
      if (filteredMenu.data.first.content != null) {
        title = filteredMenu.data.first.content.title;
        description = filteredMenu.data.first.content.description;
        steps = filteredMenu.data.first.content.steps;
        tableCompare = filteredMenu.data.first.content.tableCompare;
        tables = filteredMenu.data.first.content.tables;
      } else {
        title = "";
        description = "";
        steps = [];
        tableCompare = '';
        tables = [];
      }
    }
  }

  searchWidget({onChange}) {
    return Container(
      height: 35,
      width: double.infinity,
      child: TextField(
        onChanged: onChange,
        style: TextStyle(fontSize: 12.0, height: 1.0, color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: Colors.white,
          ),
          fillColor: Colors.white,
          hintText: "Search...",
          hintStyle: TextStyle(fontSize: 12.0, color: Colors.white70),
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white70,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
