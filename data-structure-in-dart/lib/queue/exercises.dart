import 'package:data_structure_in_dart/queue/queue_ring_buffer.dart';

extension BoardGameManager<T> on QueueRingBuffer<T> {
  T? get nextPlayer {
    final player = dequeue();
    if (player != null) enqueue(player);
    return player;
  }
}