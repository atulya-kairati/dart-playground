
import 'package:data_structure_in_dart/queue/queue_stack.dart';

class TreeNode<T> {
  T value;
  final List<TreeNode<T>> _children;

  TreeNode(this.value) : _children = [];

  void add(TreeNode<T> child) {
    _children.add(child);
  }

  void forEachDepthFirstSearch(void Function(TreeNode<T>) action) {
    // perform action on the current node
    action(this);

    // call recursively on the children
    for (var child in _children) {
      child.forEachDepthFirstSearch(action);
    }
  }

  void forEachLevelOrderSearch(void Function(TreeNode<T>) action) {
    // we make a queue to keep track of the order and ensure the level order
    final queue = QueueStack<TreeNode<T>>();
    queue.enqueue(this);

    while (!queue.isEmpty) {
      final node = queue.dequeue()!;
      action(node);

      node._children.forEach(queue.enqueue);
    }
  }

  TreeNode<T>? search(T value) {
    TreeNode<T>? res;
    forEachLevelOrderSearch((node) {
      if (node.value == value) {
        res = node;
      }
    });

    return res;
  }
}
