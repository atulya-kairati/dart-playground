import 'package:data_structure_in_dart/misc/ring_buffer.dart';
import 'package:data_structure_in_dart/queue/abstract_queue.dart';

class QueueRingBuffer<T> extends Queue<T> {

  final RingBuffer<T> _ringBuffer;

  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<T>(length);

  @override
  T? dequeue() {
    return _ringBuffer.read();    
  }

  @override
  bool enqueue(T element) {

    if (_ringBuffer.isFull) return false;

    _ringBuffer.write(element);
    return true;
  }

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  T? get peek => _ringBuffer.peek;

  @override
  String toString() {
    return _ringBuffer.toString();
  }

}