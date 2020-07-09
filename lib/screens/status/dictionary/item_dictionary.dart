import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/data/items.dart';
import 'item_dictionary_detail.dart';


class ItemDictionary extends StatelessWidget {
	ItemDictionary({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム辞典'),
				),
        body: ItemDictionaryPage(),
		);
	}
}

class ItemDictionaryPage extends StatefulWidget {
  ItemDictionaryPage({Key key}) : super(key: key);

  ItemDictionaryPageState createState() => new ItemDictionaryPageState();
}

class ItemDictionaryPageState extends State<ItemDictionaryPage> {

  @override
  Widget build(BuildContext context) {
		List<Map> documents = Items().getItems();
		return new ListView(
			children: documents.map((Map document) {
				return new Card(
					child: ListTile(
						leading: Icon(Icons.android),
						title: 
						Column(
							mainAxisSize: MainAxisSize.min,
							crossAxisAlignment: CrossAxisAlignment.start,
							children: <Widget>[
								new Text('${document['name']}', style: TextStyle(fontSize: 15.0,)),
								new Text('${document['describe']}/${document['type']}', style: TextStyle(fontSize: 10.0,)),
							]
						),
						trailing: Icon(Icons.info_outline, color: Colors.cyan,),
						onTap: () {
							Navigator.push(context, MaterialPageRoute<Null>(
								settings: const RouteSettings(name: "/item_dictionary_detail"),
								builder: (BuildContext context) => ItemDictionaryDetail(document: document)
							));
						},
					),
				);
			}).toList(),
		);
	}

}
