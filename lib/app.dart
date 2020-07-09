import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'screens/home.dart';
import 'screens/status.dart';
import 'screens/tactics.dart';
import 'screens/history.dart';
import 'screens/headquarters.dart';
import 'screens/new_user.dart';
import 'components/user_info.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  List<Widget> _pages = [
		Home(),
    Status(),
    Tactics(),
    Headquarters(),
    History(),
  ];

  @override
  Widget build(BuildContext context) {
		if (user_info.getBool('user_has') ?? false) {
			return CupertinoTabScaffold(
				tabBar: _buildMy_appTabBar(),
				tabBuilder: (BuildContext context, int index) {
					return new CupertinoTabView(
						builder: (BuildContext context) {
							return CupertinoPageScaffold(
								child: _pages[index],
							);
						},
					);
				},
			);
		} else {
			return New_user();
		}
  }
}

CupertinoTabBar _buildMy_appTabBar() {
	return CupertinoTabBar(
		backgroundColor: Colors.black,
		activeColor: Colors.cyan,
		items: <BottomNavigationBarItem>[
			BottomNavigationBarItem(
				icon: Icon(FontAwesomeIcons.globeAsia, size:24.0),
				title: Text('', style: TextStyle(fontSize: 0.0)),
			),
			BottomNavigationBarItem(
				icon: Icon(Icons.home, size: 28.0),
				title: Text('', style: TextStyle(fontSize: 0.0)),
			),
			BottomNavigationBarItem(
				icon: Icon(FontAwesomeIcons.running, size:24.0),
				title: Text('', style: TextStyle(fontSize: 0.0)),
			),
			BottomNavigationBarItem(
				icon: Icon(FontAwesomeIcons.city, size:24.0),
				title: Text('', style: TextStyle(fontSize: 0.0)),
			),
			BottomNavigationBarItem(
				icon: Icon(Icons.filter_none, size:24.0),
				title: Text('', style: TextStyle(fontSize: 0.0)),
			),
			],
			);
}
