import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:connectivity/connectivity.dart';
import 'dart:io';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Page4 extends StatefulWidget {
  @override
  NameOfYourWidgetState createState() => NameOfYourWidgetState();
}


class NameOfYourWidgetState extends State<Page4> {
var _labelText = 'Name';
var _labelText1 = 'Write your Feedback here......';
  var f=0;
   check() async {



  }
  TextEditingController emailController = new TextEditingController();
  TextEditingController longdes = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              Row(
                children:[
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {

                          Navigator.of(context, rootNavigator: true)
                              .pop();
                        });
                      },
                      child: Icon(
                        FontAwesomeIcons.chevronCircleLeft,
                        size: 28,
                        color: Color(0xFFFD5656),
                      ),
                    ),
                  ),
                  Text('Feedback',
                  style:TextStyle(
                    fontSize: 25,
                  )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  onChanged: (v){
                    setState(() {
                      if(v.isNotEmpty){
                        _labelText = 'Name';
                        _labelText1 = 'Write your Feedback here......';
                      }else{
                        _labelText = null;
                        _labelText1 = null;

                      }
                    });

                  },

                  controller: emailController,
              //    textInputAction: TextInputAction.done,
              //    textAlign: TextAlign.start,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    labelText: _labelText,


                    //  hintStyle: TextStyle(fontSize: 20.0, color: Color(_labelText1)),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  maxLines: null,
                  controller: longdes,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),

                      ),

                    labelText: _labelText1,
                     ),
                ),
              ),
              FlatButton(
                color: Color(0xFFFD5656),
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: ()async {
                  try {
                    final result = await InternetAddress.lookup('google.com');
                    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                      if(emailController.text!='' &&  longdes.text!=''  ){
                        setState(() {

                          Navigator.of(context, rootNavigator: true)
                              .pop();
                        });
                      }else{
                        Fluttertoast.showToast(
                          msg: "pls dont leave blank",
                          backgroundColor:Color(0xFFFD5656),
                          fontSize: 18,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                      }

                    }
                  } on SocketException catch (_) {
                    Fluttertoast.showToast(
                      msg: "Check net",
                      backgroundColor:Color(0xFFFD5656),
                      fontSize: 18,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                    );
                  }





                },
              ),
            ],
          )
      ),
    );

  }

}