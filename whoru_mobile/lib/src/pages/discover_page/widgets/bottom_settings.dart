import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomSettings extends StatefulWidget {
  final String hashtag;
  final index;

  BottomSettings({this.hashtag, this.index});

  @override
  State<StatefulWidget> createState() => _BottomSettingsState();
}

class _BottomSettingsState extends State<BottomSettings> {
  String hashtag = '#Talk';

  List<String> hashtags = [
    '#Talk',
    '#Love',
    '#18+',
    '#LGBT',
  ];

  @override
  void initState() {
    super.initState();
    hashtag = widget.hashtag;
  }

  Future<void> _updateStateRoom(hashtag) async {
    Firestore.instance.runTransaction((Transaction transaction) async {
      await transaction.update(widget.index, {
        'hashtag': hashtag,
      });
    });
    Navigator.of(context).pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final double sizeWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Text(
                "Choose strangers to",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: sizeWidth / 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Divider(
              color: Colors.grey.shade400,
              thickness: .4,
              height: .4,
              indent: 16.0,
              endIndent: 16.0,
            ),
            SizedBox(
              height: 12.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 12.0),
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                color: Colors.grey.shade50,
                boxShadow: [
                  BoxShadow(
                    color:
                        ThemeProvider.of(context).brightness == Brightness.dark
                            ? Colors.white.withOpacity(.04)
                            : Color(0xFFABBAD5),
                    spreadRadius: .8,
                    blurRadius: 2.0,
                    offset: Offset(0, 2.0), // changes position of shadow
                  ),
                ],
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  icon: Icon(
                    FontAwesomeIcons.hashtag,
                    size: sizeWidth / 20,
                    color: Colors.grey.shade700,
                  ),
                  iconEnabledColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  value: hashtag,
                  items: hashtags.map((size) {
                    return DropdownMenuItem(
                        value: size,
                        child: Text(
                          size.substring(1),
                          style: TextStyle(
                            fontSize: sizeWidth / 24,
                            color: Colors.grey.shade800,
                          ),
                        ));
                  }).toList(),
                  onChanged: (val) {
                    setState(() {
                      hashtag = val;
                    });
                  },
                ),
              ),
            ),
            SizedBox(
              height: 14.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: 16.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade700,
                        width: 1.2,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey.shade800,
                      size: sizeWidth / 23.5,
                    ),
                  ),
                ),
                SizedBox(
                  width: 18.0,
                ),
                GestureDetector(
                  onTap: () async {
                    await _updateStateRoom(hashtag);
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 48.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueAccent,
                        width: 1.2,
                      ),
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    ),
                    child: Text(
                      'Done',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: sizeWidth / 26.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
