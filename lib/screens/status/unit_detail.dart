import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class UnitDetail extends StatelessWidget {
  final DocumentSnapshot document;
	UnitDetail({Key key, this.document}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('装備品詳細'),
				),
        body: UnitDetailPage(document: document),
		);
	}
}

class UnitDetailPage extends StatefulWidget {
  final DocumentSnapshot document;
  UnitDetailPage({Key key, this.document}) : super(key: key);

  UnitDetailPageState createState() => new UnitDetailPageState(document: document);
}

class UnitDetailPageState extends State<UnitDetailPage> {
  final DocumentSnapshot document;
	UnitDetailPageState({this.document});

  @override
  Widget build(BuildContext context) {
		List<Widget> list_tiles = <Widget>[
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
					title: Text('名称'),
					trailing: Text(document['name']),
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
					title: Text('ランク'),
					trailing: Text(document['rank']),
				)
			),
			Container(
				child: ListTile(
					title: Text('攻撃力(STR)'),
					trailing: Text(document['str'].toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('防御力(AC)'),
					trailing: Text(document['ac'].toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('素早さ(DEX)'),
					trailing: Text(document['dex'].toString()),
				)
			),
			Container(
				child: ListTile(
					title: Text('体力(HP)'),
					trailing: Text(document['hp'].toString()),
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
					title: Text('種類'),
					trailing: Text(document['type']),
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
					title: Text(document['describe']),
				)
			),
		];
		return ListView.separated(
			itemCount: list_tiles.length,
			separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
			itemBuilder: (BuildContext context, int index) {
				return list_tiles[index];
			},
		);
	}

}
