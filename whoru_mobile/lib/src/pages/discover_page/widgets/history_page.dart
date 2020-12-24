import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:whoru/src/models/user.dart';
import 'package:whoru/src/widgets/loading.dart';

class HistoryPage extends StatefulWidget {
  final index;
  final DocumentSnapshot info;
  HistoryPage({
    this.index,
    this.info,
  });
  @override
  State<StatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<String> _hashtags = ['#Talk', '#Love', '#LGBT', '#18+'];

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(context),
          icon: Icon(
            Feather.arrow_left,
            size: _size.width / 15.0,
          ),
        ),
        title: Text(
          'History',
          style: TextStyle(
              fontSize: _size.width / 16.5,
              fontWeight: FontWeight.w400,
              fontFamily: 'Lobster'),
        ),
        actions: [
          IconButton(
            onPressed: () => null,
            icon: Icon(
              Feather.sliders,
              size: _size.width / 16.0,
            ),
          ),
          IconButton(
            onPressed: () => Get.snackbar(
              '',
              '',
              colorText: Colors.white,
              backgroundColor: Colors.black54,
              dismissDirection: SnackDismissDirection.HORIZONTAL,
              duration: Duration(
                milliseconds: 2000,
              ),
              titleText: Text(
                'Completed',
                style: TextStyle(
                  fontSize: _size.width / 24.5,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              messageText: Text(
                'Deleted all messages with strangers!',
                style: TextStyle(
                  fontSize: _size.width / 26.0,
                  color: Colors.white.withOpacity(.85),
                  fontWeight: FontWeight.w400,
                ),
              ),
              padding: EdgeInsets.fromLTRB(
                20.0,
                20.0,
                8.0,
                18.0,
              ),
            ),
            icon: Icon(
              Feather.trash,
              size: _size.width / 16.0,
            ),
          ),
        ],
      ),
      body: Container(
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('chatrooms')
              .where('id1', isEqualTo: user.uid)
              .where('hashtag', whereIn: _hashtags)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snap1) {
            if (!snap1.hasData) {
              return Loading();
            }

            return StreamBuilder(
              stream: Firestore.instance
                  .collection('chatrooms')
                  .where('id2', isEqualTo: user.uid)
                  .where('hashtag', whereIn: _hashtags)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snap2) {
                if (!snap2.hasData) {
                  return Loading();
                }

                List<DocumentSnapshot> docs = snap1.data.documents;
                docs.addAll(snap2.data.documents);

                docs
                    .where((doc) {
                      return doc['id1'] == doc['id2'];
                    }) // filter keys
                    .toList() // create a copy to avoid concurrent modifications
                    .forEach(docs.remove);

                print(docs.length);

                return ListView.builder(
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    return Container();
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
