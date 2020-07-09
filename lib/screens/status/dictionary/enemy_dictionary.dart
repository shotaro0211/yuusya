import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/data/enemys.dart';
import 'enemy_dictionary_detail.dart';


class EnemyDictionary extends StatelessWidget {
	EnemyDictionary({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('敵辞典'),
				),
        body: EnemyDictionaryPage(),
		);
	}
}

class EnemyDictionaryPage extends StatefulWidget {
  EnemyDictionaryPage({Key key}) : super(key: key);

  EnemyDictionaryPageState createState() => new EnemyDictionaryPageState();
}

class EnemyDictionaryPageState extends State<EnemyDictionaryPage> {

  @override
  Widget build(BuildContext context) {
		List<Map> documents = Enemys().getEnemys();
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
								new Text('${document['tribe_name']}', style: TextStyle(fontSize: 15.0,)),
								new Text('${document['describe']}/${document['type']}', style: TextStyle(fontSize: 10.0,)),
							]
						),
						trailing: Icon(Icons.info_outline, color: Colors.cyan,),
						onTap: () {
							Navigator.push(context, MaterialPageRoute<Null>(
								settings: const RouteSettings(name: "/enemy_dictionary_detail"),
								builder: (BuildContext context) => EnemyDictionaryDetail(document: document)
							));
						},
					),
				);
			}).toList(),
		);
	}

}
