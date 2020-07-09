
class Items {

	List<Map<String, dynamic>> _documents = [
		{
			'name': 'プロテイン',
			'type': '無',
			'category': '薬',
			'describe': 'ただの薬',
			'money': 100,
			'str': 3,
			'ac': 0,
			'dex': 0,
			'hp': 0,
		},
		{
			'name': 'マムシ酒',
			'type': '無',
			'category': '薬',
			'describe': '少し良い薬',
			'money': 250,
			'str': 0,
			'ac': 0,
			'dex': 0,
			'hp': 10,
		},
	];

	List<Map> getItems() {

		return _documents;
	}

}
