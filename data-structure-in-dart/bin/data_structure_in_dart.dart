// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:data_structure_in_dart/tree/binary_search_tree.dart';

void main(List<String> arguments) {

  final bst = BinarySearchTree<int>();

  bst.insert(3);
  bst.insert(1);
  bst.insert(5);
  // bst.insert(0);
  bst.insert(2);
  bst.insert(4);
  bst.insert(6);

  print(bst);

  print(bst.contains(21));

  bst.remove(5);
  print(bst);

}
