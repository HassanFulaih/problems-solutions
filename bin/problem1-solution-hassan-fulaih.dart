import 'dart:io';

main() {
  List<String> ingredients1 = ['tomato', 'onion', 'lettuce'];
  List<String> fridge1 = ['tomato', 'banana', 'apple', 'onion', 'cucumber'];

  List<String> ingredients2 = ['olives', 'onion', 'lettuce'];
  List<String> fridge2 = ['onion', 'banana', 'lettuce', 'olives'];

  bool result1 = validateRecipe(fridge1, ingredients1);
  display_result(result1);

  bool result2 = validateRecipe(fridge2, ingredients2);
  display_result(result2);

  final input = fetchInputFromUser();
  bool result3 = validateRecipe(fridge1, input);
  display_result(result3);
}

void display_result(bool result) {
  print('----------------------- Result -----------------------');
  result
      ? print('All the ingredients currently available in your fridge.')
      : print('you don\'t have all the ingredients available in the fridge.');
}

List<String> fetchInputFromUser() {
  print(
      'Please Enter all the ingredients to check if it available or not in the fridge1:');

  print('How many ingredients you need:');
  var num = double.tryParse(stdin.readLineSync()!) ?? 0;

  List<String> inputIngredients = [];
  for (var i = 0; i < num; i++) {
    print('ingredient ${i+1}:');
    inputIngredients.add(stdin.readLineSync()!);
  }
  return inputIngredients;
}

bool validateRecipe(List<String> fridge, List<String> ingredients) {
  return ingredients.every((element) {
    return fridge.contains(element);
  });
}
