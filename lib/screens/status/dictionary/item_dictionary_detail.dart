import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class ItemDictionaryDetail extends StatelessWidget {
  final Map document;
	ItemDictionaryDetail({Key key, this.document}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム詳細'),
				),
        body: ItemDictionaryDetailPage(document: document),
		);
	}
}

class ItemDictionaryDetailPage extends StatefulWidget {
  final Map document;
  ItemDictionaryDetailPage({Key key, this.document}) : super(key: key);

  ItemDictionaryDetailPageState createState() => new ItemDictionaryDetailPageState(document: document);
}

class ItemDictionaryDetailPageState extends State<ItemDictionaryDetailPage> {
  final Map document;
	ItemDictionaryDetailPageState({this.document});

  @override
  Widget build(BuildContext context) {
		String name = document['name'];
		String type = document['type'];
		String category = document['category'];
		String describe = document['describe'];
		List<Widget> list_tiles = getContainer(context, name, category, type, describe);
		return ListView.separated(
			itemCount: list_tiles.length,
			separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
			itemBuilder: (BuildContext context, int index) {
				return list_tiles[index];
			},
		);
	}

	List<Widget> getContainer(BuildContext context, String name, String category, String type, String describe) {

		List<Widget> list_tiles = <Widget>[
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
					title: Text('名称'),
					trailing: Text(name),
				)
			),
			Container(
				child: ListTile(
					title: Text('種類'),
					trailing: Text(category),
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
