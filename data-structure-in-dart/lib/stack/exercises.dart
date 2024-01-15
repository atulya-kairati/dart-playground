import 'package:data_structure_in_dart/stack/stack.dart';

// Reversing a list using stack
List<T> reverseList<T>(List<T> list) {
  Stack<T> stack = Stack.from(list);

  List<T> revList = <T>[];

  while (!stack.isEmpty) {
    revList.add(stack.pop());
  }

  return revList;
}

// check if parenthesis() are balanced
bool checkParenthesisBalance(String text) {
  Stack<int> stack = Stack();


  // or use a map
  final brackets = [
    ('('.firstCU, ')'.firstCU),
    ('{'.firstCU, '}'.firstCU),
    ('['.firstCU, ']'.firstCU),
  ];

  for (var c in text.codeUnits) {

    for (var pair in brackets) {
      final (openingParen, closingParen) = pair;

      if (c == openingParen) {
        stack.push(openingParen);
      }

      if (c == closingParen) {
        if (stack.isEmpty || stack.peek != openingParen) return false;

        stack.pop();
      }
    }
  }

  return stack.isEmpty;
}

extension StringExtenstion on String {
  int get firstCU => codeUnits.first;

}
