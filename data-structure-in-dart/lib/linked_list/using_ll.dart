import 'package:data_structure_in_dart/linked_list/node.dart';

import 'linked_list.dart';

// print a linked list is reverse
void printLLReverse<T>(LinkedList<T> ll) {
  // helper method so we can use node
  void helper(Node<T>? ptr) {
    if (ptr == null) return;

    helper(ptr.next);
    print(ptr.value);
  }

  helper(ll[0]);
}

// Find mid element (mid = length ~/ 2)
T getMid<T>(LinkedList<T> ll) {
  int mid = ll.length ~/ 2;

  return ll[mid]!.value;
}

// Reverse a linked list in place
void reverseLL<T>(LinkedList<T> ll) {
  final oldHead = ll.head!;
  var ptr = ll.head?.next;

  while (ptr != null) {
    final t = ptr;
    ptr = ptr.next;
    t.next = ll.head;
    ll.head = t;
  }

  // remove circular referencing
  oldHead.next = null;
}

// remove all duplicate elements
void removeDuplicates<T>(LinkedList<T> ll) {
  if (ll.isEmpty) return;

  var ptr = ll.head;

  final elementSet = <T>{ptr!.value};

  while (ptr?.next != null) {
    final next = ptr?.next;

    // if next value is present in the set then skip it
    if (elementSet.contains(next?.value)) {
      ptr?.next = next?.next;
      continue;
    }

    if (next != null) elementSet.add(next.value);

    ptr = ptr?.next;
  }
}
