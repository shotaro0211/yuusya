import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:yuusya/components/quest_log.dart';
import 'package:yuusya/components/user_info.dart';
import 'package:yuusya/screens/tactics.dart';
import 'package:yuusya/data/yuusya.dart';
import 'package:yuusya/data/enemys/enemy.dart';
import 'battle.dart';

class Quest {
	String quest_name = '';
	int quest_index = 0;
	int exp = 0;
	int money = 0;
	int distance = 0;
	int battle_result = 0;
	Enemy enemy = Enemy();
	Map<String, dynamic> user_data = {};

  void start() {
		//勇者インスタンス生成
		Human yuusya = Human(user_data['str'], user_data['ac'], user_data['dex'], user_data['hp']);
		//戦術プラン反映
		yuusya.planUp(battle_plan);
		//装備品効果反映
		if (units_name_text != '') {
		  yuusya.weaponUp(units[0]);
		}
		//アイテム効果反映
		if (items_name_text != '' ) {
		  yuusya.itemsUp(items);
			//アイテム削除
			int length = items.length;
			for (int i = 0; i < length; i++) {
			  Firestore.instance.collection('users').document(user_data['id']).collection('items').document(items_id[i]).delete();
			}
		}
    //バトル開始
		quest_log.add('勇者は、${enemy.name}と戦闘を開始した。');
		Battle battle = Battle();
	  battle_result = battle.start(yuusya, enemy);
    //クエスト結果
		result(battle_result, yuusya);
	}

	void result (int result, Human yuusya) {
		if (result == 1) {
			//クエスト成功の報酬
			quest_log.add('クエスト成功');
			quest_log.add('${exp}の経験値を獲得した。');
			quest_log.add('${money}Gを獲得した。');
      //勇者のアップデート
      user_data['exp'] += exp;
			user_money += money;
      user_data['money'] += money;
      user_data['distance'] += quests_select * 200;
			user_data['level'] = yuusya.levelCheck(user_data);
			user_data['complete_count'] = checkCompleteCount(user_data['complete_count']);
			Map<String, dynamic> data = {
				'exp': user_data['exp'],
				'money': user_data['money'],
				'level': user_data['level'],
				'rank': user_data['rank'],
				'distance': user_data['distance'],
				'str': user_data['str'],
				'ac': user_data['ac'],
				'dex': user_data['dex'],
				'hp': user_data['hp'],
				'complete_count': user_data['complete_count'],
			};
			Firestore.instance.collection('users').document(user_data['id']).updateData(data);
      //アップデート終了
		}
		if (result == 2) {
			quest_log.add('クエスト失敗');
			quest_log.add('ゲームオーバー');
		}
		//クエストのログを取得
		Map<String, dynamic> quest_data = {
			'quest_name': quest_name,
			'quest_log': quest_log,
			'createdAt': DateTime.now(),
		};
		quest_log = [];
		Firestore.instance.collection('users').document(user_data['id']).collection('quest_logs').document().setData(quest_data);
	}
  //敵からのランダムドロップ
	void dropItem() {
  }
  //新しいクエストにいけるかのチェック
	int checkCompleteCount(int complete_count) {
		if (quest_index + 1 > complete_count) {
			if (quest_index < 6) {
			  complete_count = quest_index + 1;
				user_complete_count = complete_count;
			  quest_log.add('次のクエストが加わりました。');
			}
		}
		return complete_count;
  }

}
