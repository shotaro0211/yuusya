import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:yuusya/components/user_info.dart';
import 'headquarters/bar.dart';
import 'headquarters/shop.dart';


class Headquarters extends StatelessWidget {
	Headquarters({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('行きつけの街'),
				),
        body: HeadquartersPage(),
		);
	}
}

class HeadquartersPage extends StatefulWidget {
  HeadquartersPage({Key key}) : super(key: key);

  HeadquartersPageState createState() => new HeadquartersPageState();
}

class HeadquartersPageState extends State<HeadquartersPage> {

  @override
  Widget build(BuildContext context) {
		List<Widget> list_tiles = getContainer(context);
		return ListView.separated(
			itemCount: list_tiles.length,
			separatorBuilder: (BuildContext context, int index) => Divider(color: Colors.black,),
			itemBuilder: (BuildContext context, int index) {
				return list_tiles[index];
			},
		);
	}

	List<Widget> getContainer(BuildContext context) {

		List<Widget> list_tiles = <Widget>[
			Container(
				child: ListTile(
					title: Text(
						"購買部",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('武器屋'),
					trailing: Icon(Icons.arrow_forward_ios),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/bar"),
							builder: (BuildContext context) => Bar()
						));
					}
				)
			),
			Container(
				child: ListTile(
					title: Text('アイテム屋'),
					trailing: Icon(Icons.arrow_forward_ios),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/shop"),
							builder: (BuildContext context) => Shop()
						));
					}
				)
			),
		];
		return list_tiles;
	}

	@override
	void initState() {
	  User_info.getMoney();
	}

}
