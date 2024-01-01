class Node<T> {
  T value;
  Node<T>? next;


  Node({required this.value, this.next});

  @override
  String toString() {
    // recursive

    if (this.next == null) {
      return '$value --';
    }

    return '$value --> ${next.toString()}';
  }
}