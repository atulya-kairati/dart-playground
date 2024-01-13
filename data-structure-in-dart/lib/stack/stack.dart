import 'package:data_structure_in_dart/stack/abstract_stack.dart';
import 'package:data_structure_in_dart/utils/iterator_utils.dart';

class Stack<T> extends AbstractStack<T> {
  Stack() : _storage = <T>[];

  Stack.from(Iterable<T> iterable) : _storage = iterable.toList();

  final List<T> _storage;

  @override
  void push(T element) {
    _storage.add(element);
  }

  @override
  T pop() {
    return _storage.removeLast();
  }

  @override
  T get peek => _storage.last;

  T get bottom => _storage.first;

  @override
  bool get isEmpty => _storage.isEmpty;

  bool contains(T element) => _storage.contains(element);

  @override
  String toString() {
    List<String> reprList = _storage.map((e) => e.toString()).toList();

    String maxE = seeMax<String, int>(reprList, (s) => s.length);
    int width = maxE.length + 2;

    String str = '';

    for (var e in reprList.reversed) {
      int diff = width - e.length;

      int leftPad = diff ~/ 2;

      str += "|${' ' * leftPad}$e${' ' * (diff - leftPad)}|\n";
    }

    str += '+${'-' * width}+\n';
    return str;
  }
}
