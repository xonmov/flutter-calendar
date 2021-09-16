import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'kol.dart';
import 'noti.dart';
import 'map.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

class Page3 extends StatefulWidget {
  @override
  NameOfYourWidgetState createState() => NameOfYourWidgetState();
}

class NameOfYourWidgetState extends State<Page3> {
  FocusNode focusNode1;
  FocusNode focusNode2;

  var _controller;
  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
    show();
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
   // new Future.delayed(Duration(milliseconds: 1), ()  {
     // _animateToIndex(6);
      //});


  }

  List<Data> gh = List<Data>();
  List<Data> hg = List<Data>();
  List<String> min = List<String>();
var timeman=false;
  String hrr;

  var date;
  bool user = false;
  bool no = false;
  bool disable=false;
  String minn;
  bool istyping=false;
  Timer _timer;
  final _height = 100.0;
  int _start = 3;
  String perr;
  bool suspi = false;
  var g;
  var coloor=0x61000000;

  var wid = 60.0;
  var up = 'Edit';
  String _chosenValue13;
  String _chosenValue14;
  @override
  void dispose() {
    if(_timer!=null){
      _timer.cancel();

    }
    super.dispose();
  }
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
getit() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();

}
  void show() async {
    listi();
    gh = List<Data>();
    final dbhelper = Databasehelper.instance;
    var row = await dbhelper.queryallu();
    gh.clear();
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

      cate.num = element['now'];
      gh.add(cate);
      kj();
    });
  }
  void show1() async {

    listi();
    gh = List<Data>();
    final dbhelper = Databasehelper.instance;
    var row = await dbhelper.queryallu();
    gh.clear();
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

      cate.num = element['now'];
      gh.add(cate);

    });
  }

  void kj() {
    setState(() {});
  }

  var desc;
  var tit;
  void ext(g) async {
    print(g);
    final dbhelper = Databasehelper.instance;
    var row = await dbhelper.queryspecific(g);
  hg.clear();

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
      user=true;
      cate.num = element['now'];
      cate.descda = element['descdat'];
      hg.add(cate);
    });
    tit = hg[0].tit;
    desc = hg[0].des;
    date=hg[0].descda;

    if (hg[0].time == 'null') {
      suspi=true;
      hrr = null;
      minn =null;
      perr = null;
   timeman=false;
      _chosenValue13 = null;
      _chosenValue14 = hg[0].catg;
    } else {
      if (hg[0].bef == 'null') {
        _chosenValue13 = null;
      } else {
        _chosenValue13 = hg[0].bef;
      }
      timeman=true;
      coloor=0xFF000000;
      print('came j');
      hrr = hg[0].time;
      hrr = hrr.substring(0, 2);
      // print(hrr);
      minn = hg[0].time;
      minn = minn.substring(2, 4);
      perr = hg[0].am;
      _chosenValue14 = hg[0].catg;

      //  print(minn);
      // print('came');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [


             Row(
               children: [
               Padding(
                 padding: const EdgeInsets.only(left:12.0,right:12.0,top:12.0),
                 child: Center(
                   child: GestureDetector(

                      onTap:(){

                   },

                     child: Text('Records',
                         style:TextStyle(
                          fontSize: 25,
                         )),
                   ),
                 ),
               ),
              //   Expanded(
              //     child: Container(
               //      height: 50.0,
                //     child: ListView(
               //       scrollDirection: Axis.horizontal,
               //       shrinkWrap: true,
              //        children: [
                 //       Container(
                 //         margin: const EdgeInsets.all(5.0),
//
                //          decoration: BoxDecoration(
                 //           color: Colors.black54,
                //              borderRadius: BorderRadius.all(Radius.circular(20)),
                 //             border: Border.all(color: Colors.blueAccent)
//
             //             ),
                //          child: Center(child: Padding(
               //             padding: const EdgeInsets.all(5.0),
               //             child: GestureDetector(
                 //             onTap: (){

                 //             },
                 //               child: Text('Category')),
               //           )),
               //         )
            //          ],

        //    ),
        //           ),
              //   ),
               ],
             ),

          Divider(
            color: Colors.black,
          ),
          //  Text('badad'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              controller: _controller,

              shrinkWrap: true,
              itemCount: gh.length,
              itemBuilder: (BuildContext context, int index) {
                var j = gh[index].time;
                if (!no) {
                  if (j == 'null') {
                    hrr = null;
                    minn = null;
                    perr = null;
                    timeman=false;

                    _chosenValue13 = null;
                    _chosenValue14 = gh[index].catg;
                  } else {
                    if (gh[index].bef == 'null') {
                      _chosenValue13 = null;
                    } else {
                      _chosenValue13 = gh[index].bef;
                    }
                    print('came j');
                    timeman=true;
                    coloor=0xFF000000;
                    hrr = gh[index].time;
                    hrr = hrr.substring(0, 2);
                    // print(hrr);
                    minn = gh[index].time;
                    minn = minn.substring(2, 4);
                    perr = gh[index].am;
                    _chosenValue14 = gh[index].catg;

                    //  print(minn);
                    // print('came');
                  }
                } else {
                  // print('came');
                }

                return _buildPlayerModelList(index);
              },
            ),
          ),
        ],
      ),
    ));
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
            print(_start);
        if (_start == 0) {
          setState(() {

            timer.cancel();
            istyping=false;
            setState(() {
              up = 'Updated';
              wid = 90.0;
            });

          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void updater() async {


    if(timeman){
      if(hrr==null || minn==null ||perr==null){
        new Future.delayed(Duration(seconds: 8), () async {
          if(hrr==null || minn==null ||perr==null){
            print('Invalid time');
          }else{
            final dbhelper = Databasehelper.instance;
            final id1 = await dbhelper.queryspecific1(g);
            var id2 = id1.toString();
            id2 = id2.substring(6, 7);
            var id3 = int.parse(id2);
            dbhelper.update(
                tit, desc, _chosenValue13, _chosenValue14, hrr, minn, perr, g, suspi,id3,date,disable);
          }
        });
      }else{
        final dbhelper = Databasehelper.instance;
        final id1 = await dbhelper.queryspecific1(g);
        var id2 = id1.toString();
        id2 = id2.substring(6, 7);
        var id3 = int.parse(id2);
        dbhelper.update(
            tit, desc, _chosenValue13, _chosenValue14, hrr, minn, perr, g, suspi,id3,date,disable);
      }
    }else{
      final dbhelper = Databasehelper.instance;
      final id1 = await dbhelper.queryspecific1(g);
      var id2 = id1.toString();
      id2 = id2.substring(6, 7);
      var id3 = int.parse(id2);
      dbhelper.update(
          tit, desc, _chosenValue13, _chosenValue14, hrr, minn, perr, g, suspi,id3,date,disable);






   if(_timer!=null){
     if(istyping){
       _timer.cancel();
       _start=5;
       startTimer();

     }else{

     }
   }else{

     startTimer();
   }

    }






disable=false;

  }

  _animateToIndex(i) => _controller.animateTo(_height * i, duration: Duration(milliseconds: 1), curve: Curves.linear);

  void timenam() async{
    final dbhelper = Databasehelper.instance;

    final id1 = await dbhelper.queryspecific1(g);
    var id2 = id1.toString();
    id2 = id2.substring(6, 7);
    var id3 = int.parse(id2);
    dbhelper.updatetime(
        g,id3,hrr,_chosenValue13);

  }

  void _reset() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration.zero,
        pageBuilder: (_, __, ___) => Page3(),
      ),
    );
  }
  var colour;
  bool val = true;
  int count = 0;
  TextEditingController chec = TextEditingController();
  Widget _buildPlayerModelList(int k) {
    TextEditingController search;
    TextEditingController des;





    if (!no) {
      search = TextEditingController(text: gh[k].tit);
      des = TextEditingController(text: gh[k].des);
    } else {
      if (!user) {
        if (gh[k].bef == 'null') {

          _chosenValue13 = null;
        } else {
          print('ca');
          _chosenValue13 = gh[k].bef;
        }
      }
    }
    var crea = gh[k].num;
    return Card(
      child: ExpansionTile(

        onExpansionChanged: (value) {
          if (value) {
            if (no) {
              setState(() {
                val = true;
                no = false;
                print('update cancelled');
              //  show();


              });

            }
            // print(count);
            count++;
          } else {
            count--;
          }
        },
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
          AbsorbPointer(
            absorbing: val,
            child: Row(
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
                      value: _chosenValue14,
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
                        'None',
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
                          _chosenValue14 = value;
                          focusNode1.unfocus();
                          updater();
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          AbsorbPointer(
            absorbing: val,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: TextField(
                    focusNode: focusNode1,
                    onChanged: (changing) {
                      tit = changing;
                      istyping=true;
                      updater();
                    },
                    //  onChanged: alram(),
                    controller: search,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        // enabled: edi,
                        hintText: 'Title',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: TextField(
                    onChanged: (chan) {
                      desc = chan;
                      updater();
                      istyping=true;
                    },
                    controller: des,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        //  enabled: edi,
                        hintText: 'Description',
                        hintStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap:(){
                          var months=date.toString();
                          var yea=months.substring(0,4);
                          var yead=months.substring(5,7);
                          var yead1=months.substring(8,10);

                          var durationn = DateTime.parse("$yea-$yead-$yead1").difference(DateTime.now());

                          if(durationn.inDays>=0){

                            if(timeman){
                             disable=true;

updater();

                            }else {
                              setState(() {

                                timeman = true;
                                coloor=0xFF000000;

                              });


                            }
                          }else{
                         print(durationn.inSeconds);
                            Fluttertoast.showToast(

                              msg: "Date is Passed",
                              backgroundColor:Color(0xFFFD5656),
                              fontSize: 18,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                            );
                          }






                },
                        child: Icon(
                          timeman ? FontAwesomeIcons.bell : FontAwesomeIcons.bellSlash,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      AbsorbPointer(
                        absorbing: timeman ? false:true,
                        child: Align(
                          // alignment: Alignment.centerLeft,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              focusColor: Colors.white,
                              value: hrr,
                              icon: Visibility(
                                  visible: false,
                                  child: Icon(Icons.arrow_downward)),
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
                                    style: TextStyle(
                                        color: Color(coloor), fontSize: 19),
                                  ),
                                );
                              }).toList(),
                              hint: Text(
                                "Hr",
                                style: TextStyle(
                                  color: Color(coloor),
                                  fontSize: 20,
                                ),
                              ),
                              onChanged: (String value) {
                                setState(() {
                                  hrr = value;
                                  suspi = false;
                                  updater();

                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      Text(' : '),
                      AbsorbPointer(
                        absorbing: timeman ? false:true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: minn,
                            icon: Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
                            //elevation: 5,
                            style: TextStyle(color: Colors.white),
                            // iconEnabledColor: Color(col),
                            items:
                                min.map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        fontSize: 19, color:Color(coloor))),
                              );
                            }).toList(),
                            hint: Text(
                              "Min",
                              style: TextStyle(
                                color: Color(coloor),
                                fontSize: 20,
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                minn = value;
                                updater();


                              });
                            },
                          ),
                        ),
                      ),
                      AbsorbPointer(
                        absorbing: timeman ? false:true,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: perr,
                            icon: Visibility(
                                visible: false,
                                child: Icon(Icons.arrow_downward)),
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
                                  style: TextStyle(
                                      fontSize: 19, color: Color(coloor)),
                                ),
                              );
                            }).toList(),
                            hint: Text(
                              "Prd",
                              style: TextStyle(
                                fontSize: 20,
                                color: Color(coloor),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {

                                perr = value;
                                updater();
                              });
                            },
                          ),
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

                            child: AbsorbPointer(
                              absorbing: timeman ? false:true,
                              child: DropdownButton<String>(
                                focusColor: Colors.white,
                                isExpanded: true,
                                value: _chosenValue13,
                                icon: Visibility(
                                    visible: false,
                                    child: Icon(Icons.arrow_downward)),
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
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 19),
                                    ),
                                  );
                                }).toList(),
                                hint: Text(
                                  "Notify Before",
                                  style: TextStyle(
                                    color: Color(coloor),
                                    fontSize: 20,
                                  ),
                                ),
                                onChanged: (String value) {
                                  setState(() {
                                    _chosenValue13 = value;
                                    var df=_chosenValue13.substring(0,2);
                                    print(df);
                                    user = true;
                                  });
                                },
                              ),
                            ),

                      ),


                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    g = gh[k].num;
                    ext(g);
                    if (count < 2) {
                      setState(() {
                        up = 'Auto Updating...';
                        val = false;
                        no = true;
                        FocusScope.of(context).requestFocus();
                        focusNode1.requestFocus();
                        wid = 140.0;


                        //  print(g);

                      });

                      // print('Alarm Fired at ${DateTime.now()}');

                    } else {
                      Fluttertoast.showToast(
                        msg: "Open any one record to update",
                        backgroundColor:Color(0xFFFD5656),
                        fontSize: 18,
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                      );

                    }
                  },
                  child: AnimatedContainer(
                      child: Center(
                        // opacity: opacity,

                        child: Text(up,
                            style:
                                TextStyle(color: Colors.white, fontSize: 17)),
                      ),
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
                GestureDetector(
                  onTap: () {
                    print(search.text);
                    print(chec.text);
                  },
                  child: AnimatedContainer(
                      child: Center(
                          child: Text('Delete',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17))),
                      duration: Duration(milliseconds: 300),
                      width: 70,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFFD5656),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
