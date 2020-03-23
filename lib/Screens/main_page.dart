import 'package:flutter/material.dart';
import 'package:covid19/services/NetworkHelper.dart';

//Import constants
import '../constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int totalCases = 1000;

  void getData() async {
    NetworkHelper covidData = NetworkHelper('https://thevirustracker.com/free-api?global=stats');
    var globalData = await covidData.getData();
    print(globalData);
    //print(globalData['results'][0]);
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
     child: Center(
       child: Column(
         children: <Widget>[
           Expanded(
             child: Row(
               children: <Widget>[
                 Expanded(
                   child: Container(
                     margin: EdgeInsets.all(15.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: kCardColorStats,
                     ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Total Cases',
                              style: kLabelTextSize
                            ),
                            Text(
                                '${totalCases.toString()}',
                                style: kNumberTextStyle
                            ),
                          ],
                       ),
                   ),
                 ),
               ],
             )
           ),
           Expanded(
               child: Row(
                 children: <Widget>[
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only(left: 15.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                         color: kCardColorStats,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text(
                               'New cases',
                               style: kLabelSubTextSize
                           ),
                           Text(
                               '${totalCases.toString()}',
                               style: kNumberSubTextStyle
                           ),
                         ],
                       ),
                     ),
                   ),
                   SizedBox(
                     width: 2.0
                   ),
                   Expanded(
                     child: Container(
                       decoration: BoxDecoration(
                         color: kCardColorStats,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text(
                               'Total deaths today',
                               style: kLabelSubTextSize
                           ),
                           Text(
                               '${totalCases.toString()}',
                               style: kNumberSubTextStyle
                           ),
                         ],
                       ),
                     ),
                   ),
                   SizedBox(
                       width: 2.0
                   ),
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.only(right: 15.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                         color: kCardColorStats,
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Text(
                               'Total deaths',
                               style: kLabelSubTextSize
                           ),
                           Text(
                               '${totalCases.toString()}',
                               style: kNumberSubTextStyle
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               )
           ),
           Expanded(
               child: Row(
                 children: <Widget>[
                   Expanded(
                     child: Container(
                       margin: EdgeInsets.all(15.0),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10.0),
                         color: kCardColorIndia,
                       ),
                     ),
                   ),
                 ],
               )
           ),
         ],
       ),
     ),
    );
  }
}