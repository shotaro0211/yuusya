import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/user_info.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

	//初期読み込み
	await User_info.getInfo();
	await User_info.getDatabase();
	//
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false,
      title: 'yuusya',
      theme: new ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: new App(),
    );
  }
}
