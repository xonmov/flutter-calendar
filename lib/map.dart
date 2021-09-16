class Data {
  String tit;
  String des;
  String catg;
  String am;
  String time;
  String dat;
  String bef;
  String num;
  String descda;

  mapp() {
    var mappi = Map<String, dynamic>();
    mappi['title'] = this.tit;
    mappi['descr'] = this.des;
    mappi['catge'] = this.catg;
    mappi['ampm'] = this.am;
    mappi['timee'] = this.time;
    mappi['datt'] = this.dat;
  }
}
