import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/flutter_auth_ui.dart';
import 'package:issue_rtdb_7556/tab_content.dart';

class HomeTabs extends StatefulWidget {
  const HomeTabs({Key? key}) : super(key: key);

  @override
  _HomeTabsState createState() => _HomeTabsState();
}

class _HomeTabsState extends State<HomeTabs> {
  final tabs = const [
    Tab(icon: Icon(Icons.directions_car)),
    Tab(icon: Icon(Icons.directions_transit)),
    Tab(icon: Icon(Icons.directions_bike)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () async {
                  await FlutterAuthUi.signOut();
                },
                icon: const Icon(Icons.logout),
              ),
            ],
            bottom: TabBar(
              tabs: tabs,
            ),
            title: const Text('Home'),
          ),
          body: const TabBarView(
            children: [
              TabContent(
                content: Icon(Icons.directions_car),
              ),
              TabContent(
                content: Icon(Icons.directions_transit),
              ),
              TabContent(
                content: Icon(Icons.directions_bike),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
