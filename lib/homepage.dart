import 'dart:ui';
import 'package:flutter/material.dart';
import 'loginpage.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(decoration: BoxDecoration(image: DecorationImage(
            image: AssetImage("images/pic1.jpeg"),
            fit: BoxFit.cover,opacity: 5.0) ),
    child:
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 200),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'to Our Store',
                          style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              )),
                          minimumSize:
                          MaterialStateProperty.all( Size(MediaQuery.of(context).size.width,50)),
                          backgroundColor: MaterialStateProperty.all(Colors.green.withOpacity(0.7)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogInPage()),
                          );
                        },
                        child: Text(
                          'Get Started',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
