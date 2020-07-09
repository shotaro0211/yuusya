import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'item_detail.dart';


class Items extends StatelessWidget {
	Items({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム一覧'),
				),
        body: ItemsPage(),
		);
	}
}

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  ItemsPageState createState() => new ItemsPageState();
}

class ItemsPageState extends State<ItemsPage> {

  @override
  Widget build(BuildContext context) {
		return StreamBuilder<QuerySnapshot>(
			stream: user_items_database,
			builder: (context, snapshot) {
				if (snapshot.hasError)
					return new Text('Error: ${snapshot.error}');
				switch (snapshot.connectionState) {
					case ConnectionState.waiting: return Container(alignment: Alignment.center, child: CircularProgressIndicator());
					default:
						return new ListView(
							children: snapshot.data.documents.map((DocumentSnapshot document) {
								return new Card(
									child: ListTile(
										leading: Icon(FontAwesomeIcons.flask),
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
												settings: const RouteSettings(name: "/item_detail"),
												builder: (BuildContext context) => ItemDetail(document: document)
											));
										},
									),
								);
							}).toList(),
						);
				}
			},
		);
	}

}
