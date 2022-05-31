// ignore_for_file: must_be_immutable, deprecated_member_use, unnecessary_statements

import 'package:flutter/material.dart';
import 'package:menu_web_app/constants.dart';

class UpperNav extends StatelessWidget {
  var onDocClick;
  var onGetStartedClick;
  UpperNav({this.onDocClick, this.onGetStartedClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: kUpperNavbar,
        //borderRadius: BorderRadius.circular(46),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -2),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.16),
          ),
        ],
      ),
      child: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 955) {
          return DesktopNavbar(
              onDocClick: onDocClick, onGetStartedClick: onGetStartedClick);
        } else if (constraints.maxWidth > 300 && constraints.maxWidth < 955) {
          return DesktopNavbar(
              onDocClick: onDocClick, onGetStartedClick: onGetStartedClick);
        } else {
          return MobileNavbar();
        }
      }),
    );
  }
}

class DesktopNavbar extends StatelessWidget {
  var onDocClick;
  var onGetStartedClick;
  DesktopNavbar({this.onDocClick, this.onGetStartedClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: Container(
        constraints: BoxConstraints(maxWidth: 950),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: this.onDocClick,
              child: const Text(
                'Docs',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  fontFamily: 'Segoe Ui',
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            SizedBox(
              width: 50,
            ),
            OutlineButton(
                //color: Colors.pink,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: this.onGetStartedClick,
                child: Text(
                  "Geting Started",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontFamily: 'Segoe Ui',
                    decoration: TextDecoration.none,
                  ),
                ),
                borderSide: BorderSide(color: Colors.black))
          ],
        ),
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
