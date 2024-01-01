import 'package:data_structure_in_dart/linked_list/doubly_linked_list.dart';
import 'package:data_structure_in_dart/queue/dequeue/deque.dart';

class DequeDLL<T> extends Deque<T> {
  final dll = DoublyLinkedList();

  @override
  T? dequeue(Direction from) {
    if (dll.isEmpty) return null;

    return (from == Direction.front) ? dll.pop() : dll.removeLast();
  }

  @override
  bool enqueue(T element, Direction to) {
    if (to == Direction.front) {
      dll.push(element);
    } else {
      dll.append(element);
    }

    return true;
  }

  @override
  bool get isEmpty => dll.isEmpty;

  @override
  T? peek(Direction from) {
    if (dll.isEmpty) return null;

    return (from == Direction.front) ? dll.head?.value : dll.tail?.value;
  }

  @override
  String toString() {
    if (isEmpty) {
      return 'Empty Deque';
    }

    return dll.toString();
  }
}
