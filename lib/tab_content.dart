import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class TabContent extends StatefulWidget {
  const TabContent({Key? key, required this.content}) : super(key: key);

  final Widget content;

  @override
  _TabContentState createState() => _TabContentState();
}

class _TabContentState extends State<TabContent> {
  StreamSubscription? _streamSubs;
  dynamic data;

  @override
  void initState() {
    super.initState();
    _streamSubs = FirebaseDatabase.instance
        .ref('/users/cpxudCm68oPKiQupd4hQ4mVgkhz1')
        .onValue
        .map((event) {
      return event.snapshot.value;
    }).listen((data) {
      setState(() {
        this.data = data;
      });
    });
  }

  @override
  void dispose() {
    _streamSubs?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("${data ?? ''}"),
            const SizedBox(height: 10),
            widget.content,
          ],
        ),
      ),
    );
  }
}
