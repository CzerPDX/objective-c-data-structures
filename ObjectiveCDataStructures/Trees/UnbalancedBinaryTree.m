//
//  UnbalancedBinaryTree.m
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

/*
 Public functions return void but will output success/failure message and/or print the tree
 Recursive functions are private and listed above the public functions they are called in. They return a BOOL for success/failure
 */

#import "UnbalancedBinaryTree.h"

// Private data members
@interface UnbalancedBinaryTree ()
@property (nonatomic, strong) BinaryTreeNode *root;
@end

// ManualStack methods
@implementation UnbalancedBinaryTree

// Constructor
- (instancetype)init {
    // Initialize the base class and set the return to self
    self = [super init];
    
    // If the initialization of the base class was successful set head to nil
    if (self) {
        _root = nil;
    }
    return self;
}

// Compare the objectID from the current node to the newNode. Lower values go left, higher values go right
// If the values are the same then don't add the node. No duplicates allowed
- (BOOL)addNewNodeRecursively:(BinaryTreeNode *)newNode throughCurrentNode:(BinaryTreeNode *)currentNode {
    // Base cases
    // newNode has lower value and left child is nil
        // Set newNode to left child
        // Return true
    // newNode has higher value and right child is nil
        // Set newNode to right child
        // Return true
    // newNode has same value
        // Return false
    
    // newNode has lower value and left child is not nil
        // call addNewNodeRecursively:throughCurrentNode: with left child as currentNode
    // newNode has higher value and right child is not nil
        // call addNewNodeRecursively:throughCurrentNode: with right child as currentNode
    return YES;
}

- (void)addObjectID:(NSInteger)objectID andObjectData:(id)objectData {
    
}

- (void)deleteObjectID:(NSInteger)objectID {
    
}

- (void)printInorder {
    
}

- (void)printPreorder {
    
}

- (void)printPostorder {
    
}

- (id)searchForObjectID:(NSInteger *)objectID {
    return nil;
}

@end
