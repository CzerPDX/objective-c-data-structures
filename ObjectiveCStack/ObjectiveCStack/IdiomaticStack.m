//
//  IdiomaticStack.m
//  ObjectiveCStack
//
//  Created by Czer on 9/7/23.
//

#import "IdiomaticStack.h"

// Cass extension for the private data members and methods
@interface IdiomaticStack ()
// Pointer to the mutable array where the stack objects will be stored
@property (nonatomic, strong) NSMutableArray *stackItems;
@end


// IdiomaticStack class' implementation
@implementation IdiomaticStack

// Constructor for the IdiomaticStack class
- (instancetype)init {
    self = [super init];
    if (self) {
        _stackItems = [[NSMutableArray alloc] init];
    }
    return self;
}

// Add a new item to the stack.
// Parameter: newStackItem is a new object to add to the stack
- (void)push:(id)newStackItem {
    // Add the newStackItem to the stack using NSMutableArray's addObject
    [self.stackItems addObject:newStackItem];
}

// Return the item on the top of the stack if it exists and remove it from the stack
- (id)pop {
    // Set lastItem to the item on the top of the stack (if there is one)
    id lastItem = [self.stackItems lastObject];\
    
    // If lastItem has a value (if the stack wasn't empty) remove it from the stack
    if (lastItem) {
        [self.stackItems removeLastObject];
    }
    
    // Return lastItem whether that is a valid object or nothing
    return lastItem;
}

// Return the item on teh top of the stack but do not remove it
- (id)peek {
    return [self.stackItems lastObject];
}

// Return true (YES) if stack is empty or false (NO) is stack is not empty
- (BOOL)isEmpty {
    BOOL isStackEmpty = NO;
    if (![self.stackItems lastObject]) {
        isStackEmpty = YES;
    }
    return isStackEmpty;
}

	
// NOTE: Data members are marked as nonatomic to remove overhead from locking/unlocking as this class is not expected to be used in a parallel processing environment and should only be accessed by one thread at a time.

@end
