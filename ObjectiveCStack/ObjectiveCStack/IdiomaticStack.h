//
//  IdiomaticStack.h
//  ObjectiveCStack
//
//  Created by Czer on 9/7/23.
//

/*
 The IdiomaticStack class is built in a way that uses the tools available to me in Objective-C to make implementing this data structure easier (NSMutableArray).
 */

#import <Foundation/Foundation.h>

// Define the interface for the stack data structure
@interface IdiomaticStack : NSObject



// Push a generic object onto the stack
/*
 Return type: void
 
 Parameters:
    item
        datatype: id
        Used id type so the stack can hold any type of object as id is the generic object type in objective-c
 */
- (void)push:(id)item;

// Pop an item off the top of the stack. Removes an item from the top of the stack.
/*
 Return type: id
    Returns the object popped off the stack
 */
- (id)pop;

// Peek at the item on the top of the stack without removing it.
/*
 Return type: id
    Returns a reference to the item on the top of the stack.
 */
- (id)peek;

// Returns true if stack is empty and false if stack has objects in it
/*
 Return type: BOOL
 */
- (BOOL)isEmpty;

@end
