
abstract class AbstractStack<T> {
  void push(T element);
  T pop();
  T get peek;
  bool get isEmpty;
}