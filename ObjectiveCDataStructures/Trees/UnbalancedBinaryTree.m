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
        self.root = nil;
    }
    return self;
}

// Returns true if node was successfully added
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
    BOOL nodeAdded = NO;
    // If the root is nil add it as the root
    if (!self.root) {
        self.root = newNode;
        nodeAdded = YES;
    }
    // Otherwise call addNewNodeRecursively:throughCurrentNode: with root as currentNode
    else {
        nodeAdded = [self addNewNodeRecursively:newNode throughCurrentNode:self.root];
    }
    
    if (!nodeAdded) {
        NSLog(@"Error adding new node");
    }
}

typedef NS_ENUM(NSInteger, ChildType) {
    ChildTypeLeft,
    ChildTypeRight,
    ChildTypeNeither // Indicates root
};

- (id)searchForObjectIDRecursively:(NSInteger)objectID throughCurrentNode:(BinaryTreeNode *)currentNode {
    // Compare the current node's objectID to the objectID being looked for. Return the node if it is the correct one
    if (objectID < currentNode.objectID) {
        // If currentNode has a left child call recursively on left child
        if (currentNode.left) {
            return [self searchForObjectIDRecursively:objectID throughCurrentNode:currentNode.left];
        } else {
            return nil;
        }
    } else if (currentNode.objectID == objectID) {
        return currentNode.data;
    } else {
        // If currentNode has a right child call recursively on right child
        if (currentNode.right) {
            return [self searchForObjectIDRecursively:objectID throughCurrentNode:currentNode.right];
        } else {
            return nil;
        }
    }
}

// Print data to the console for given objectID if it exists, otherwise print an error message.
- (void)printDataAtObjectID:(NSInteger)objectID {
    BinaryTreeNode *searchResultData = [self searchForObjectIDRecursively:objectID throughCurrentNode:self.root];
    if (searchResultData) {
        NSLog(@"Data associated with objectID #%ld: %@", objectID, searchResultData);
    } else {
        NSLog(@"No match found for object ID #%ld", objectID);
    }
}

- (BOOL)deleteObjectByID:(NSInteger)objectID {
    // Search the tree for the object
    
        // ObjectID found
        
        // ObjectID not found
    return NO;
}

- (void)printInorderRecursively:(BinaryTreeNode *)currentNode {
    // Call printInorderRecursively on left child
    if (currentNode.left) {
        [self printInorderRecursively:currentNode.left];
    }
        
    // Print the value of the current node
    NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
    
    // Call printInorderRecursively on right child
    if (currentNode.right) {
        [self printInorderRecursively:currentNode.right];
    }
}

- (void)printInorder {
    // Call printInorderRecursively on the root
    [self printInorderRecursively:self.root];
}

- (void)printPreorderRecursively:(BinaryTreeNode *)currentNode {
    // Print the value of the current node
    NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
    
    // Call printPreorderRecursively on left child
    if (currentNode.left) {
        [self printPreorderRecursively:currentNode.left];
    }
    
    // Call printPreorderRecursively on right child
    if (currentNode.right) {
        [self printPreorderRecursively:currentNode.right];
    }
}

- (void)printPreorder {
    // Call printInorderRecursively on the root
    [self printPreorderRecursively:self.root];
}

- (void)printPostorderRecursively:(BinaryTreeNode *)currentNode {
    // Call printPostorderRecursively on left child
    if (currentNode.left) {
        [self printPostorderRecursively:currentNode.left];
    }
    
    // Call printPostorderRecursively on right child
    if (currentNode.right) {
        [self printPostorderRecursively:currentNode.right];
    }
    
    // Print the value of the current node
    NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
}

- (void)printPostorder {
    // Call printPostorderRecursively on the root
    [self printPostorderRecursively:self.root];
}



@end
