import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'shop/buy.dart';
import 'shop/sale.dart';


class Shop extends StatelessWidget {
	Shop({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('アイテム屋'),
				),
        body: ShopPage(),
		);
	}
}

class ShopPage extends StatefulWidget {
  ShopPage({Key key}) : super(key: key);

  ShopPageState createState() => new ShopPageState();
}

class ShopPageState extends State<ShopPage> {

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
						"アイテム屋",
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
							settings: const RouteSettings(name: "/buy"),
							builder: (BuildContext context) => Buy()
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
