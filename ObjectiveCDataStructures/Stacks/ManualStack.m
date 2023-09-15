//
//  ManualStack.m
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/8/23.
//

#import "ManualStack.h"

// Private data members
@interface ManualStack ()
@property (nonatomic, strong) LinkedListNode *head;
@end

// ManualStack methods
@implementation ManualStack

// Constructor
- (instancetype)init {
    // Initialize the base class and set the return to self
    self = [super init];
    
    // If the initialization of the base class was successful set head to nil
    if (self) {
        self.head = nil;
    }
    return self;
}

- (void)push:(id)newObject {
    // Create a new LinkedListNode with the incoming NewObject
    LinkedListNode *newNode = [[LinkedListNode alloc] initWithData:newObject];
    
    // Set the current head to the newNode's next
    newNode.next = self.head;
    
    // Set the newNode to head
    self.head = newNode;
}

// Remove the top node from the stack and return the node's objectData. If the stack is empty, return nil
- (id)pop {
    // Set up a pointer to an empty return object and set it to nil
    id retObjectData = nil;
    
    // Grab a pointer to the current head and name it oldHead
    LinkedListNode *oldHead = self.head;
    
    // If the oldHead isn't empty, set the stack's new head to the old head's next and set retObjectData to the oldHead's objectData
    if (oldHead != nil) {
        self.head = self.head.next;
        retObjectData = oldHead.objectData;
    }
    
    // return the object contained in the oldHead (or nil if the Stack is empty)
    return retObjectData;
}

// Return the data from the node at the top of the stack (if it exists) or nil otherwise
- (id)peek {
    // Set up empty return pointer
    id retObjectData = nil;
    
    // If the head of the stack isn't nil, set retObjectData to the head's objectData
    if (self.head != nil) {
        retObjectData = self.head.objectData;
    }
    
    // Return either nil or the object data from the top of the stack
    return retObjectData;
}

// Return true/YES if the stack is empty or false/NO if the stack contains nodes
- (BOOL)isEmpty {
    BOOL isStackEmpty = YES;
    if (self.head != nil) {
        isStackEmpty = NO;
    }
    return isStackEmpty;
}

@end
