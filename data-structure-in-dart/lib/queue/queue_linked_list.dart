
import 'package:data_structure_in_dart/linked_list/linked_list.dart';
import 'package:data_structure_in_dart/queue/abstract_queue.dart';

class QueueLinkedList<T> extends  Queue<T> {

  final LinkedList<T> _linkedList;

  QueueLinkedList() : _linkedList = LinkedList<T>();

  /// TC: O(1)
  @override
  T? dequeue() {
    return _linkedList.pop();
  }

  /// TC: O(1)
  @override
  bool enqueue(T element) {
    _linkedList.append(element);
    return true;
  }

  @override
  bool get isEmpty => _linkedList.isEmpty;

  @override
  T? get peek => _linkedList.head?.value;

  @override
  String toString() {

    if (isEmpty) return "Queue Empty";

    var repr = '<-- ';

    var ptr = _linkedList.head;

    while (ptr != null) {
      repr += '${ptr.value} - ';
      ptr = ptr.next;
    }

    return '${repr.substring(0, repr.length - 1 - 2)} <--'; // -2 to get rid of '- '
  }

}