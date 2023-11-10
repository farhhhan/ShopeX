import 'package:shopex/widgets/custometext.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class customeappbar extends StatelessWidget implements PreferredSizeWidget {
  customeappbar(this.iconss, {required this.title});
  String title;
  IconData? iconss;
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  icon: Icon(iconss),
                  iconSize: 35,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              SizedBox(
                width: 50,
              ),
              customeText(
                texts: title,
                textsize: 28,
                textspace: 1.6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
