import 'package:flutter/material.dart';
import 'Buttons.dart';
import 'loginwithPhone.dart';
import 'loginwithfbid.dart';
import 'loginwithmailid.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

bool isHiddenPassword = true;

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
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'With Nectar',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                child: CustomButton(
                  title_color: Colors.white,
                  icon_color: Colors.white,
                  r: 15,
                  w1: MediaQuery.of(context).size.width,
                  h1: 50,
                  icons: Icons.phone,
                  title: 'Log in With Phone No.',
                  color: Colors.lightBlue.withOpacity(0.8),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WithPhone()),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 110),
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  title_color: Colors.white,
                  icon_color: Colors.white,
                  r: 15,
                  w1: MediaQuery.of(context).size.width,
                  h1: 50,
                  icons: Icons.mail,
                  title: 'Log in With Google',
                  color: Colors.blueGrey.shade800,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WithMailId()),
                    );
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  r: 15,
                    title_color: Colors.white,
                    icon_color: Colors.white,
                  w1: MediaQuery.of(context).size.width,
                  h1: 50,
                  icons: Icons.facebook_rounded,
                  title: 'Log in With Facebook',
                  color: Colors.blue.withOpacity(0.9635),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WithFbId()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
