import 'dart:io';

main() {
  Map<String, int> ingredients1 = {'tomato': 1, 'onion': 2};
  Map<String, int> fridge1 = {'tomato': 1, 'onion': 1};

  Map<String, int> ingredients2 = {'tomato': 2, 'onion': 3};
  Map<String, int> fridge2 = {'tomato': 2, 'onion': 3, 'olives': 1};

  bool result1 = validateRecipeWithQuantity(fridge1, ingredients1);
  display_result(result1);

  bool result2 = validateRecipeWithQuantity(fridge2, ingredients2);
  display_result(result2);

  final input = fetchInputFromUser();
  bool result3 = validateRecipeWithQuantity(fridge1, input);
  display_result(result3);
}

void display_result(bool result) {
  print('----------------------- Result -----------------------');
  result
      ? print('All the ingredients currently available in your fridge.')
      : print('you don\'t have enough ingredients available in the fridge.');
}

Map<String, int> fetchInputFromUser() {
  print(
      'Please Enter all the ingredients to check if it available or not in the fridge1:');

  print('How many type of ingredients you need:');
  var num = double.tryParse(stdin.readLineSync()!) ?? 0;

  Map<String, int> inputIngredients = {};
  for (var i = 0; i < num; i++) {
    print('ingredient ${i + 1} name:');
    final String key = stdin.readLineSync()!;
    print('ingredient ${i + 1} required number:');
    final int value = int.tryParse(stdin.readLineSync()!) ?? 1;
    inputIngredients.addAll({key: value});
  }
  return inputIngredients;
}

bool validateRecipeWithQuantity(
    Map<String, int> fridge, Map<String, int> ingredients) {
  List<bool> results = [];
  ingredients.forEach((key, value) {
    final String? matchedKey = fridge.containsKey(key) ? key : null;
    results.add(matchedKey == null ? false : (fridge[matchedKey] == value));
  });
  return results.every((element) => element == true);
}
