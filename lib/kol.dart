import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'map.dart';

// the database helper class
class Databasehelper {
  // database name
  static final _databasename = "persons.db5";
  static final _databaseversion = 1;

  // the table name
  static final table = "my_table";

  // column names
  static final columntitle = "title";
  static final columndesc = "desc";
  static final columcat = "catg";
  static final columtime = "tim";
  static final columdate = "Date";
  static final columam = "ampm";
  static final columbef = "bef";
  static final columnow = "now";

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
        $columntitle TEXT NOT NULL,
        $columndesc TEXT NOT NULL,
        $columcat TEXT NOT NULL,
        $columtime TEXT NOT NULL,
        $columdate VARCHAR NOT NULL,
        $columam TEXT NOT NULL,
        $columbef VARCHAR NOT NULL,
         $columnow VARCHAR NOT NULL
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

  Future<List<Map<String, dynamic>>> queryallu() async {
    Database db = await instance.databse;
    // var res = await db.query(table, where: "age < ?", whereArgs: [age]);
    var res = await db.rawQuery('SELECT * from my_table');

    // print(cate.tit);
    return res;

    //  print(employees);
  }

  // function to delete some data
  Future<int> deletedata() async {
    Database db = await instance.databse;
    var res = await db.execute("DROP TABLE IF EXISTS my_table");
  }

  // function to update some data
  Future<int> update(tit, desc, _chosenValue13, _chosenValue14, hrr, minn, perr,
      g, suspi) async {
    Database db = await instance.databse;
    var colla;
    if (!suspi) {
      colla = '$hrr$minn';
    } else {
      colla = 'null';
    }

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
    print(res);
  }
}
