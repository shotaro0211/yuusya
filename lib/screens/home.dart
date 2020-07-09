import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:grouped_list/grouped_list.dart';
import 'home/tutorial.dart';

final controller = StreamController<String>();

class Home extends StatelessWidget {
	Home({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('外の世界'),
				),
        body: HomePage(),
		);
	}

}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
	List _info_list = [
		'初めての方へ',
		'注意事項',
  ];

  @override
  Widget build(BuildContext context) {

    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
					child: Row(
					  children: <Widget> [ 
						  Text('お知らせ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),)
						]
					),
        ),
				Expanded(
					child: ListView.builder(
            itemBuilder: (context, index) {
							return Card(
								elevation: 8.0,
								margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
								child: Container(
									child: ListTile(
										contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
										leading: Image.asset("assets/icons/info.png", scale: 7),
										title: Text(_info_list[index]),
										trailing: Icon(Icons.arrow_forward),
										onTap: () {
											Navigator.push(context, MaterialPageRoute<Null>(
												settings: const RouteSettings(name: "/home/tutorial"),
												builder: (BuildContext context) => Tutorial()
											));
										},
									),
								),
              );
            },
				    itemCount: _info_list.length,
          ), 
        ),
      ],
    );
  }
}
