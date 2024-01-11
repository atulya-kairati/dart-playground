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

  void forEachDepthFirstWithNull(void Function(T?) action) {
    action(this.value);

    this.left == null
        ? action(null)
        : this.left?.forEachDepthFirstWithNull(action);

    this.right == null
        ? action(null)
        : this.right?.forEachDepthFirstWithNull(action);
  }

  List<T?> serialize() {
    final list = <T?>[];

    this.forEachDepthFirstWithNull((val) => list.add(val));

    return list;
  }

  int get treeDepth => _treeDepthHelper(this);

  static int _treeDepthHelper<T>(BinaryTreeNode<T>? node) {
    if (node == null) return 0;

    return 1 + max(_treeDepthHelper(node.left), _treeDepthHelper(node.right));
  }

  BinaryTreeNode<T>? deserialize(List<T?> list) {
    if (list.isEmpty) return null;

    final value = list.removeAt(0);

    if (value == null) return null;

    final node = BinaryTreeNode(value);

    node.left = deserialize(list);
    node.right = deserialize(list);

    return node;
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
