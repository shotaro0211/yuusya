import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'tactics/units_select.dart';
import 'tactics/items_select.dart';
import 'tactics/quests_select.dart';
import 'tactics/battle_plan.dart';
import 'home.dart';
import 'package:yuusya/components/location.dart';
import 'package:yuusya/components/user_info.dart';

int  quests_select = 0;
String quests_select_text = '';
int battle_plan = 0;
String battle_plan_text = '';
String units_name_text = '';
List<Map> units = [];
List<String> units_name = [];
String items_name_text = '';
List<Map> items = [];
List<String> items_id = [];
List<String> items_name = [];
int distance = 0;
int complete_count = 0;

class Tactics extends StatelessWidget {
  String title = '討伐作戦';
	Tactics({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		if (user_info.getBool('battled') == true) {
			title = '作戦中';
		}
		return new Scaffold(
				appBar: AppBar(
					title: Text(title),
				),
        body: TacticsPage(),
		);
	}
}

class TacticsPage extends StatefulWidget {
  TacticsPage({Key key}) : super(key: key);

  TacticsPageState createState() => new TacticsPageState();
}

class TacticsPageState extends State<TacticsPage> {

  @override
  Widget build(BuildContext context) {
		List<Widget> list_tiles = getContainer(context);
		return Column(
			children: <Widget>[
				Expanded(
					child: ListView.separated(
						itemCount: list_tiles.length,
						separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
						itemBuilder: (BuildContext context, int index) {
							return list_tiles[index];
						},
					),
				),
				SizedBox (
					width: MediaQuery.of(context).size.width,
					height: 50,
					child: RaisedButton(
						child: Text("討伐開始"),
						color: Colors.cyan,
						textColor: Colors.black,
						onPressed: () {
							if (quests_select != 0 && battle_plan != 0) {
								battled = true;
								Navigator.pushReplacement(context, MaterialPageRoute(
								  builder: (context) => Location()
								));
							} else {
								return showDialog<void>(
									context: context,
									barrierDismissible: false, // user must tap button!
									builder: (BuildContext context) {
										return AlertDialog(
											title: Text('討伐開始できません'),
											content: SingleChildScrollView(
												child: ListBody(
													children: <Widget>[
														Text('討伐クエストと戦術を選択してください'),
													],
												),
											),
											actions: <Widget>[
												FlatButton(
													child: Text('OK'),
													onPressed: () {
														Navigator.of(context).pop();
													},
												),
											],
										);
									}
								);
							}
						},
					),
				),
			],
		);
	}

  @override
  void initState() {
    super.initState();
		getCompleteCount();
    quests_select = 0;
    quests_select_text = '';
    battle_plan = 0;
    battle_plan_text = '';
    units_name_text = '';
    units = [];
    units_name = [];
    items_name_text = '';
    items = [];
    items_id = [];
	 	items_name = [];
		battled = false;
  }

	Future<int> getCompleteCount() async {
		DocumentSnapshot docSnapshot = await Firestore.instance.collection('users').document(user_info.getString('id')).get();
		Map record = docSnapshot.data;
		complete_count = record['complete_count'];
  }

	List<Widget> getContainer(BuildContext context) {

		List<Widget> list_tiles = <Widget>[
			Container(
				child: ListTile(
					title: Text(
						"討伐クエスト",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('討伐クエスト'),
					trailing: Row(
						mainAxisSize: MainAxisSize.min,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(quests_select_text),
							Icon(Icons.arrow_forward_ios),
						]
					),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/quests_select"),
							builder: (BuildContext context) => BattleField()
						)).then((value) {
							setState(() {
							});
            });
					}
				)
			),
			Container(
				child: ListTile(
					title: Text(
						"装備品",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('装備品'),
					trailing: Row(
						mainAxisSize: MainAxisSize.min,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
              Text(units_name_text),
							Icon(Icons.arrow_forward_ios),
						]
					),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/units_select"),
							builder: (BuildContext context) => UnitsSelect()
						)).then((value) {
							setState(() {
								units_name_text = units_name.join(',');
							});
            });
					}
				)
			),
			Container(
				child: ListTile(
					title: Text(
						"戦術",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('戦術'),
					trailing: Row(
						mainAxisSize: MainAxisSize.min,
						crossAxisAlignment: CrossAxisAlignment.start,
						children: <Widget>[
							Text(battle_plan_text),
							Icon(Icons.arrow_forward_ios),
						]
					),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/battle_plan"),
							builder: (BuildContext context) => BattlePlan()
						)).then((value) {
							setState(() {
							});
            });
					}
				),
			),
			Container(
				child: ListTile(
					title: Text(
						"アイテム",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('アイテム'),
					trailing:
						Row(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
					      Text(items_name_text),
								Icon(Icons.arrow_forward_ios),
							]
						),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/items_select"),
							builder: (BuildContext context) => ItemsSelect()
						)).then((value) {
							setState(() {
								items_name_text = items_name.join(',');
							});
						});
					}
				),
			),
			Container(
				child: ListTile(
					title: Text(
						"",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
		];
		return list_tiles;
	}

}
