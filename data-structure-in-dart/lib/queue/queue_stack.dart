import 'package:data_structure_in_dart/stack/stack.dart';

import 'abstract_queue.dart';

class QueueStack<T> extends Queue<T> {
  /// Uses 2 stacks
  /// enqueues are ALWAYS done on the _takerStack stack
  /// dequeues are ALWAYS done on the _giverStack stack
  /// if the on dequeue the _giverStack stack is empty then we dump
  /// ALL _takerStack stack element to the _giverStack stack

  final Stack<T> _takerStack;
  final Stack<T> _giverStack;

  QueueStack()
      : _giverStack = Stack<T>(),
        _takerStack = Stack<T>();


  /// TC: O(1) Amortized
  @override
  T? dequeue() {
    if (isEmpty) return null;

    if (_giverStack.isEmpty) {
      // dump taker to giver
      _dumpTakerToGiver();
    }

    return _giverStack.pop();
  }

  /// TC: O(1)
  @override
  bool enqueue(T element) {
    _takerStack.push(element);
    return true;
  }

  /// TC: O(1)
  @override
  bool get isEmpty => _giverStack.isEmpty && _takerStack.isEmpty;

  /// TC: O(1)
  @override
  T? get peek {
    if (isEmpty) return null;

    return (_giverStack.isEmpty) ? _takerStack.bottom : _giverStack.peek;
  }

  /// TC: O(n)
  void _dumpTakerToGiver() {
    while (!_takerStack.isEmpty) {
      _giverStack.push(_takerStack.pop());
    }
  }
}
