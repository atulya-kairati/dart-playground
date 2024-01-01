

T seeMax<T extends Comparable, E extends Comparable>(Iterable iterable, E Function(T) key) {
  /**
   * Function finds the max element according to the key passed
   * T : type of the element contained in the iterable
   * E : return type of the key
   */

  E m = key(iterable.first);
  T answer = iterable.first;

  for (var e in iterable) {
    E temp = key(e);

    if (temp.compareTo(m) > 0) {
      m = temp;
      answer = e;
    }
  }

  return answer;
}