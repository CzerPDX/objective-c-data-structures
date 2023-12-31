# objective-c-data-structures
This `Objective-C` program implements two data structures: stacks and binary trees. It was developed in a `macOS` environment using the `Xcode` IDE.

## Stacks
There are two stacks implemented in `objective-c-data-structures` and both use the same `protocol` to standaridze their interfaces:
```
@protocol StackProtocol <NSObject>

- (void)push:(id)item;
- (id)pop;
- (id)peek;
- (BOOL)isEmpty;

@end
```

### IdiomaticStack
The first stack (called `IdiomaticStack`) uses `NSMutableArray` and that object's methods such as `addObject`, `removeLastObject`, and `lastObject` to essentially mimic the functionality of a stack.  

### ManualStack
The second stack (called `ManualStack`) uses a `LinkedListNode` class that I wrote to hold `id`-type-data and implements the functions of the stack more manually. It extend Objective-C's `NSObject` NS classes and uses Objective-C's memory management (via `autoreleasepool`) rather than C++'s more manual memory management.

### Testing
I also implemented a test for these stacks that uses `XCTest`. I created a base class called `BaseStackTests` that overrides the `testInvocations` method of `XCTestCase` so that the base class does not call its own test functions. This is important because `testStack` (the instance of whatever stack is being tested) is only initialized in two subclasses: `IdiomaticStackTests` and `ManualStackTests`. `TestStack` (the object that holds whatever stack is being tested) is expected to adhere to the `StackProtocol` that can be found in `StackProtocol.h`. In this way I was able to write a single set of tests for both classes.


## Binary Trees
All binary trees that are added use the same `protocol`:
```
@protocol BinaryTreeProtocol <NSObject>

- (void)addObjectID:(NSInteger)objectID andObjectData:(id)objectData);
- (void)deleteObjectID:(NSInteger)objectID;
- (void)printInorder;
- (void)printPreorder;
- (void)printPostorder;
- (id)searchForObjectID:(NSInteger *)objectID;
@end
```
All trees also use the same `BinaryTreeNode` class which consists of four data members:
- **`objectID`**: a `NSInteger` datatype that holds the objects ID. This is the data that organizes the binary tree
- **`data`**: a `NSString` datatype that holds the objects ID. (This could be replaced in a subclassed node class with some other kind of data, but for now a string will be fine)
- **`left`** and **`right`**: pointers to other `BinaryTreeNode` objects (left and right children)

So far, only one binary tree is in-progress (`UnbalancedBinaryTree`) (though more are planned and this README should be updated as they're added)

### UnbalancedBinaryTree
This is the simplest binary tree. Nodes are added as needed and the tree is not balanced. This means that in the worst-case scenario this has the same structure as a linear linked list with extra overhead, but will serve as a first step before doing some self-balancing binary trees (such as `AVL` or `red-black`).


### Testing
Testing for the trees is structured similarly to testing for the stacks. There is a `BaseBinaryTreeTests` class where the tests are defined using the protocol that all trees should follow. Though there are no other tree types except `UnbalancedBinaryTree` as of the time of this writing, if other trees require additional tests that are unique to their structure, they can be added to their respective subclass tests.

# Development Environment
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


