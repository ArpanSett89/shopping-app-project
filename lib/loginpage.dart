import 'package:flutter/material.dart';

import 'loginwithPhone.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}
bool isHiddenPassword=true;
class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(70, 200, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Get your Groceries',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
                    ),
                    Text(
                      'With Nectar',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.fromLTRB(10, 90, 0, 0),
                child: Image.asset('images/pic5.png'),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 170),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        minimumSize:
                        MaterialStateProperty.all(const Size(250, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.lightBlue.withOpacity(0.8))
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WithPhone()),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.phone,color: Colors.white,),
                        SizedBox(width: 20,),
                        Text(
                          'Log in With Phone No.',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 110),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                            //side: BorderSide(color: Colors.red)
                          )),
                      minimumSize:
                      MaterialStateProperty.all(const Size(250, 50)),
                      backgroundColor: MaterialStateProperty.all(Colors.blueGrey[800])
                    ),
                    onPressed: null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.mail,color: Colors.white,),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Text(
                            'Log in With Google',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            )),
                        minimumSize:
                        MaterialStateProperty.all(const Size(250, 50)),
                        backgroundColor: MaterialStateProperty.all(Colors.blue.withOpacity(0.9635))
                    ),
                    onPressed: null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.facebook_rounded,color: Colors.white,),
                        SizedBox(width: 20,),
                        Expanded(
                          child: Text(
                            'Log in With Facebook',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
