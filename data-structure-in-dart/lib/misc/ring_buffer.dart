class RingBuffer<T> {
  final List<T?> _list;

  var _readPtr = 0;
  var _writePtr = 0;

  // O(n)
  RingBuffer(int length) : _list = List<T?>.filled(length, null);

  bool get isEmpty => _readPtr == _writePtr;

  bool get isFull => _writePtr - _readPtr >= _list.length;

  // O(1)
  void write(T value) {
    if (isFull) {
      /**
       * If this condition is fulfilled then it means (buffer is full)
       * that unread data will overwritten.
       * If we don't want to overwrite data then we can throw an exception.
       * Else if overwriting data is non-issue than we move the read pointer by 1.
       * This will cause the read ptr buffer index to be ahead of write ptr's.
       */

      // throw 'Buffer Full';

      // OR

      _readPtr++;
    }

    _list[getBufferIndex(_writePtr)] = value;
    _writePtr++;
  }

  // O(1)
  T? read() {
    if (isEmpty) {
      // throw 'Empty buffer';
      return null;
    }

    final value = _list[getBufferIndex(_readPtr)];

    _readPtr++;
    return value;
  }

  T? get peek {
    if (isEmpty) return null;

    return _list[getBufferIndex(_readPtr)];
  }

  int getBufferIndex(int ptr) {
    return ptr % _list.length;
  }

  @override
  String toString() {

    final buff = <T?>[];

    for (var ptr = _readPtr; ptr < _writePtr; ptr++) {
      buff.add(_list[getBufferIndex(ptr)]);
    }

    return '<-- ${buff.join(' - ')} <--';
  }
}
