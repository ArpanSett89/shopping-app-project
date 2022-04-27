import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Buttons.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';
enum Status { Waiting, Error }

class OTPScreen extends StatefulWidget {
  final phoneNo;

  const OTPScreen({Key? key, required this.phoneNo}) : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}
class _OTPScreenState extends State<OTPScreen> {
  var _Status = Status.Waiting;
  final TextEditingController v3 = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  var _verificationCode;
  Future _verifyPhoneNo() async {
    _auth.verifyPhoneNumber(
      phoneNumber: '+91${widget.phoneNo}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        _auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                    (route) => false);
          }
        });
      },
      verificationFailed: (FirebaseAuthException exception) async {
        print(exception.message);
        _Status=Status.Error;
      },
      codeSent: (verificationId, resendingToken) async {
        setState(() {
          _verificationCode = verificationId;
        });
      },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 100));
  }
  @override
  void initState() {
    super.initState();
    _verifyPhoneNo();
  }

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
        body: _Status == Status.Error
            ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'OTP Verification',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('The code is invalid',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.red,
                      fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: CustomButton1(
                      r: 14,
                      w1: 50,
                      h1: 50,
                      title: 'Resend OTP',
                      color: Colors.green.shade400,
                      onPressed: () {
                        _Status=Status.Waiting;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              OTPScreen(phoneNo: widget.phoneNo,)

                          ),
                        );
                      }
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: CustomButton1(
                      w1: 50,
                      h1: 50,
                      r: 14,
                      title: 'Edit Number',
                      color: Colors.green.shade400,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'OTP Verification For',
              style: TextStyle(fontSize: 30, color: Colors.green),
            ),
            Text(
              widget.phoneNo == null ? "" : widget.phoneNo,
              style: TextStyle(fontSize: 25, color: Colors.green),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Text('Enter The OTP Here',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black54,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 30,
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(15))),
                ),
                controller: v3,
                maxLength: 6,
                keyboardType: TextInputType.number,
    ),

              ),
            Container(
              alignment: Alignment.bottomCenter,
              child: CustomButton1(
                w1: 50,
                h1: 50,
                r: 14,
                title: 'varify',
                color: Colors.green.shade400,
                onPressed: ()  async {
                  print(v3.text);
                    try {
                      await _auth
                          .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode, smsCode: v3.text ))
                          .then((value) async {
                        if (value.user != null) {
                          final SharedPreferences sharedPreferances=await SharedPreferences.getInstance();
                          sharedPreferances.setString('phoneNo', widget.phoneNo);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Home()),
                                  (route) => false);
                        }
                      });
                    } catch (e) {
                      FocusScope.of(context).unfocus();
                      _Status=Status.Error;
                    }
                  }
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Didn't reicived OTP ?",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black54,
                        )),
                  ),
                  Container(
                    child: TextButton(
                      onPressed: ()async => _verifyPhoneNo(),
                      child: Text(
                        'Resend OTP',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
