import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/displ.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'routes.dart';
import 'kol.dart';
import 'map.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';


void main() async {
  runApp(MyApp());
}

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
  GlobalKey<ScaffoldState> scaf = GlobalKey<ScaffoldState>();
  var durationn;
  var alrm = 15;
  var outind;
  TextEditingController search;
  TextEditingController des;
  // TextEditingController search = TextEditingController();
  // TextEditingController des = TextEditingController();
  FlutterLocalNotificationsPlugin fltrNotification;
  @override
  void initState() {
    super.initState();
    show();

    var androidInitilize = new AndroidInitializationSettings('calendar');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future notifica() async {
    var andr = AndroidNotificationDetails("andi", "Baba", "channelDescription",
        importance: Importance.max);
    var ios = IOSNotificationDetails();
    var genb = NotificationDetails(android: andr, iOS: ios);
    // await fltrNotification.show(0, "Ahaha", "Hmm Bro i got it", genb);
    var dat = DateTime.now().add(Duration(seconds: alrm.abs()));
    fltrNotification.schedule(0, "sce", "kill kill", dat, genb);
  }

  Future notificationSelected(String payload) async {}

  int num = 0;
  String hrr;
  var up = 'Update';
  double opacity = 1.0;
  bool edi = false;
  var wid = 70.0;
  bool act1 = true;
  String minn;
  String perr;

  var colour = 0xFF4E4E4E;
  var textcolour = 0xFF908A8A;
  List<Data> gh = List<Data>();
  bool hit = true;
  var desckey = 'decri';
  var month;
  var yea;
  var drag = 0;
  int temp = 0;
  int para = 0;
  String p = 'pal';
  bool set = false;
  var counter = 0;
  var s;
  var distext;
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
  bool checkcolor = false;
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
  List<String> conver24 = [
    '0',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '00',
  ];
  void listi() {
    for (int i = 0; i < 60; i++) {
      String u = '$i';
      if (u.length <= 1) {
        min.add("0$i");
      } else {
        min.add("$i");
      }
    }
  }

  List<int> year = List<int>();
  List<String> min = List<String>();
  List<String> desc = List<String>();
  List<String> longdesc = List<String>();
  List<String> convert24 = List<String>();

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

  TextEditingController emailController = new TextEditingController();
  TextEditingController longdes = new TextEditingController();
  String _chosenValue;
  var da;
  bool isSwitched = false;
  String _chosenValue3;
  String time;
  String _chosenValue1;
  String _chosenValue2;
  String _chosenValue13;

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

      checkcolor = true;
      manage1 = true;
      manage = false;
    }
    if (checkcolor) {
      if (num == cur && para == 0) {
        colour = 0xFFFD5656;
        textcolour = 0xFFFFFFFF;
      } else {
        colour = 0xFFFFFFFF;
        textcolour = 0xFF000000;
      }
    }
    if (manage1) {
      if (num == thislastmonth) {
        checkcolor = false;
        if (monthstartday != 0) {
          counter++;
          print('yess');
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
        min.clear();
        listi();
        int val = inc;
        int id = 1;
        da = val;

        var mon = month.substring(0, 3);
        print('hmm');
        isSwitched = false;
        var col = 0x61000000;
        var act = true;
        emailController.text = '';
        longdes.text = '';
        // _chosenValue = 'Category';
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return StatefulBuilder(
                builder: (context, set) {
                  return AlertDialog(
                    content: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      width: double.maxFinite,
                      height: 350,
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
                          Expanded(
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
                                TextField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Title'),
                                ),
                                SizedBox(height: 10),
                                TextField(
                                  maxLines: null,
                                  controller: longdes,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'Description'),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    focusColor: Colors.white,
                                    value: _chosenValue,

                                    //elevation: 5,
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                    iconEnabledColor: Colors.black,
                                    items: <String>[
                                      'Birthday',
                                      'Meeting',
                                      'Holiday',
                                      'Transport',
                                      'Funeral',
                                      'Marriage',
                                      'Bills',
                                      'School & college event',
                                      'Exam',
                                      'Trip',
                                      'Blog',
                                      'Health',
                                      'Sports',
                                      'Memories',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 19,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "Category",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                    onChanged: (String value) {
                                      set(() {
                                        _chosenValue = value;
                                      });
                                    },
                                  ),
                                ),
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Remind Me',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: (value) {
                                        set(() {
                                          //  displ();
                                          var moninnu = months.indexWhere(
                                              (note) => note == month);
                                          moninnu++;

                                          // print("$yea $month");
                                          // print(moninnu);
                                          // print(durationn.inDays);
                                          // print(durationn.inMinutes);
                                          //    alrm = durationn.inSeconds; // 15
                                          //    print(alrm.abs());
                                          // 0
                                          isSwitched = value;
                                          isSwitched == true
                                              ? col = 0xFF000000
                                              : col = 0x61000000;
                                          isSwitched == true
                                              ? act = false
                                              : act = true;
                                          // notifica();
                                        });
                                      },
                                      activeColor: Colors.redAccent,
                                      activeTrackColor: Colors.orange,
                                      inactiveThumbColor: Color(0xFF616161),
                                      inactiveTrackColor: Colors.grey,
                                    ),
                                    Expanded(
                                      child: AbsorbPointer(
                                        absorbing: act,
                                        child: DropdownButton<String>(
                                          focusColor: Colors.white,
                                          isExpanded: true,
                                          value: _chosenValue13,
                                          //elevation: 5,
                                          style: TextStyle(color: Colors.white),
                                          iconEnabledColor: Color(col),
                                          items: <String>[
                                            '10 min',
                                            '20 min',
                                            '30 min',
                                            '40 min',
                                            '50 min',
                                            '1 hr',
                                            '2 hr',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Color(col),
                                                    fontSize: 19),
                                              ),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            "Notify Before",
                                            style: TextStyle(
                                              color: Color(col),
                                              fontSize: 20,
                                            ),
                                          ),
                                          onChanged: (String value) {
                                            set(() {
                                              _chosenValue13 = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                AbsorbPointer(
                                  absorbing: act,
                                  child: Row(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: DropdownButton<String>(
                                          focusColor: Colors.white,
                                          value: _chosenValue1,
                                          //elevation: 5,
                                          style: TextStyle(color: Colors.white),
                                          iconEnabledColor: Color(col),
                                          items: <String>[
                                            '01',
                                            '02',
                                            '03',
                                            '04',
                                            '05',
                                            '06',
                                            '07',
                                            '08',
                                            '09',
                                            '10',
                                            '11',
                                            '12',
                                          ].map<DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    color: Color(col),
                                                    fontSize: 19),
                                              ),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            "Hr",
                                            style: TextStyle(
                                              color: Color(col),
                                              fontSize: 20,
                                            ),
                                          ),
                                          onChanged: (String value) {
                                            set(() {
                                              _chosenValue1 = value;
                                            });
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenValue2,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Color(col),
                                        items: min
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Color(col),
                                                  fontSize: 19),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Min",
                                          style: TextStyle(
                                            color: Color(col),
                                            fontSize: 20,
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          set(() {
                                            // min.clear();
                                            _chosenValue2 = value;
                                            // min.clear();
                                          });
                                        },
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      DropdownButton<String>(
                                        focusColor: Colors.white,
                                        value: _chosenValue3,
                                        //elevation: 5,
                                        style: TextStyle(color: Colors.white),
                                        iconEnabledColor: Color(col),
                                        items: <String>[
                                          'PM',
                                          'AM',
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              style: TextStyle(
                                                  color: Color(col),
                                                  fontSize: 19),
                                            ),
                                          );
                                        }).toList(),
                                        hint: Text(
                                          "Period",
                                          style: TextStyle(
                                            color: Color(col),
                                            fontSize: 20,
                                          ),
                                        ),
                                        onChanged: (String value) {
                                          set(() {
                                            // min.clear();
                                            _chosenValue3 = value;

                                            // min.clear();
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            indent: 2.0,
                            endIndent: 3.0,
                            color: Colors.black,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: FlatButton(
                                  color: Color(0xFFFD5656),
                                  child: Text(
                                    'Reset',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      show();
                                      Navigator.of(context, rootNavigator: true)
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
                                  color: Color(0xFFFD5656),
                                  child: Text(
                                    'Save',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (isSwitched) {
                                      time = "$_chosenValue1$_chosenValue2";
                                      var moninnu = months
                                          .indexWhere((note) => note == month);
                                      moninnu++;
                                      String h = _chosenValue1;
                                      String u = '$moninnu';
                                      String v = '$val';
                                      if (u.length <= 1) {
                                        u = "0$moninnu";
                                      }
                                      if (v.length <= 1) {
                                        v = "0$val";
                                      }
                                      if (_chosenValue3 == "PM") {
                                        int con = int.parse(_chosenValue1);
                                        h = conver24[con];
                                      }
                                      if (_chosenValue1 != null &&
                                          _chosenValue2 != null &&
                                          _chosenValue3 != null) {
                                        durationn = DateTime.now().difference(
                                            DateTime.parse(
                                                "$yea-$u-$v $h:$_chosenValue2:00"));

                                        alrm = durationn.inSeconds; // 15
                                        print(alrm.abs());

                                        insertdata();
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .pop();
                                      } else {
                                        print('pls');
                                      }
                                    } else {
                                      insertdata();
                                    }
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



//database
  var pac = 'ok';
  void insertdata() async {
    final dbhelper = Databasehelper.instance;
    var mon = month.substring(0, 3);
    var dat = "$da $mon $yea";
    var title = emailController.text;
    var desd = longdes.text;
    var no = DateTime.now();
    if (emailController.text == '' ||
        longdes.text == '' ||
        _chosenValue == null) {
      print('soory');
      print(emailController.text);
      print(longdes.text);
      print(_chosenValue);
    } else {
      Map<String, dynamic> row = {
        Databasehelper.columntitle: "$title",
        Databasehelper.columndesc: "$desd",
        Databasehelper.columcat: "$_chosenValue",
        Databasehelper.columtime: "$time",
        Databasehelper.columdate: "$dat",
        Databasehelper.columam: "$_chosenValue3",
        Databasehelper.columbef: "$_chosenValue13",
        Databasehelper.columnow: "$no",
      };
      final id = await dbhelper.insert(row);
      print(id);
    }
  }

  void show() async {
    gh = List<Data>();
    final dbhelper = Databasehelper.instance;
    var row = await dbhelper.queryallu();
    print(row);
    row.forEach((element) {
      var cate = Data();

      cate.tit = element['title'];
      cate.des = element['desc'];
      cate.catg = element['catg'];
      cate.time = element['tim'];
      //print(cate.time);
      cate.dat = element['Date'];
      cate.am = element['ampm'];
      cate.bef = element['bef'];

      gh.add(cate);
    });
  }

  alram() {
    print('Alarm Fired at ${DateTime.now()}');
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  Widget _buildPlayerModelList(int k) {
    return Card(
      child: ExpansionTile(
        trailing: Container(
          height: 45,
          width: 135,
          color: Color(0xFFFD5656),
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: Text(
              gh[k].dat,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 20,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ),
        title: Text(
          gh[k].tit,
          style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w500),
        ),
        subtitle: Text(gh[k].dat),
        children: <Widget>[
          Row(
            children: [
              Divider(
                color: Colors.black,
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    focusColor: Colors.white,
                    isExpanded: true,
                    icon: Visibility(
                        visible: false, child: Icon(Icons.arrow_downward)),
                    value: gh[k].catg,
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
                      'School & college event',
                      'Exam',
                      'Trip',
                      'Blog',
                      'Health',
                      'Sports',
                      'Memories',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Center(
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 19,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      "Category",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        // _chosenValue = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: TextField(
              // onChanged: alram(),
              controller: search,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  enabled: edi,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: TextField(
              controller: des,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  enabled: edi,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.black,
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 3.0),
            child: AbsorbPointer(
              absorbing: act1,
              child: Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bell,
                    size: 20,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Align(
                    // alignment: Alignment.centerLeft,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        focusColor: Colors.white,
                        value: hrr,
                        icon: Visibility(
                            visible: false, child: Icon(Icons.arrow_downward)),
                        //elevation: 5,
                        style: TextStyle(color: Colors.white),
                        //  iconEnabledColor: Color(col),
                        items: <String>[
                          '01',
                          '02',
                          '03',
                          '04',
                          '05',
                          '06',
                          '07',
                          '08',
                          '09',
                          '10',
                          '11',
                          '12',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 19),
                            ),
                          );
                        }).toList(),
                        hint: Text(
                          "Hr",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        onChanged: (String value) {
                          setState(() {
                            hrr = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Text(' : '),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Colors.white,
                      value: minn,
                      icon: Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      // iconEnabledColor: Color(col),
                      items: min.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style:
                                  TextStyle(fontSize: 19, color: Colors.black)),
                        );
                      }).toList(),
                      hint: Text(
                        "Min",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          // min.clear();
                          //  _chosenValue2 = value;
                          // min.clear();
                        });
                      },
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      focusColor: Colors.white,
                      value: perr,
                      icon: Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),

                      items: <String>[
                        'PM',
                        'AM',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(fontSize: 19, color: Colors.black),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Prd",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          // min.clear();
                          //   _chosenValue3 = value;

                          // min.clear();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Icon(
                    Icons.restore_rounded,
                    size: 22,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: DropdownButton<String>(
                      focusColor: Colors.white,
                      isExpanded: true,
                      value: _chosenValue13,
                      icon: Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      //elevation: 5,
                      style: TextStyle(color: Colors.white),
                      // iconEnabledColor: Color(col),
                      items: <String>[
                        '10 min',
                        '20 min',
                        '30 min',
                        '40 min',
                        '50 min',
                        '1 hr',
                        '2 hr',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black, fontSize: 19),
                          ),
                        );
                      }).toList(),
                      hint: Text(
                        "Notify Before",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      onChanged: (String value) {
                        setState(() {
                          //   _chosenValue13 = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      up = 'Updating...';
                      act1 = false;
                      edi = true;
                      wid = 100.0;
                      opacity = opacity == 1.0 ? 0.0 : 1.0;
                    });
                  },
                  child: AnimatedContainer(
                      child: Center(
                          child: AnimatedOpacity(
                        opacity: opacity,
                        duration: Duration(seconds: 1),
                        child: Text(up,
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      )),
                      duration: Duration(milliseconds: 300),
                      width: wid,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFFD5656),
                      )),
                ),
                SizedBox(
                  width: 20,
                ),
                AnimatedContainer(
                    child: Center(
                        child: Text('Delete',
                            style:
                                TextStyle(color: Colors.white, fontSize: 17))),
                    duration: Duration(milliseconds: 300),
                    width: wid,
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(0xFFFD5656),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
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
      key: scaf,
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(13, 13, 0, 0),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Records',
                          style: TextStyle(
                            fontSize: 27,
                          ),
                        )),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 13, 13, 0),
                      child: FlatButton(
                        color: Color(0xFFFD5656),
                        child: Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.of(context, rootNavigator: true).pop();
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black,
              ),
              Text(pac),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: desc.length,
                  itemBuilder: (BuildContext context, inde) {
                    return ListTile(
                      onTap: () {},
                      title: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(desc[inde])),
                      tileColor: selectedIndex == inde ? Colors.blue : null,
                    );
                  }),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xFF504242),
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                scaf.currentState.openDrawer();
                scaf.currentState.openEndDrawer();
              },
              child: Divider(
                color: Colors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: GestureDetector(
                    onTap: () {
                      scaf.currentState.openDrawer();
                    },
                    child: Icon(
                      FontAwesomeIcons.folder,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    indent: 30,
                    endIndent: 30,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Page3()));
                      },
                      child: Icon(
                        FontAwesomeIcons.ellipsisV,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            GestureDetector(
              onTap: () {
                scaf.currentState.openDrawer();
              },
              child: Divider(
                color: Colors.white,
              ),
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
