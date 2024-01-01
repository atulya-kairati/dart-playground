
import 'package:data_structure_in_dart/tree/binary_tree.dart';

// we constrain T to be a comparable type
// since elements in BST need to be compared
class BinarySearchTree<T extends Comparable> {

  BinaryTreeNode<T>? root;

  @override
  String toString() => root.toString();

  void insert(T value) {
    root = _insertAt(root, value);
  }

  BinaryTreeNode<T>? _insertAt(BinaryTreeNode<T>? node, T value) {

    if (node == null) return BinaryTreeNode(value);

    if (value.compareTo(node.value) < 0) { // value < node.value
      node.left = _insertAt(node.left, value);
    }
    else { // value >= node.value
      node.right = _insertAt(node.right, value);
    }

    return node;
  }

  // TC: O(log n)
  bool contains(T value) {
    var ptr = root;

    while (ptr != null) {

      if (ptr.value == value) return true;

      if (value.compareTo(ptr.value) < 0) { // value < node.value
        ptr = ptr.left;
      } else {
        ptr = ptr.right;
      }

    }

    return false;
  }

  void remove(T value) {
    root = _removeAt(root, value);
  }

  BinaryTreeNode<T>? _removeAt(BinaryTreeNode<T>? node, T value) {

    if (node == null) return null;

    if (node.value == value) {
      // delete node

      // if no children present
      if (node.left == null && node.right == null) return null;

      // if one child present
      if (node.right != null && node.left == null) return node.right;
      if (node.left != null && node.right == null) return node.left;

      // if both children present
      // find min in the right subtree and 
      // assign it to the current node value
      // the delete the min in right subtree
      final rightTreeMin = node.right!.min!;
      node.value = rightTreeMin.value;
      node.right = _removeAt(node.right, rightTreeMin.value);
    }

    // recursively search and delete in the sub trees
    if (value.compareTo(node.value) < 0) { // value < node.value
      node.left = _removeAt(node.left, value);
    }
    else {
      node.right = _removeAt(node.right, value);
    }

    return node;
  }
}

extension _MinFinder<T> on BinaryTreeNode<T> {
  BinaryTreeNode<T>? get min => left?.min ?? this;
}