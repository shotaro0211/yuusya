import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


SharedPreferences user_info;
Stream user_database;
Stream user_items_database;
Stream user_units_database;
int user_money = 0;
int user_complete_count = 0;

bool battled = false;

class User_info {
	
	static Future getMoney() async {
		DocumentSnapshot docSnapshot = await Firestore.instance.collection('users').document(user_info.getString('id')).get();
		Map record = docSnapshot.data;
		user_money = record['money'];
		user_complete_count = record['complete_count'];
	}

	static Future getInfo() async {
	  user_info = await SharedPreferences.getInstance();
	}

	static Future getDatabase() async {
		if (user_info.getBool('user_has') ?? false) {
			user_database = Firestore.instance.collection('users').document(user_info.getString('id')).snapshots();
			user_units_database = Firestore.instance.collection('users').document(user_info.getString('id')).collection('units').snapshots();
			user_items_database = Firestore.instance.collection('users').document(user_info.getString('id')).collection('items').snapshots();
		}
	}

}


