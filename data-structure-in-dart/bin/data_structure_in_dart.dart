// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:data_structure_in_dart/tree/binary_search_tree.dart';
import 'package:data_structure_in_dart/tree/binary_tree.dart';

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

  final six = BinaryTreeNode(6);
  final four = BinaryTreeNode(4);
  final three = BinaryTreeNode(3);
  final five = BinaryTreeNode(5);
  final eleven = BinaryTreeNode(11);
  final twentyOne = BinaryTreeNode(21);
  final nine = BinaryTreeNode(9);
  final one = BinaryTreeNode(1);

  six
    ..left = four
    ..right = three;

  four
    ..left = five
    ..right = eleven;

  three.right = twentyOne;
  eleven.left = nine;
  twentyOne.left = one;

  print(six);

  final tree = six.serialize();
  print(tree);
  print("len: ${tree.length}");

  print(six.deserialize(tree));

  final treeList = [
    15,
    10,
    5,
    null,
    null,
    12,
    null,
    null,
    25,
    17,
    null,
    null,
    null
  ];

  print(six.deserialize(treeList));
}
