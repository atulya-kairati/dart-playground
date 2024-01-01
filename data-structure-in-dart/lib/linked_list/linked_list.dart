import 'package:data_structure_in_dart/linked_list/node.dart';

class LinkedList<T> extends Iterable<T> {
  Node<T>? head;
  Node<T>? tail;

  int _len = 0;

  @override
  bool get isEmpty => head == null;

  @override
  int get length => _len;

  // ------------ INSERTION METHODS: START ----------------

  void push(T value) {
    /**
     * Pushes the value at the front of the LL
     * TC: O(1)
     */

    // set the head to a node which points where head was pointing
    head = Node(value: value, next: head);

    // set the tail to head if tail is null
    tail ??= head;

    _len++;
  }

  void append(T value) {
    /**
     * Appends the value at the end of the LL
     * TC: O(1)
     */

    if (isEmpty) {
      push(value);
      return;
    }

    // making connection with the last node
    tail!.next = Node(value: value);
    // updating tail
    tail = tail!.next;

    _len++;
  }

  void insertAfter(T value, Node<T> beforeNode) {
    /**
     * inserts the value after the node with given index
     * TC: O(1)
     */

    if (beforeNode == tail) {
      // would work because they both will refer the same object
      append(value);

      return;
    }

    final newNode = Node(value: value);

    // handling the next reference of the current node
    newNode.next = beforeNode.next;
    beforeNode.next = newNode;

    _len++;
  }

  // ------------ INSERTION METHODS: END ----------------

  // ------------ DELETION METHODS: START ----------------

  T? pop() {
    /**
     * deletes and returns the front node
     * TC: O(1)
     */
    final value = head?.value;

    // moving the head forward
    head = head?.next;

    if (isEmpty) {
      tail = null;
    }

    if (value != null) _len--;

    return value;
  }

  T? removeLast() {
    /**
     * Remove last node
     * TC: O(n), because we are traversing using (this[-2]).
     */

    if (head == tail) return pop();

    // at this point we can be sure that there are at least 2 nodes
    // we move the tail to second last
    tail = this[-2]!;

    // get the value from last node
    final value = tail?.next?.value;

    // severe the last node
    tail?.next = null;
    _len--;

    return value;
  }

  T? removeAfter(Node<T> beforeNode) {
    /**
     * removes the node after the given node and
     * returns the value of the deleted node
     * TC: O(1)
     */

    // get the value from next node
    // ? operator will handle if the next node doesn't exist
    final value = beforeNode.next?.value;

    // we update tail if the to be deleted node is the tail
    if (beforeNode.next == tail) {
      tail = beforeNode;
    }

    // severe the next node
    beforeNode.next = beforeNode.next?.next;

    // only decrease length if there was a deletion
    if (value != null) _len--;

    return value;
  }

  // ------------ DELETION METHODS: END ----------------

  Node<T>? operator [](int index) {
    /**
     * index operation
     * TC: O(1)
     */

    // for -ve indexing
    if (index < 0) {
      index += _len;
    }

    var ptr = head;
    var i = 0;

    // we reach to the desired index
    while (i < index && ptr != null) {
      ptr = ptr.next;

      i++;
    }

    return ptr;
  }

  @override
  String toString() {
    if (head == null) return "LL empty";

    return head.toString();
  }

  @override
  Iterator<T> get iterator => _LinkedListIterator(this);
}


class _LinkedListIterator<T> implements Iterator<T> {

  _LinkedListIterator(LinkedList<T> list) : _list = list;

  final LinkedList<T> _list;
  Node<T>? _currentValue;

  @override
  // returns the current value. At start is null and get the first value after moveNext() is called  
  T get current => _currentValue!.value;

  @override
  bool moveNext() {
    // return indicates whether the iterator have next value or not. 

    if (_list.isEmpty) return false;

    // if it is null then we have to initialize it with the head of the list
    // if not null then we move to the next node
    _currentValue = (_currentValue == null) ? _list.head : _currentValue?.next;

    return _currentValue != null; // if it becomes null then we have reached the end
  }

}