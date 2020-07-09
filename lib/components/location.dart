import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yuusya/components/quest.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'result.dart';
import 'package:yuusya/screens/tactics.dart';

class Location extends StatelessWidget {
  String title = '移動中';
	Location({Key key}) : super(key: key);

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
				appBar: AppBar(
					title: Text(title),
				),
        body: LocationPage(),
		);
	}
}

class LocationPage extends StatefulWidget{
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  double total_distance = -100; // Geolocator
	double per = 0;
	StreamSubscription _getPositionSubscription;
  // Location
  var geolocator = Geolocator();
  var locationOptions = LocationOptions(accuracy: LocationAccuracy.best, distanceFilter: 100);

  @override
  void initState() {
    super.initState();
    _getLocation(context);
  }
	@override
	void dispose() {
		geolocator.getPositionStream(null).listen(null);
		super.dispose();
	}

  Future<void> _getLocation(context) async {
		GeolocationStatus geolocationStatus  = await geolocator.checkGeolocationPermissionStatus();
    Position _currentPosition = await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best); // ここで精度を「best」に指定している
    _getPositionSubscription = geolocator.getPositionStream(locationOptions).listen((Position stream_position) async {
			setState(() {
			  total_distance += 100;
				per = total_distance / (quests_select * 200);
				if (per >= 0.99) {
					per = 1.0;
					_getPositionSubscription?.cancel();
					_getPositionSubscription = null;;
					Quest().start();
					Navigator.pushReplacement(context, MaterialPageRoute(
						builder: (context) => Result()
					));
				}
		    print(total_distance);
				print(per);
			});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<GeolocationStatus>(
      future: Geolocator().checkGeolocationPermissionStatus(),
      builder:
          (BuildContext context, AsyncSnapshot<GeolocationStatus> snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data == GeolocationStatus.denied) {
          return Text(
            'Access to location denied',
            textAlign: TextAlign.center,
          );
        }
        return Center(
					child: CircularPercentIndicator(
						radius: 300.0,
						lineWidth: 30.0,
						percent: per,
						center: new Text("敵まで、走り抜け"),
						progressColor: Colors.orange,
					),
        );
      }
    );
  }
}
