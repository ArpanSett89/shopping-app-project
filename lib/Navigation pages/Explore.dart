import 'package:flutter/material.dart';

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}
final List<String> images = <String>[
  'images/picforbanner.jpg',
  'images/picforbanner1.jpg',
  'images/picforbanner2.jpg',
];
class _ExploreState extends State<Explore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(fontSize: 20, color: Colors.green),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        primary: false,
        reverse: true,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: images.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                height: 185,
                width:200,
                child: ListTile(
                    title: AspectRatio(
                        aspectRatio: 7/6,
                        child: Image.asset(images[index])),
                ),
              ),
            );
          }),
    );
  }
}
