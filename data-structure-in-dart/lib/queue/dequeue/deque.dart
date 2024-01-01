abstract class Deque<T> {
  bool get isEmpty;
  T? peek(Direction from);
  bool enqueue(T element, Direction to);
  T? dequeue(Direction from);
}

enum Direction {
  front,
  back,
}
