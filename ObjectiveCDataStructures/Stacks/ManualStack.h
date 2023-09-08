//
//  ManualStack.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/8/23.
//

/*
 ManualStack has the same interface as IdiomaticStack. It is only their implementations that differ.
 */

#import "LinkedListNode.h"

// Create the manual stack as a child class of NSObject
@interface ManualStack : NSObject

// Push a generic object onto the stack
// Return type: void
// Parameter type: id (pointer to any Objective-C object)
- (void)push:(id)item;

// Pop an item off the top of the stack. Removes an item from the top of the stack.
// Return type: id (pointer to any Objective-C object)
- (id)pop;

// Peek at the item on the top of the stack without removing it.
// Return type: id (pointer to any Objective-C object)
- (id)peek;

// Returns true if stack is empty and false if stack has objects in it
// Return type: BOOL
- (BOOL)isEmpty;

@end
