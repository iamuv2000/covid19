import 'package:flutter/material.dart';
import 'package:covid19/services/NetworkHelper.dart';

//Import constants
import '../constants.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int totalCases = 0;
  int totalNewCasesToday = 0;
  int totalNewDeathsToday = 0;
  int totalDeath = 0;
  int totalCasesIndia = 0;
  int totalNewIndiaCasesToday = 0;
  int totalDeathIndia = 0;
  int totalNewDeathsTodayIndia = 0;
  int totalActiveCases = 0;

  void getData() async {
    NetworkHelper covidData = NetworkHelper('https://thevirustracker.com/free-api?global=stats');
    NetworkHelper covidDataIndia = NetworkHelper('https://thevirustracker.com/free-api?countryTotal=IN');
    var globalData = await covidData.getData();
    var indiaData = await covidDataIndia.getData();
    print(indiaData["countrydata"][0]);
    setState(() {
      totalCases = globalData['results'][0]['total_cases'];
      totalNewCasesToday = globalData['results'][0]['total_new_cases_today'];
      totalNewDeathsToday = globalData['results'][0]['total_new_deaths_today'];
      totalDeath = globalData['results'][0]['total_deaths'];
      totalCasesIndia = indiaData["countrydata"][0]["total_cases"];
      totalNewIndiaCasesToday = indiaData["countrydata"][0]["total_new_cases_today"];
      totalDeathIndia = indiaData["countrydata"][0]["total_deaths"];
      totalNewDeathsTodayIndia = indiaData["countrydata"][0]["total_new_deaths_today"];
      totalActiveCases = indiaData["countrydata"][0]["total_active_cases"];

    });
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                            '${totalNewCasesToday.toString()}',
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
                            '${totalNewDeathsToday.toString()}',
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
                            '${totalDeath.toString()}',
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
          flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: kCardColorIndia,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'India',
                                  style: kLabelIndia
                              ),
                            ),
                          ]
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                                'Total cases: ',
                                style: kNumberIndiaSubTextStyle
                            ),
                            Text(
                                '${totalCasesIndia.toString()}',
                                style: kNumberIndiaSubTextStyle
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                                'New cases: ',
                                style: kNumberIndiaSubTextStyle
                            ),
                            Text(
                                '${totalNewIndiaCasesToday.toString()}',
                                style: kNumberIndiaSubTextStyle
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                                'Total deaths: ',
                                style: kNumberIndiaSubTextStyle
                            ),
                            Text(
                                '${totalDeathIndia.toString()}',
                                style: kNumberIndiaSubTextStyle
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                                'Deaths today: ',
                                style: kNumberIndiaSubTextStyle
                            ),
                            Text(
                                '${totalNewDeathsTodayIndia.toString()}',
                                style: kNumberIndiaSubTextStyle
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text(
                                'Active cases: ',
                                style: kNumberIndiaSubTextStyle
                            ),
                            Text(
                                '${totalActiveCases.toString()}',
                                style: kNumberIndiaSubTextStyle
                            ),
                          ],
                        ),
                      ],
                    )
                  ),
                ),
              ],
            )
        ),
      ],
    );
  }
}

//TODO: Refactor code
//TODO: Integrate loading screen
//TODO: Integrate location based update on the country widget to view country relevant statistics