//
//  Stack.m
//  ObjectiveCStack
//
//  Created by Czer on 9/7/23.
//

#import <Foundation/Foundation.h>

// Define the interface for the stack data structure
@interface Stack : NSObject

/*
 Time complexity for a stack (worst and average case are the same for a stack)
     Access     O(1)    - Accesses from the top (peek), no specific element access
     Search     N/A     - Don't use a stack if you need to search
     Insertion  O(1)    - Inserts at the top, no specific element insert
     Deletion   O(1)    - Deletes from the top, no specific element delete
 */

// Push a generic object onto the stack
/*
 Return type: void
 
 Parameters:
    item
        datatype: id
        Used id type so the stack can hold any type of object as id is the generic object type in objective c
 */
- (void)push:(id)item;

// Pop an item off the top of the stack. Removes item from stack
/*
 Return type: id
 */
- (id)pop;

// Peek at the item on the top of the stack without removing it
/*
 Return type: id
 */
- (id)peek;

// Returns true if stack is empty and false if stack has objects in it
/*
 Return type: BOOL
 */
- (BOOL)isEmpty;

@end
