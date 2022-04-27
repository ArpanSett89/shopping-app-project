import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Buttons.dart';
import '../loginpage.dart';
import '../product details/product list.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.black.withOpacity(0.2),
                        child: Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.green,
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Account Holder',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.edit_sharp))
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: title.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Tiles(
                      icons: icondata[index],
                      title: title[index],
                      color: Colors.black,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
              child: CustomButton(
                title_color: Colors.green,
                icon_color: Colors.green,
                icons: Icons.arrow_back,
                r: 15,
                w1: MediaQuery.of(context).size.width,
                h1: 50,
                title: 'Log Out ',
                color: Colors.grey.shade300,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  final SharedPreferences sharedPreferances =
                      await SharedPreferences.getInstance();
                  sharedPreferances.remove('phoneNo');
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => LogInPage(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
