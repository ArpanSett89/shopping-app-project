import 'package:flutter/material.dart';

import 'Buttons.dart';

class WithMailId extends StatefulWidget {
  const WithMailId({Key? key}) : super(key: key);

  @override
  State<WithMailId> createState() => _WithMailIdState();
}

final TextEditingController v1 = TextEditingController();
final TextEditingController v2 = TextEditingController();
final formKey = GlobalKey<FormState>();
bool isHiddenPassword = true;

class _WithMailIdState extends State<WithMailId> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.fromLTRB(80, 0, 80, 0),
                child: Image.asset('images/pic11.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 80),
                child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.alternate_email_rounded,
                          color: Colors.red.shade300,
                        ),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      showCursor: true,
                      textInputAction: TextInputAction.next,
                      controller: v1,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 90, 50, 0),
                child: Container(
                    alignment: Alignment.center,
                    child: TextField(
                      obscureText: isHiddenPassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.red.shade300,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isHiddenPassword = !isHiddenPassword;
                              });
                            },
                            icon: Icon(
                                isHiddenPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.red.shade300)),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                      ),
                      showCursor: true,
                      controller: v2,
                      textInputAction: TextInputAction.next,
                    )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(25, 0, 25, 250),
                alignment: Alignment.bottomCenter,
                child: CustomButton1(
                  w1: MediaQuery.of(context).size.width,
                  h1: 50,
                  r: 15,
                  title: 'Log in ',
                  color: Colors.red.shade300,
                  onPressed: () {
                    /*Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WithPhone()),
                    );*/
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 40, 200),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Don't have any Account?",
                    style: TextStyle(fontSize: 12, color: Colors.red.shade300),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(130, 0, 0, 183),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Colors.red.shade300,
                    ),
                    onPressed: () {
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );*/
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red.shade300,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
