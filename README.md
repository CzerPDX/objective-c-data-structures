# objective-c-data-structures
This `Objective-C` program implements two stacks that use the same `protocol` (so they both have the same interface):
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


