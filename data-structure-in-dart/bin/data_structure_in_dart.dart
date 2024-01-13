// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_adjacent_string_concatenation

import 'package:data_structure_in_dart/tree/binary_search_tree.dart';
import 'package:data_structure_in_dart/tree/binary_tree.dart';
import 'package:data_structure_in_dart/tree/using_bst.dart';

void main(List<String> arguments) {
  final bst = BinarySearchTree<int>();

  bst.insert(30);
  bst.insert(10);
  bst.insert(50);
  bst.insert(20);
  bst.insert(40);
  bst.insert(60);
  bst.insert(17);
  bst.insert(15);
  bst.insert(19);
  bst.insert(5);
  bst.insert(8);
  bst.insert(3);

  print(bst);

  // bst.remove(10);
  // print(bst);

  final ten = BinaryTreeNode(10);
  final four = BinaryTreeNode(4);
  final three = BinaryTreeNode(3);
  final nine = BinaryTreeNode(9);
  final two = BinaryTreeNode(2);

  three.left = two;
  three.right = ten;
  two.right = nine;
  ten.left = four;

  print(three);

  print(bst.root?.isBST());
  print(three.isBST());

  print(three.isIdenticalTo(three));
}
