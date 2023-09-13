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

// Returns true if node was successfully added by this version or by any previous version
// Compare the objectID from the current node to the newNode. Lower values go left, higher values go right
// If the values are the same then don't add the node and return "NO". No duplicates allowed.
// This function should use tail recursion if it is an option in the compiler (which is why early returns are used here)
- (BOOL)addNewNodeRecursively:(BinaryTreeNode *)newNode throughCurrentNode:(BinaryTreeNode *)currentNode {
    // If the newNode's objectID is lower than currentNode's objectID, go left
    if (newNode.objectID < currentNode.objectID) {
        // If the left child is nil set the current node's left pointer to the new node
        if (!currentNode.left) {
            // Set newNode to left child and return YEStrue
            currentNode.left = newNode;
            return YES;
        }
        // Otherwise, call addNewNodeRecursively:throughCurrentNode with left child as current node
        else {
            return [self addNewNodeRecursively:newNode throughCurrentNode:currentNode.left];
        }
    }
    // If the newNode's objectID is higher than currentNode's objectID, go right
    else if (newNode.objectID > currentNode.objectID) {
        // If the right child is nil set the current node's right pointer to the new node
        if (!currentNode.right) {
            // Set newNode to right child and return YES/true
            currentNode.right = newNode;
            return YES;
        }
        // Otherwise, call addNewNodeRecursively:throughCurrentNode with right child as current node
        else {
            return [self addNewNodeRecursively:newNode throughCurrentNode:currentNode.right];
        }
    }
    
    // If we have gotten here without an early return the currentNode and newNode have the same objectID and the newNode should not be added to the tree so return NO/false (no duplicates)
    return NO;
}

- (void)addObjectByID:(NSInteger)objectID andObjectData:(id)objectData {
    // Create a new BinaryTreeNode with the objectData and objectID
    BinaryTreeNode *newNode = [[BinaryTreeNode alloc] initWithObjectID:objectID andDataObject:objectData];
    BOOL successfullyAddedNewNode = NO;
    // If the root is nil add it as the root
    if (!_root) {
        _root = newNode;
        successfullyAddedNewNode = YES;
    }
    // Otherwise call addNewNodeRecursively:throughCurrentNode: with root as currentNode
    else {
        successfullyAddedNewNode = [self addNewNodeRecursively:newNode throughCurrentNode:_root];
    }
    
    if (successfullyAddedNewNode) {
        NSLog(@"Successfully added new node");
    }
    else {
        NSLog(@"Error adding new node");
    }
}

- (void)deleteObjectByID:(NSInteger)objectID {
    
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
