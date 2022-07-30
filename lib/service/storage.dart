// import 'dart:convert';
//
// class Storage {
//   SharedPreferences? prefs;
//
//   Future<void> install() async {
//     prefs = await SharedPreferences.getInstance();
//   }
//
//   Future<void> flash(String keyName) async {
//     await prefs?.remove(keyName);
//   }
//
//   Future<bool> exists(String keyName) async {
//     bool? exist = prefs?.containsKey(keyName);
//     if (exist == null) {
//       return false;
//     } else {
//       return exist;
//     }
//   }
//
//   Future<void> set(String keyName, dynamic value,
//       {serializable = false}) async {
//     var data = value;
//     if (serializable) {
//       data = jsonEncode(value);
//     }
//     await prefs?.setString(keyName, data.toString());
//   }
//
//   Future<String?> get(String keyName) async {
//     return prefs?.getString(keyName);
//   }
//
//   Future<Future<bool>?> remove(String keyName) async {
//     return prefs?.remove(keyName);
//   }
//
//   Future<void> add(String keyName, Map value) async {
//     List<String> data = (await getList(keyName)) ?? [];
//     bool isDuplicate = false;
//     var dataList = data.map((item) {
//       return jsonDecode(item);
//     }).toList();
//     for (var element in dataList) {
//       if (element['id'] == value['id']) {
//         isDuplicate = true;
//       }
//     }
//
//     if (!isDuplicate) {
//       data.add(jsonEncode(value));
//       await prefs?.setStringList(keyName, data);
//     }
//   }
//
//   Future<void> deleteItem(String keyName, int index) async {
//     List<String> data = (await getList(keyName)) ?? [];
//     data.removeAt(index);
//
//     await prefs?.setStringList(keyName, data);
//   }
//
//   Future<List<String>?> getList(String keyName) async {
//     return prefs?.getStringList(keyName);
//   }
//
//   String? notFutureGet(String keyName) {
//     return prefs?.getString(keyName);
//   }
// }