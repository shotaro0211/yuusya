import 'package:yuusya/components/quest_log.dart';
import 'package:yuusya/data/yuusya.dart';

class Enemy {
	  String name;
    int str;
    int ac;
    int dex;
    int hp;

    void attack(Human target) {
        //physPowerだけダメージを与える
        target.hp = target.hp - this.str;
        quest_log.add('${name}は勇者に通常攻撃をした。');
        quest_log.add('勇者のHPは${target.hp}になった。');
    }
}
