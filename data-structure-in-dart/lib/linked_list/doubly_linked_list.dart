class DoublyLinkedList<T> {
  BiNode<T>? head, tail;
  int _len = 0;

  bool get isEmpty => head == null;

  int get length => _len;

  // ------------ INSERTION METHODS: START ----------------

  void push(T value) {
    /**
     * Pushes the value at the front of the DLL
     * TC: O(1)
     */

    final node = BiNode(value: value);
    _len++;

    if (isEmpty) {
      head = node;
      tail = node;

      return;
    }

    head!.prev = node;
    node.next = head;
    head = node;
  }

  void append(T value) {
    /**
     * Appends the value at the end of the LL
     * TC: O(1)
     */

    if (isEmpty) {
      push(value);
      return;
    }

    final node = BiNode(value: value);
    _len++;

    node.prev = tail;
    tail!.next = node;
    tail = node;
  }

  void insertAfter(T value, BiNode<T> beforeNode) {
    /**
     * inserts the value after the node with given index
     * TC: O(1)
     */

    // tail
    if (beforeNode.next == null) {
      append(value);
      return;
    }

    final node = BiNode(value: value);
    _len++;

    final nextNode = beforeNode.next!;

    // making connection with the next node
    node.next = nextNode;
    nextNode.prev = node;

    // making connection with the before node
    node.prev = beforeNode;
    beforeNode.next = node;
  }

  // ------------ INSERTION METHODS: END ----------------

  // ------------ DELETION METHODS: START ----------------

  T? pop() {
    /**
     * deletes and returns the front node
     * TC: O(1)
     */
    final value = head?.value;

    // means head exists
    if (value != null) {
      final deletedNode = head!;

      head = deletedNode.next;
      deletedNode.next = null;
      head?.prev = null;

      // empty -> head is null -> there was only one element
      if (isEmpty) tail = null;

      _len--;
    }

    return value;
  }

  T? removeLast() {
    /**
     * Remove last node
     * TC: O(1)
     */

    final value = tail?.value;

    // tail exists
    if (value != null) {
      final prevNode = tail!.prev;
      
      tail!.prev = null;
      prevNode?.next = null;
      tail = prevNode;

      // means there was only 1 element and now DLL is empty
      if (tail == null) head = null;

      _len--;
    }

    return value;
  }

  // ------------ DELETION METHODS: END ----------------

  @override
  String toString() {
    if (isEmpty) {
      return 'Empty DLL';
    }

    return head.toString();
  }
}

class BiNode<T> {
  T value;
  BiNode<T>? next, prev;

  BiNode({required this.value, this.prev, this.next});

  @override
  String toString() {
    String prevHelper(BiNode? node) {
      if (node?.prev == null) {
        return '-- ${node?.value}';
      }

      return '${prevHelper(node?.prev)} <--> ${node?.value}';
    }

    String nextHelper(BiNode? node) {
      if (node?.next == null) {
        return '${node?.value} --';
      }

      return '${node?.value} <--> ${nextHelper(node?.next)}';
    }

    return '${prevHelper(this)} <--> ${nextHelper(this.next)}';
  }
}
