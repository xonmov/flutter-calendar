import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'routes.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int num = 0;
  var colour = 0xFF4E4E4E;
  var textcolour = 0xFF908A8A;
  bool hit = true;
  var month;
  var yea;
  var drag = 0;
  int temp = 0;
  int para = 0;
  String p = 'pal';
  bool set = false;
  var counter = 0;
  var s;
  var st = 0;
  var d;
  var index1 = 0;
  var a;
  var c;
  var cur;
  final globalKey = GlobalKey<ScaffoldState>();
  var get1;
  var thisyr;
  var thismon;
  bool manage = true;
  bool manage1 = false;
  void action() {
    if (set) {
      cat1();
    } else {
      cat();
    }
  }

  List<String> notes = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  List<int> year = List<int>();

  var get = 0;
  var lastmonth = 0;
  int monthstartday = 0;
  int thislastmonth = 0;
  void cat() {
    var dat = DateTime.now();
    DateTime day = DateTime(dat.year, dat.month - temp, 1);
    DateTime pdaylast = DateTime(dat.year, dat.month - temp, 0);
    DateTime todaylast = DateTime(dat.year, dat.month - temp + 1, 0);
    DateTime today = DateTime(dat.year, dat.month, dat.day);
    a = DateFormat('d').format(todaylast);
    s = DateFormat('EEEE').format(day);
    month = DateFormat('MMMM').format(day);
    print("cat121");
    print(month);
    c = DateFormat('d').format(today);
    if (st == 0) {
      thisyr = DateFormat('y').format(day);
      thismon = months.indexWhere((note) => note == month);
      st++;
    }
    yea = DateFormat('y').format(day);

    d = DateFormat('d').format(pdaylast);
    var index = notes.indexWhere((note) => note == s);
    monthstartday = index;
    var one = int.parse(d);
    cur = int.parse(c);
    var two = int.parse(a);
    lastmonth = one;
    thislastmonth = two;
  }

  void cat1() {
    var dat = DateTime.now();
    DateTime d1 = DateTime(
      dat.year,
      dat.month + temp,
      1,
    );
    DateTime pdaylast = DateTime(dat.year, dat.month + temp, 0);
    DateTime todaylast = DateTime(dat.year, dat.month + temp + 1, 0);
    DateTime today = DateTime(dat.year, dat.month, dat.day);
    c = DateFormat('d').format(today);
    s = DateFormat('EEEE').format(d1);
    month = DateFormat('MMMM').format(d1);
    print("cat2");
    print(month);
    d = DateFormat('d').format(pdaylast);
    a = DateFormat('d').format(todaylast);
    yea = DateFormat('y').format(d1);
    if (st == 0) {
      thisyr = DateFormat('y').format(d1);
      thismon = months.indexWhere((note) => note == month);
      st++;
    }
    var index = notes.indexWhere((note) => note == s);
    monthstartday = index;
    var two = int.parse(a);
    cur = int.parse(c);
    var one = int.parse(d);
    lastmonth = one;
    thislastmonth = two;
  }

  void yeaf() {
    var y = 1800;
    for (int i = 0; i < 300; i++) {
      print(y);
      year.add(y);
      y++;
    }
  }

  void changey() {
    var two = int.parse(yea);
    if (two > get) {
      two = two - get;
      two = two.abs();
      two = two * 12;
      for (int i = 0; i < two; i++) {
        setState(() {
          if (para == 0) {
            set = false;
          }
          para--;
          temp = para;
          temp = para.abs();
        });
      }
    } else {
      print('came');
      two = two - get;
      two = two.abs();
      two = two * 12;
      for (int i = 0; i < two; i++) {
        setState(() {
          if (para == 0) {
            set = true;
          }
          para++;
          temp = para;
          temp = para.abs();
        });
      }
    }
    if (get1 != null) {
      print("here");
      print(index1);
      print(month);
      if (get1 > index1) {
        get1 = get1 - index1;

        for (int i = 0; i < get1; i++) {
          setState(() {
            if (para == 0) {
              set = true;
            }
            para++;
            temp = para;
            temp = para.abs();
          });
        }
      } else {
        get1 = index1 - get1;
        for (int i = 0; i < get1; i++) {
          setState(() {
            if (para == 0) {
              set = false;
            }
            para--;
            temp = para;
            temp = para.abs();
          });
        }
      }
    }
  }

  void them() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, set) {
              return AlertDialog(
                content: Container(
                  width: double.maxFinite,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: []),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }

  void current() {
    var two = int.parse(yea);
    var twoo = int.parse(thisyr);

    if (two > twoo) {
      two = two - twoo;
      two = two.abs();
      two = two * 12;
      for (int i = 0; i < two; i++) {
        setState(() {
          if (para == 0) {
            set = false;
          }
          para--;
          temp = para;
          temp = para.abs();
        });
      }
    } else {
      two = two - twoo;
      two = two.abs();
      two = two * 12;
      for (int i = 0; i < two; i++) {
        setState(() {
          if (para == 0) {
            set = true;
          }
          para++;
          temp = para;
          temp = para.abs();
        });
      }
    }

    var index = months.indexWhere((note) => note == month);
    print(index);
    print(thismon);
    if (index < thismon) {
      index = thismon - index;

      for (int i = 0; i < index; i++) {
        setState(() {
          if (para == 0) {
            set = true;
          }
          para++;
          temp = para;
          temp = para.abs();
        });
      }
    } else {
      index = index - thismon;
      for (int i = 0; i < index; i++) {
        setState(() {
          if (para == 0) {
            set = false;
          }
          para--;
          temp = para;
          temp = para.abs();
        });
      }
    }
  }

  void tracker() {
    if (monthstartday > 0) {
      num = lastmonth - monthstartday;
    } else {
      num = 0;
    }
  }

  Expanded makebox(inc) {
    inc++;
    num++;

    //color
    if (counter == 1) {
      colour = 0xFFFFFFFF;
      textcolour = 0xFF000000;
      if (num == cur && para == 0) {
        colour = 0xFFFD5656;
        textcolour = 0xFFFFFFFF;
      }
      manage = false;
      manage1 = true;
    }
    if (counter == 2) {
      textcolour = 0xFF908A8A;
      colour = 0xFF4E4E4E;
    }
    if (monthstartday != 0) {
      if (manage) {
        if (num == lastmonth) {
          counter++;
        }
      }
    } else if (manage) {
      colour = 0xFFFFFFFF;
      textcolour = 0xFF000000; //only 1
      manage1 = true;
      manage = false;
    }
    if (manage1) {
      if (num == thislastmonth) {
        if (monthstartday != 0) {
          counter++;
        } else {
          counter = 2;
        }
      }
    }
//color

    if (monthstartday != 0) {
      if (hit) {
        if (inc == lastmonth) {
          num = 0;
          hit = false;
        }
      }
    } else {
      hit = false;
    }
    if (!hit) {
      if (inc == thislastmonth) {
        num = 0;
      }
    }

    return Expanded(
        child: GestureDetector(
      onTap: () {
        int val = inc;
        var mon = month.substring(0, 3);
        String _chosenValue;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, set) {
                  return AlertDialog(
                    content: Container(
                      width: double.maxFinite,
                      height: 200,
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Event',
                                  style: TextStyle(
                                    fontSize: 25,
                                  ),
                                ),
                                Container(
                                  height: 45,
                                  width: 140,
                                  color: Color(0xFFFD5656),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      '$inc $mon $yea',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xFFFFFFFF),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                          Divider(
                            indent: 2.0,
                            endIndent: 3.0,
                            color: Colors.black,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Title'),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: DropdownButton<String>(
                              focusColor: Colors.white,
                              value: _chosenValue,
                              //elevation: 5,
                              style: TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.black,
                              items: <String>[
                                'Birthday',
                                'Meeting',
                                'Holiday',
                                'Transport',
                                'Funeral',
                                'Marriage',
                                'Bills',
                                'Love ♥',
                                'School & college event',
                                'Exam',
                                'Trip',
                                'Blog',
                                'Health',
                                'Sports',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                "Category",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                              onChanged: (String value) {
                                set(() {
                                  _chosenValue = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            });
      },
      onHorizontalDragEnd: (DragEndDetails deg) {
        if (deg.primaryVelocity > 0) {
          setState(() {
            if (para == 0) {
              set = false;
            }
            para--;
            temp = para;
            temp = para.abs();
          });
        } else {
          setState(() {
            if (para == 0) {
              set = true;
            }
            para++;
            temp = para;
            temp = para.abs();
          });
        }
      },
      child: Container(
        height: 50,
        width: 50,
        color: Color(colour),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Text(
            '$inc',
            style: TextStyle(
              fontSize: 20,
              color: Color(textcolour),
            ),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    action();
    tracker();
    hit = true;
    manage = true;
    colour = 0xFF4E4E4E;
    manage1 = false;

    counter = 0;
    int selectedIndex;
    int selectedIindex;

    return Scaffold(
      backgroundColor: Color(0xFF504242),
      body: SafeArea(
        child: Column(
          children: [
            Divider(
              color: Colors.white,
            ),
            Divider(
              color: Colors.white,
            ),
            Divider(
              color: Colors.white,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (para == 0) {
                        set = false;
                      }
                      para--;
                      temp = para;
                      temp = para.abs();
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.angleLeft,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        month,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 26, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      yeaf();
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, set) {
                                return AlertDialog(
                                  content: Container(
                                    width: double.maxFinite,
                                    child: Column(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 30.0),
                                                child: Text('Year'),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 18.0),
                                                child: Text('Month'),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Divider(color: Colors.black),
                                        Expanded(
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: <Widget>[
                                                Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 299,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              inde) {
                                                        return ListTile(
                                                          onTap: () {
                                                            set(() {
                                                              get = year
                                                                  .elementAt(
                                                                      inde);

                                                              selectedIndex =
                                                                  inde;
                                                            });
                                                          },
                                                          title: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      12.0),
                                                              child: Text(year[
                                                                      inde]
                                                                  .toString())),
                                                          tileColor:
                                                              selectedIndex ==
                                                                      inde
                                                                  ? Colors.blue
                                                                  : null,
                                                        );
                                                      }),
                                                ),
                                                Expanded(
                                                  child: ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 12,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              index) {
                                                        return ListTile(
                                                          onTap: () {
                                                            set(() {
                                                              get1 =
                                                                  months[index];
                                                              get1 = months
                                                                  .indexWhere(
                                                                      (note) =>
                                                                          note ==
                                                                          get1);

                                                              selectedIindex =
                                                                  index;
                                                            });
                                                          },
                                                          title: Text(
                                                              months[index]),
                                                          tileColor:
                                                              selectedIindex ==
                                                                      index
                                                                  ? Colors.blue
                                                                  : null,
                                                        );
                                                      }),
                                                ),
                                              ]),
                                        ),
                                        Divider(
                                          color: Colors.black,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: FlatButton(
                                                color: Colors.green,
                                                child: Text(
                                                  'Current Date',
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    current();
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.0,
                                            ),
                                            Expanded(
                                              child: FlatButton(
                                                color: Colors.green,
                                                child: Text(
                                                  'Go',
                                                ),
                                                onPressed: () {
                                                  index1 = months.indexWhere(
                                                      (element) =>
                                                          element == month);
                                                  year.clear();

                                                  changey();
                                                  Navigator.of(context,
                                                          rootNavigator: true)
                                                      .pop();
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          });
                    },
                    child: Center(
                      child: Text(
                        '$yea:',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (para == 0) {
                        set = true;
                      }
                      para++;
                      temp = para;
                      temp = para.abs();
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.angleRight,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),

            Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    ' Sun',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    'Mon',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    'Tue',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    'Wed',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    'Thu',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    ' Fri',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
                Expanded(
                  child: Text(
                    ' Sat',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 4.0,
                ),
              ],
            ),
            //sum
            Divider(
              indent: 5.0,
              endIndent: 5.0,
              color: Colors.white,
            ),

            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 5,
            ),
            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 5,
            ),

            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 5,
            ),

            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 5,
            ),

            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 5,
            ),

            Container(
                child: Row(
              children: [
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
                makebox(num),
                SizedBox(
                  width: 4.0,
                ),
              ],
            )),

            SizedBox(
              height: 20,
            ),

            GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                  msg: "♥",
                  backgroundColor: Colors.white,
                  fontSize: 25,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                );
              },
              child: Text(
                'Created By Tcode',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: 'DancingScript'),
              ),
            ),

            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
