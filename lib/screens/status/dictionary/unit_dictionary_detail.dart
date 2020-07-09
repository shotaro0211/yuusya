import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class UnitDictionaryDetail extends StatelessWidget {
  final Map document;
	UnitDictionaryDetail({Key key, this.document}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('ユニット詳細'),
				),
        body: UnitDictionaryDetailPage(document: document),
		);
	}
}

class UnitDictionaryDetailPage extends StatefulWidget {
  final Map document;
  UnitDictionaryDetailPage({Key key, this.document}) : super(key: key);

  UnitDictionaryDetailPageState createState() => new UnitDictionaryDetailPageState(document: document);
}

class UnitDictionaryDetailPageState extends State<UnitDictionaryDetailPage> {
  final Map document;
	UnitDictionaryDetailPageState({this.document});

  @override
  Widget build(BuildContext context) {
		String tribe_name = document['tribe_name'];
		int level = document['level'];
		String category = document['category'];
		String type = document['type'];
		String describe = document['describe'];
		int str = document['str'];
		int ac = document['ac'];
		int dex = document['dex'];
		int hp = document['hp'];
		String rank = document['rank'];
		List<Widget> list_tiles = getContainer(context, tribe_name, level, category, type, describe, str, ac, dex, hp, rank);
		return ListView.separated(
			itemCount: list_tiles.length,
			separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
			itemBuilder: (BuildContext context, int index) {
				return list_tiles[index];
			},
		);
	}

	List<Widget> getContainer(BuildContext context, String tribe_name, int level, String category, String type, String describe, int str, int ac, int dex, int hp, String rank) {

		List<Widget> list_tiles = <Widget>[
			Container(
				child: ListTile(
					title: Text(
						"ユニット",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('種別'),
					trailing: Text(tribe_name),
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
					trailing: Text(level.toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text(
						"技量",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('ランク'),
					trailing: Text(rank),
				)
			),
			Container(
				child: ListTile(
					title: Text('攻撃力(STR)'),
					trailing: Text(str.toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('防御力(AC)'),
					trailing: Text(ac.toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('素早さ(DEX)'),
					trailing: Text(dex.toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('体力(HP)'),
					trailing: Text(hp.toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text(
						"詳細",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('職業'),
					trailing: Text(category),
				)
			),
			Container(
				child: ListTile(
					title: Text('属性'),
					trailing: Text(type),
				)
			),
			Container(
				child: ListTile(
					title: Text(
						"説明",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text(describe),
				)
			),
		];
		return list_tiles;
	}

}
