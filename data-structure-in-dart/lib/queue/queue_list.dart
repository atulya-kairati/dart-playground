import 'package:data_structure_in_dart/queue/abstract_queue.dart';

class QueueList<T> extends Queue<T> {
  final List<T> _list;

  QueueList() : _list = <T>[];

  /// Pop element from front
  /// TC: O(n) since we are using list
  @override
  T? dequeue() => (isEmpty) ? null : _list.removeAt(0);

  /// Adds an element to the back
  /// TC: O(1)
  @override
  bool enqueue(T element) {
    _list.add(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  T? get peek => (isEmpty) ? null : _list.first;

  @override
  String toString() {
    if (isEmpty) return "Empty Queue";

    return "<-- ${_list.join(' - ')} <--";
  }
}
