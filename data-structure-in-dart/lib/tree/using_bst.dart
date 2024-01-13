import 'package:data_structure_in_dart/tree/binary_tree.dart';

extension Checker<T extends num> on BinaryTreeNode<T>? {
  bool isBST() {
    return _checkBST(this);
  }

  bool _checkBST(BinaryTreeNode<T>? node, {T? min, T? max}) {
    if (node == null) return true;

    // bounds check
    if (min != null && node.value <= min) return false;
    if (max != null && node.value >= max) return false;

    // if we are checking the left node then current node is the max and min is from current iteration
    // if we are checking the right node then current node is the min and max is from current iteration
    return _checkBST(node.left, min: min, max: node.value) &&
        _checkBST(node.right, min: node.value, max: max);
  }

  bool isIdenticalTo(BinaryTreeNode<T>? other) => _identical(this, other);

  bool _identical(BinaryTreeNode<T>? b1, BinaryTreeNode<T>? b2) {
    if (b1 == null || b2 == null) {
      return b1 == b2; // if nay one is null than both should be null
    }

    return b1.value == b2.value &&
        _identical(b1.left, b2.left) &&
        _identical(b1.right, b2.right);
  }
}
