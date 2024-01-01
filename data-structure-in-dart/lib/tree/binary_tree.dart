import 'package:data_structure_in_dart/queue/queue_stack.dart';
import 'dart:math' show max;

class BinaryTreeNode<T> {
  T value;
  BinaryTreeNode<T>? left;
  BinaryTreeNode<T>? right;

  BinaryTreeNode(this.value);

  void forEachInOrder(void Function(T) action) {
    left?.forEachInOrder(action);
    action(value);
    right?.forEachInOrder(action);
  }

  void forEachPreOrder(void Function(T) action) {
    action(value);
    left?.forEachPreOrder(action);
    right?.forEachPreOrder(action);
  }

  void forEachPostOrder(void Function(T) action) {
    left?.forEachPostOrder(action);
    right?.forEachPostOrder(action);
    action(value);
  }

  void forEachLevelOrder(void Function(T) action) {
    final queue = QueueStack<BinaryTreeNode<T>>();
    queue.enqueue(this);

    while (!queue.isEmpty) {
      final node = queue.dequeue();

      if (node == null) break;

      action(node.value);

      if (node.left != null) queue.enqueue(node.left!);
      if (node.right != null) queue.enqueue(node.right!);
    }
  }

  List<T?> serialize() {
    final list = <BinaryTreeNode<T>?>[this];

    int i = 0;

    while (i < list.length) {
      final node = list[i++];

      if (node == null) {
        continue;
      }

      list.add(node.left);
      list.add(node.right);
    }

    return list.map((e) => e?.value).toList();
  }

  int get treeDepth => _treeDepthHelper(this);

  static int _treeDepthHelper<T>(BinaryTreeNode<T>? node) {
    if (node == null) return 0;

    return 1 + max(_treeDepthHelper(node.left), _treeDepthHelper(node.right));
  }

  // FIXME: Optimize acc to the solution
  static BinaryTreeNode<T> deserialize<T>(List<T?> list) {
    if (list.first == null) throw Exception("Invalid list");

    final root = BinaryTreeNode<T>(list.first as T);

    helper(BinaryTreeNode<T> node, int nonNullCount) {
      int li = 2 * nonNullCount + 1;
      int ri = 2 * nonNullCount + 2;

      final leftVal = list[li];
      final rightVal = list[ri];

      if (leftVal != null) {
        final left = BinaryTreeNode(leftVal);
        node.left = left;

        // adjust NNC
        int nnc = nonNullCount;
        for (var i = nonNullCount; i < li; i++) {
          if (list[i] != null) nnc++;
        }

        helper(left, nnc);
      }

      if (rightVal != null) {
        final right = BinaryTreeNode(rightVal);
        node.right = right;

        // adjust NNC
        int nnc = nonNullCount;
        for (var i = nonNullCount; i < ri; i++) {
          if (list[i] != null) nnc++;
        }

        helper(right, nnc);
      }
    }

    helper(root, 0);

    return root;
  }

  @override
  String toString() {
    // TODO: implement toString
    return _diagram(this);
  }

  String _diagram(
    BinaryTreeNode<T>? node, [
    String top = '',
    String root = '',
    String bottom = '',
  ]) {
    if (node == null) {
      return '$root null\n';
    }
    if (node.left == null && node.right == null) {
      return '$root ${node.value}\n';
    }
    final a = _diagram(
      node.right,
      '$top ',
      '$top┌──',
      '$top│ ',
    );
    final b = '$root${node.value}\n';

    final c = _diagram(
      node.left,
      '$bottom│ ',
      '$bottom└──',
      '$bottom ',
    );
    return '$a$b$c';
  }
}
