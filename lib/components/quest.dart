import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/tactics.dart';

import 'package:yuusya/data/quests/first.dart';
import 'package:yuusya/data/quests/second.dart';
import 'package:yuusya/data/quests/third.dart';
import 'package:yuusya/data/quests/fouth.dart';
import 'package:yuusya/data/quests/fifth.dart';
import 'package:yuusya/data/quests/sixth.dart';

class Quest {
	var quest;

	void start() async {
		
		DocumentSnapshot docSnapshot = await Firestore.instance.collection('users').document(user_info.getString('id')).get();
		Map user_data = docSnapshot.data;

		if (quests_select == 1) {
			quest = FirstQuest(user_data, quests_select_text);
		}
		if (quests_select == 2) {
			quest = SecondQuest(user_data, quests_select_text);
		}
		if (quests_select == 3) {
			quest = ThirdQuest(user_data, quests_select_text);
		}
		if (quests_select == 4) {
			quest = FouthQuest(user_data, quests_select_text);
		}
		if (quests_select == 5) {
			quest = FifthQuest(user_data, quests_select_text);
		}
		if (quests_select == 6) {
			quest = SixthQuest(user_data, quests_select_text);
		}
		distance = quest.distance;
		quest.start();
	}
}
