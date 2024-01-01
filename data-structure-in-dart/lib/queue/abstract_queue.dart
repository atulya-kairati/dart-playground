abstract class Queue<T> {
  bool enqueue(T element);
  T? dequeue();
  bool get isEmpty;
  T? get peek;
}