import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Tutorial extends StatelessWidget {
	Tutorial({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text('初めての方へ'),
				),
        body: TutorialPage(),
		);
	}

}

class TutorialPage extends StatefulWidget {
  TutorialPage({Key key}) : super(key: key);

  TutorialPageState createState() => new TutorialPageState();
}

class TutorialPageState extends State<TutorialPage> {

	TextStyle title_style = TextStyle(fontSize: 25);
	TextStyle style = TextStyle(fontSize: 23);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
			child: Card(
				elevation: 8.0,
				margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
				child: Column(
					crossAxisAlignment: CrossAxisAlignment.start,
					mainAxisSize: MainAxisSize.max,
          children: <Widget>[ 
					  Container(
					    child: Text('拝啓、ユーザー様', style: title_style),
				    ),
					  Container(
					    child: Text('', style: style),
				    ),
					  Container(
					    child: Text('この度はダウンロードありがとうございます。', style: style),
				    ),
					  Container(
					    child: Text('あなたはこれから勇者になってあらゆる敵と戦って頂きます。しかし、他のRPGとはひとつ異なる点があります。それは、敵に戦いをする道のりを実際にユーザー様が走らなければなりません。', style: style),
				    ),
					  Container(
					    child: Text('', style: style),
				    ),
					  Container(
					    child: Text('鬱陶しいシステムでございます。', style: style),
				    ),
					  Container(
					    child: Text('', style: style),
				    ),
					  Container(
					    child: Text('しかし戦わなければ真の勇者になることはできません。', style: style),
				    ),
					  Container(
					    child: Text('', style: style),
				    ),
					  Container(
					    child: Text('走るのです。さあ', style: style),
				    ),
					],
				),
			),
		);
  }
}
