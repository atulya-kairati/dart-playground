import 'package:data_structure_in_dart/tree/binary_tree.dart';

extension Checker<T extends num> on BinaryTreeNode<T> {
  bool isBST() {
    return _checkBST(this);
  }

  bool _checkBST(BinaryTreeNode<T>? node, {T? min, T? max}) {
    if (node == null) return true;

    if (min != null && node.value <= min) return false;
    if (max != null && node.value >= max) return false;

    return _checkBST(node.left, min: min, max: node.value) &&
        _checkBST(node.right, min: node.value, max: max);
  }
}
