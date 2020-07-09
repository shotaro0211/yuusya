import 'dart:math';

import 'package:yuusya/components/quest_log.dart';
import 'enemys/enemy.dart';

class Human {
    int str;
    int ac;
    int dex;
    int hp;

    Human(this.str, this.ac, this.dex, this.hp);

    void attack(Enemy target) {
        //physPowerだけダメージを与える
        target.hp = target.hp - str;
        quest_log.add('勇者は${target.name}に通常攻撃をした。');
    }

    int levelCheck(Map<String, dynamic> user_data) {
			int new_level = 1;
			int max_level = 20;

      for (int i = 1; i < max_level; i++){ 
				if (user_data['exp'] > i * 100) {
					new_level = i + 1;
				}
			}

			if (new_level - user_data['level'] != 0) {
				for (int i = 0; i < new_level - user_data['level']; i++){
					levelUp(user_data['level'] + i + 1, user_data);
				}
			}
			return new_level;
    }

		void levelUp(int level, Map<String, dynamic> user_data) {
			quest_log.add('勇者はLv${level}に上がった。');
			var rand = Random();
			int add_str = rand.nextInt(5);
			user_data['str'] += add_str;
			quest_log.add('勇者の攻撃力は＋${add_str}上がった。');
			int add_ac = rand.nextInt(5);
			user_data['ac'] += add_ac;
			quest_log.add('勇者の防御力は＋${add_ac}上がった。');
			int add_dex = rand.nextInt(5);
			user_data['dex'] += add_dex;
			quest_log.add('勇者の素早さは＋${add_dex}上がった。');
			int add_hp = rand.nextInt(10);
			user_data['hp'] += add_hp;
			quest_log.add('勇者の体力は＋${add_hp}上がった。');
		}

		void planUp(int battle_plan) {
			if (battle_plan == 1) {
				str = (str * 1.3).round();
			}
			if (battle_plan == 2) {
				str = (str * 1.1).round();
			}
			if (battle_plan == 4) {
				hp = (hp * 1.1).round();
			}
			if (battle_plan == 5) {
				hp = (hp * 1.3).round();
			}
		}

		void weaponUp(Map unit) {
			if (unit['str'] != 0) {
				str += unit['str'];
				quest_log.add('勇者は、${unit['name']}により攻撃力が＋${unit['str']}上がった');
			}
			if (unit['ac'] != 0) {
				ac += unit['ac'];
				quest_log.add('勇者は、${unit['name']}により守備力が＋${unit['ac']}上がった');
			}
			if (unit['dex'] != 0) {
				dex += unit['dex'];
				quest_log.add('勇者は、${unit['name']}により素早さが＋${unit['dex']}上がった');
			}
			if (unit['hp'] != 0) {
				hp += unit['hp'];
				quest_log.add('勇者は、${unit['name']}により体力が＋${unit['hp']}上がった');
			}
		}

		void itemsUp(List<Map> items) {
			int length = items.length;
			for (int i = 0; i < length; i++) {
				if (items[i]['str'] != 0) {
					str += items[i]['str'];
					quest_log.add('勇者は、${items[i]['name']}により攻撃力が＋${items[i]['str']}上がった');
				}
				if (items[i]['ac'] != 0) {
					ac += items[i]['ac'];
					quest_log.add('勇者は、${items[i]['name']}により守備力が＋${items[i]['ac']}上がった');
				}
				if (items[i]['dex'] != 0) {
					dex += items[i]['dex'];
					quest_log.add('勇者は、${items[i]['name']}により素早さが＋${items[i]['dex']}上がった');
				}
				if (items[i]['hp'] != 0) {
					hp += items[i]['hp'];
					quest_log.add('勇者は、${items[i]['name']}により体力が＋${items[i]['hp']}上がった');
				}
			}
		}

}
