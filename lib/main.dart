import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shoppingapp/home.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<StatefulWidget> {
  @override
  void initState() {
    super.initState();
    getValidationData();
  }
  var finalPhNo;
  final Future<SharedPreferences> sharedPreferences =  SharedPreferences.getInstance();
  Future getValidationData() async{
    final SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();
    final obtainPhNo = await sharedPreferences.getString('phoneNo');
   setState(() {
     finalPhNo = obtainPhNo;
   });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: (finalPhNo != null)?  Home():MyHomePage(),
    );
  }
}