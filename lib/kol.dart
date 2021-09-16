import 'dart:io';
import 'noti.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'map.dart';


// the database helper class
class Databasehelper {
  // database name
  static final _databasename = "persons.db18";
  static final _databaseversion = 1;

  // the table name
  static final table = "my_table";

  // column names
  static final columntitle = "title";
  static final columndesc = "desc";
  static final columndescdat = "descdat";
  static final columcat = "catg";
  static final columtime = "tim";
  static final columdate = "Date";
  static final columam = "ampm";
  static final columbef = "bef";
  static final columnow = "now";
  static final columid = "id";


  var des;
  var tit;
  var catg;
  var bef;
  var timr;
  var amp;
  var date;
  var now;

  List<Data> gh = List<Data>();

  // a database
  static Database _database;

  // privateconstructor
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  // asking for a database
  Future<Database> get databse async {
    if (_database != null) return _database;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database;
  }

  // function to return a database
  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  // create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // sql code
    await db.execute('''  
      CREATE TABLE $table (
      $columid INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        $columntitle TEXT NOT NULL,
        $columndesc TEXT NOT NULL,
        $columcat TEXT NOT NULL,
        $columtime TEXT NOT NULL,
        $columdate VARCHAR NOT NULL,
        $columam TEXT NOT NULL,
        $columbef VARCHAR NOT NULL,
         $columnow VARCHAR NOT NULL,
         $columndescdat VARCHAR NOT NULL
      )
      ''');
  }

  // functions to insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.databse;
    return await db.insert(table, row);
  }

  void updte() {
    gh = List<Data>();
    var cate = Data();

    tit = cate.tit;
    des = cate.des;
    catg = cate.catg;
    timr = cate.time;
    //print(cate.time);
    date = cate.dat;
    amp = cate.am;
    bef = cate.bef;
    now = cate.num;
    print('$tit this');
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.databse;
    return await db.query(table);
  }

  // function to queryspecific
  Future<List<Map<String, dynamic>>> queryspecific(id) async {
    Database db = await instance.databse;
    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
    var res = await db.rawQuery('SELECT * from my_table WHERE now = "$id"');

    // print(cate.tit);
    return res;

    //  print(employees);
  }

  Future<List<Map<String, dynamic>>> queryspecificnoti() async {
    Database db = await instance.databse;
    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
    var res = await db.rawQuery('SELECT * from my_table');

    print(res);
   return res;

    //  print(employees);
  }


  Future<List<Map<String, dynamic>>> queryspecific1(id) async {
    Database db = await instance.databse;
    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
    var res = await db.rawQuery('SELECT id from my_table WHERE now = "$id"');

    // print(cate.tit);
    return res;

    //  print(employees);
  }



  Future<List<Map<String, dynamic>>> queryallu() async {
    Database db = await instance.databse;
    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
    var res = await db.rawQuery('SELECT * from my_table');

    // print(cate.tit);
    return res;

    //  print(employees);
  }
  List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
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

  // function to delete some data
  Future<int> deletedata() async {
    Database db = await instance.databse;
    var res = await db.execute("DROP TABLE IF EXISTS my_table");
  }









  // function to update some data
  Future<int> update(tit, desc, _chosenValue13, _chosenValue14, hrr, minn, perr,
      g, suspi,id3,dat,disable) async {
    Database db = await instance.databse;
    var colla;
    var noti=Notida();
    if (!suspi) {
      colla = '$hrr$minn';
    } else {
      colla = 'null';
    }

    if(!disable) {
      if (!suspi || hrr != null) {
        var months = dat.toString();
        var yea = months.substring(0, 4);
        print(yea);

        var yead = months.substring(5, 7);
        var yead1 = months.substring(8, 10);
        print(yead);
        print(yead1);

        if (perr == "PM") {
          int con = int.parse(hrr);
          hrr = conver24[con];
        }
        var durationn = DateTime.parse("$yea-$yead-$yead1 $hrr:$minn:00")
            .difference(DateTime.now());

        var alrm = durationn.inSeconds;
        if (alrm < 0) {
          print('time is passed');
        } else {
          var res = await db.update(
              table,
              {
                "title": "$tit",
                "desc": "$desc",
                "catg": "$_chosenValue14",
                "tim": "$colla",
                "ampm": "$perr",
                "bef": "$_chosenValue13"
              },
              where: "now = ?",
              whereArgs: [g]);

          noti.initState();
          noti.dlt(id3);
          noti.notificatio(id3, tit, _chosenValue14, alrm);


          if (_chosenValue13 != null) {
            var aStr = _chosenValue13.replaceAll(new RegExp(r'[^0-9]'), '');
            var fd = int.parse(aStr);
            if (fd == 1 || fd == 2) {
              var bef = 60 * 60 * fd;
              alrm = alrm.abs();

              if (alrm > bef) {
                bef = alrm - bef;
                noti.dlt(id3 + 1);
                noti.initState();
                noti.notificatio(id3 + 1, tit, _chosenValue14, bef);
              } else {
                var res = await db.update(
                    table,
                    {
                      "title": "$tit",
                      "desc": "$desc",
                      "catg": "$_chosenValue14",
                      "tim": "$colla",
                      "ampm": "$perr",
                      "bef": "null"
                    },
                    where: "now = ?",
                    whereArgs: [g]);
                print('Cant notify');
              }
            } else {
              var bef = fd * 60;
              alrm = alrm.abs();
              if (alrm > bef) {
                bef = alrm - bef;
                noti.dlt(id3 + 1);
                noti.initState();
                noti.notificatio(id3 + 1, tit, _chosenValue14, bef);
              } else {
                var res = await db.update(
                    table,
                    {
                      "title": "$tit",
                      "desc": "$desc",
                      "catg": "$_chosenValue14",
                      "tim": "$colla",
                      "ampm": "$perr",
                      "bef": "null"
                    },
                    where: "now = ?",
                    whereArgs: [g]);
                print('Cant notify');
              }
            }
          }
        }
      } else {
        var res = await db.update(
            table,
            {
              "title": "$tit",
              "desc": "$desc",
              "catg": "$_chosenValue14",
              "tim": "null",
              "ampm": "null",
              "bef": "null"
            },
            where: "now = ?",
            whereArgs: [g]);
      }
    }else{
      if(hrr!=null||hrr!='null') {
        print('$g,$id3,$hrr,$_chosenValue13');

        Database db = await instance.databse;
        var res = await db.update(
            table,
            {
              "tim": "null",
              "ampm": "null",
              "bef": "null"
            },
            where: "now = ?",
            whereArgs: [g]);
        print(res);
        noti.initState();
        noti.dlt(id3);
        if(bef!=null){
          noti.dlt(id3 + 1);
        }

      }
    }


  }



  Future<int> updatenoti(getti) async {
    Database db = await instance.databse;
    var res = await db.update(
        table,
        {

          "tim": "null",
          "ampm": "null",
          "bef": "null"
        },
        where: "now = ?",
        whereArgs: [getti]);
    print(res);

  }
  Future<int> updatetime(g,id3,hrr,_chosenValue13) async {

  }
  Future<int> updatenotionly(getti) async {
    Database db = await instance.databse;
    var res = await db.update(
        table,
        {
          "bef": "null"
        },
        where: "now = ?",
        whereArgs: [getti]);
    print(res);

  }
}
