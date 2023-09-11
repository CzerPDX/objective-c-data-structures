# objective-c-data-structures
A series of data structures I'm creating to start learning `Objective-C` using `Xcode` as an IDE in a `MacOS` environment.

## Approach to each Data Structure
Each data structure will have two versions:

### Idiomatic version
Utilizes Objective-C's built-in features for efficient data management, helping me grasp the language's standard practices.

### Manual version
Constructs the data structures from scratch (without delving into C++ territory) and "reinvents the wheel" a bit so I can get a deeper dive into Objective-C fundamentals.

### Protocols
In addition, each data structure will have a `protocol` to keep their interfaces aligned with one another.

### Testing
Testing will be done using `Xcode`'s [`XCTest` framework](https://developer.apple.com/documentation/xctest).

## Data Structures Included

### General/Multipurpose
Nodes or other general purpose parts that are reused in multiple data structures.

#### LinkedListNode
The `LinkedListNode` class holds the data for singly-linked list nodes. This class is built more akin to a C++ `struct` rather than a normal class, as it does not manage its own data members/properties (they are public/declared in the header).

### Stacks
These stacks work in a standard way. 
- Follows LIFO (last in, first out)
- There is no search functionality.

#### `IdiomaticStack`
The implementation of this stack makes use of the `NSMutableArray` class and imitates the functionality of a stack without manually managing a head pointer or creating any kind of node class

#### `ManualStack`
The implementation uses a `head` poitner to the start of a linked list (uses the `LinkedListNode` class). Adding and removing items from the stack is done manually and objects are returned after being grabbed from within the node at the head.

### Queues
Placeholder for queues section

### Hash Tables
Placeholder for hash tables section

## Development Environment
Due to the constraints of developing on a late 2012 iMac, some of my code may incorporate older practices or APIs. For clarity and transparency, I've outlined my development environment details below.

### Clang Compiler Version
```
Apple clang version 12.0.0 (clang-1200.0.32.29)
Target: x86_64-apple-darwin19.6.0
Thread model: posix
```

### Xcode version
```
Version 12.4 (12D4e)
```

### Operating System
```
OSX Catalina 10.15.7
```


