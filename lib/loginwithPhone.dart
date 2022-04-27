import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'home.dart';
import 'otp screen.dart';

class WithPhone extends StatefulWidget {
  const WithPhone({Key? key}) : super(key: key);

  @override
  State<WithPhone> createState() => _WithPhoneState();
}
TextEditingController v1 =TextEditingController();
class _WithPhoneState extends State<WithPhone> {
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Text(
              'Please Enter Your Number',
              style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
            ),
          ),
          Container(
              margin: EdgeInsets.fromLTRB(16, 50, 16, 0),
              alignment: Alignment.topCenter,
              child: TextField(
                controller: v1,
                keyboardType: TextInputType.number,
                showCursor: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: CountryCodePicker(
                    initialSelection: 'IN',
                    showDropDownButton: true,
                  ),
                ),
              )),
        ],
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
      print('+91${v1.text}');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPScreen(phoneNo: v1.text,)

      ),
    );
    // Add your onPressed code here!
    },
    backgroundColor: Colors.green,
    child: const Icon(Icons.arrow_forward_ios),
    ),
    );
  }
}
