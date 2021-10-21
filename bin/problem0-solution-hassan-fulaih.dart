import 'dart:io';

main() async {
  List<String> foods = ['banana', 'orange', 'apple'];
  int result = whereIsMyFood(foods, 'apple');
  print('result = $result');

  final String input = fetchInputFromUser();
  int result2 = whereIsMyFood(foods, input);
  print('result2 = $result2');
}

String fetchInputFromUser() {
  print('Please Enter a name of a food in order to give you the position:');
  return stdin.readLineSync() ?? '';
}

int whereIsMyFood(List<String> fridge, String item) {
  int? filteredIndexItem;
  for (var i = 0; i < fridge.length; i++) {
    if (fridge[i] == item) filteredIndexItem = i;
  }
  return filteredIndexItem ?? -1;

  //return fridge.indexWhere((element) => element == item);
}
