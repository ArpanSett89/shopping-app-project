import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icons;
  final title;
  final Color color;
  final Color icon_color;
  final Color title_color;
  final VoidCallback onPressed;
  final double r;
  final double w1;
  final double h1;

  const CustomButton(
      {Key? key,
      required this.icons,
      required this.title,
      required this.color,
      required this.onPressed,
      required this.r,
      required this.w1,
      required this.h1,
      required this.icon_color,
      required this.title_color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(r),
            )),
            minimumSize: MaterialStateProperty.all(Size(w1, h1)),
            backgroundColor: MaterialStateProperty.all(color)),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icons,
              color: icon_color,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title.toString(),
              style: TextStyle(fontSize: 15, color: title_color),
            ),
          ],
        ));
  }
}

class CustomButton1 extends StatelessWidget {
  final title;
  final Color color;
  final VoidCallback onPressed;
  final double r;
  final double w1;
  final double h1;

  const CustomButton1({
    Key? key,
    this.title,
    required this.color,
    required this.onPressed,
    required this.r,
    required this.w1,
    required this.h1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(r),
          )),
          minimumSize: MaterialStateProperty.all(Size(w1, h1)),
          backgroundColor: MaterialStateProperty.all(color)),
      onPressed: onPressed,
      child: Text(
        title.toString(),
        style: TextStyle(fontSize: 15, color: Colors.white),
      ),
    );
  }
}

class Tiles extends StatelessWidget {
  final IconData icons;
  final title;
  final Color color;

  const Tiles({
    Key? key,
    required this.icons,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Icon(
          icons,
          color: color,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 15, color: Colors.black),
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {});
  }
}

class CustomFloatingButton extends StatelessWidget {
  final double h;
  final double w;
  final double r;
  const CustomFloatingButton({Key? key, required this.h, required this.w, required this.r}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
              smallSizeConstraints:
                  BoxConstraints.tightFor(width: w, height: h))),
      child: FloatingActionButton.small(
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(r)),
        backgroundColor: Colors.green,
        onPressed: () {},
        child: Icon(
          Icons.add,
          size: 15,
          color: Colors.white,
        ),
      ),
    );
  }
}
class AppBarButton extends StatelessWidget {
  const AppBarButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios,color: Colors.green,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

