import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'bar/employment.dart';
import 'bar/sale.dart';


class Bar extends StatelessWidget {
	Bar({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('武器屋'),
				),
        body: BarPage(),
		);
	}
}

class BarPage extends StatefulWidget {
  BarPage({Key key}) : super(key: key);

  BarPageState createState() => new BarPageState();
}

class BarPageState extends State<BarPage> {

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
						"武器屋",
						style: TextStyle(fontSize:15, fontWeight: FontWeight.bold),
					),
				),
			),
			Container(
				child: ListTile(
					title: Text('購入'),
					trailing: Icon(Icons.arrow_forward_ios),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/employment"),
							builder: (BuildContext context) => Employment()
						));
					}
				)
			),
			Container(
				child: ListTile(
					title: Text('売却'),
					trailing: Icon(Icons.arrow_forward_ios),
					onTap: () {
						Navigator.push(context, MaterialPageRoute<Null>(
							settings: const RouteSettings(name: "/sale"),
							builder: (BuildContext context) => Sale()
						));
					}
				)
			),
		];
		return list_tiles;
	}

}
