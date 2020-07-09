import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'status/items.dart';
import 'status/units.dart';
import 'status/dictionary/unit_dictionary.dart';
import 'status/dictionary/item_dictionary.dart';
import 'status/dictionary/enemy_dictionary.dart';


class Status extends StatelessWidget {
	Status({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('勇者の家'),
				),
        body: StatusPage(),
		);
	}
}

class StatusPage extends StatefulWidget {
  StatusPage({Key key}) : super(key: key);

  StatusPageState createState() => new StatusPageState();
}

class StatusPageState extends State<StatusPage> {

  @override
  Widget build(BuildContext context) {

		return StreamBuilder(
			stream: user_database,
			builder: (context, snapshot) {
				if (snapshot.hasError)
					return new Text('Error: ${snapshot.error}');
				switch (snapshot.connectionState) {
					case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
					default:
						List<Widget> list_tiles = <Widget>[
							Container(
								child: ListTile(
									title: Text(
										"勇者",
										style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
									),
								),
							),
							Container(
								child: ListTile(
									title: Text('勇者名'),
									trailing: Text(snapshot.data['name']),
								)
							),
							Container(
								child: ListTile(
									title: Text(
										"経験",
										style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
									),
								),
							),
							Container(
								child: ListTile(
									title: Text('Lv'),
									trailing: Text('${snapshot.data['level'].toString()}'),
								)
							),
							Container(
								child: ListTile(
									title: Text('経験値'),
									trailing: Text('${snapshot.data['exp'].toString()}'),
								)
							),
							Container(
								child: ListTile(
									title: Text('合計距離'),
									trailing: Text('${snapshot.data['distance'].toString()}m'),
								)
							),
							Container(
								child: ListTile(
									title: Text(
										"財産",
										style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
									),
								),
							),
							Container(
								child: ListTile(
									title: Text('所持金'),
									trailing: Text('${snapshot.data['money'].toString()}G'),
								)
							),
							Container(
								child: ListTile(
									title: Text('装備'),
									trailing:
										Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Icon(Icons.info_outline, color: Colors.cyan,),
												Icon(Icons.arrow_forward_ios),
											]
										),
									onTap: () {
										Navigator.push(context, MaterialPageRoute<Null>(
											settings: const RouteSettings(name: "/units"),
											builder: (BuildContext context) => Units()
										));
									}
								)
							),
							Container(
								child: ListTile(
									title: Text('アイテム'),
									trailing:
										Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Icon(Icons.info_outline, color: Colors.cyan,),
												Icon(Icons.arrow_forward_ios),
											]
										),
									onTap: () {
										Navigator.push(context, MaterialPageRoute<Null>(
											settings: const RouteSettings(name: "/items"),
											builder: (BuildContext context) => Items()
										));
									}
								)
							),
							Container(
								child: ListTile(
									title: Text(
										"能力",
										style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
									),
								),
							),
							Container(
								child: ListTile(
									title: Text('職業'),
									trailing: Text(snapshot.data['category']),
								)
							),
							Container(
								child: ListTile(
									title: Text('攻撃力(STR)'),
									trailing: Text(snapshot.data['str'].toString()),
								)
							),
							Container(
								child: ListTile(
									title: Text('防御力(AC)'),
									trailing: Text(snapshot.data['ac'].toString()),
								)
							),
							Container(
								child: ListTile(
									title: Text('素早さ(DEX)'),
									trailing: Text(snapshot.data['dex'].toString()),
								)
							),
							Container(
								child: ListTile(
									title: Text('体力(HP)'),
									trailing: Text(snapshot.data['hp'].toString()),
								)
							),
							/*Container(
								child: ListTile(
									title: Text(
										"辞典",
										style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
									),
								),
							),
							Container(
								child: ListTile(
									title: Text('敵'),
									trailing:
										Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Icon(Icons.info_outline, color: Colors.cyan,),
												Icon(Icons.arrow_forward_ios),
											]
										),
									onTap: () {
										Navigator.push(context, MaterialPageRoute<Null>(
											settings: const RouteSettings(name: "/enemy_dictionary"),
											builder: (BuildContext context) => EnemyDictionary()
										));
									}
								),
							),
							Container(
								child: ListTile(
									title: Text('武器'),
									trailing:
										Row(
											mainAxisSize: MainAxisSize.min,
											crossAxisAlignment: CrossAxisAlignment.start,
											children: <Widget>[
												Icon(Icons.info_outline, color: Colors.cyan,),
												Icon(Icons.arrow_forward_ios),
											]
										),
									onTap: () {
										Navigator.push(context, MaterialPageRoute<Null>(
											settings: const RouteSettings(name: "/unit_dictionary"),
											builder: (BuildContext context) => UnitDictionary()
										));
									}
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
												Icon(Icons.info_outline, color: Colors.cyan,),
												Icon(Icons.arrow_forward_ios),
											]
										),
									onTap: () {
										Navigator.push(context, MaterialPageRoute<Null>(
											settings: const RouteSettings(name: "/item_dictionary"),
											builder: (BuildContext context) => ItemDictionary()
										));
									}
								),
							),*/
						];
						return ListView.separated(
							itemCount: list_tiles.length,
							separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
							itemBuilder: (BuildContext context, int index) {
								return list_tiles[index];
							},
						);
				}
			},
		);
	}

}
