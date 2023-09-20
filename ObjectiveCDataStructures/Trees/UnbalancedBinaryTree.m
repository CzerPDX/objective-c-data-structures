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
- (AddResult)addNewNodeRecursively:(BinaryTreeNode *)newNode throughCurrentNode:(BinaryTreeNode *)currentNode {
    // If the newNode's objectID is lower than currentNode's objectID, go left
    if (newNode.objectID < currentNode.objectID) {
        // If the left child is nil set the current node's left pointer to the new node
        if (!currentNode.left) {
            // Set newNode to left child and return YEStrue
            currentNode.left = newNode;
            return SuccessfullyAdded;
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
            return SuccessfullyAdded;
        }
        // Otherwise, call addNewNodeRecursively:throughCurrentNode with right child as current node
        else {
            return [self addNewNodeRecursively:newNode throughCurrentNode:currentNode.right];
        }
    }
    // If the newNode's objectID is equal to the currentNode's objectID return a duplicate value failure "FailedAddDuplicate"
    else if (newNode.objectID == currentNode.objectID) {
        return FailedAddDuplicate;
    }
    
    // If we have gotten here without an early return the currentNode and newNode have the same objectID and the newNode should not be added to the tree so return FailedAddError (no duplicates)
    return FailedAddError;
}

// Add an object to the binary tree organized by objectID
- (AddResult)addObjectByID:(NSInteger)objectID andObjectData:(id)objectData {
    // Create a new BinaryTreeNode with the objectData and objectID
    BinaryTreeNode *newNode = [[BinaryTreeNode alloc] initWithObjectID:objectID andDataObject:objectData];
    AddResult addObjectByIDResult;
    // If the root is nil add it as the root
    if (!self.root) {
        self.root = newNode;
        addObjectByIDResult = SuccessfullyAdded;
    }
    // Otherwise call addNewNodeRecursively:throughCurrentNode: with root as currentNode
    else {
        addObjectByIDResult = [self addNewNodeRecursively:newNode throughCurrentNode:self.root];
    }
    
    return addObjectByIDResult;
}

// Returns the object in the tree that is at the objectID node if one exists. Otherwise it returns nil.
- (id)searchRecursivelyForObjectID:(NSInteger)objectID throughCurrentNode:(BinaryTreeNode *)currentNode {
    
    // Compare the current node's objectID to the objectID being looked for. Return the data if it is the correct one
    if (objectID < currentNode.objectID) {
        // If currentNode has a left child call recursively on left child. Otherwise, return nil.
        if (currentNode.left) {
            return [self searchRecursivelyForObjectID:objectID throughCurrentNode:currentNode.left];
        } else {
            return nil;
        }
    } else if (currentNode.objectID == objectID) {
        // Return the data at the node that matches the requested objectID
        return currentNode.data;
    } else {
        // If currentNode has a right child call this function recursively on right child. Otherwise, return nil;
        if (currentNode.right) {
            return [self searchRecursivelyForObjectID:objectID throughCurrentNode:currentNode.right];
        } else {
            return nil;
        }
    }
}

// Print data to the console for given objectID if it exists, otherwise print an error message.
- (NSString *)getDataAtObjectID:(NSInteger)objectID {
    return [self searchRecursivelyForObjectID:objectID throughCurrentNode:self.root];
}

typedef NS_ENUM(NSInteger, ChildType) {
    ChildTypeLeft,
    ChildTypeRight,
    ChildTypeRoot // Indicates root
};

// Returns the inorder successor from the right-tree
/*
 Cases:
 Successor has:
 - right child
    - If successor is left child
        - Set parent left to successor's right child
    - If successor is right child
        - Set parent right to successor's right child
 - no children
     - If successor is left child
        - Set parent left to nil
     - If successor is right child
        - Set parent right to nil
 
 If the successor has no children the parent's pointer can still just point to the successor's pointers because it should also be nil. So I basically always want to set the parent pointer to the right child.
 */
- (BinaryTreeNode *)inorderSuccessorFromRightTree:(BinaryTreeNode *)currentNode andAdjustParentWhereRemoved:(BinaryTreeNode *)parentNode byChildType:(ChildType)childType {
    // If there is a left child this isn't the inorder successor
    if (currentNode.left) {
        // Recurse left
        return [self inorderSuccessorFromRightTree:currentNode.left andAdjustParentWhereRemoved:currentNode byChildType:ChildTypeLeft];
    }
    // If there is no left child then this is the inorder successor
    else {
        // Whether or not the successor has a right child, the pointer that once led to this currentNode from the parent can be set to the currentNode's right child.
        // If there is another node at the end of that pointer it will set the parent pointer to that node as it should.
        // If it is set to nil this will set the parent poitner to nil as it should. Voila!
        
        // Adjust the parentNode's pointers
        if (childType == ChildTypeLeft) {
            parentNode.left = currentNode.right;
        } else {
            parentNode.right = currentNode.right;
        }
        // Set currentNode's left and right to nil
        currentNode.left = nil;
        currentNode.right = nil;
        return currentNode;
    }
}

// Replace the currentNode with its inorder successor
-(BOOL)replaceWithInorderSuccessor:(BinaryTreeNode *)currentNode andAdjustParentWhereRemoved:(BinaryTreeNode *)parentNode byChildType:(ChildType)childType {
    
    // If the current node has a right child then get the inorder successor from the right sub-tree
    if (currentNode.right) {
        // Call the function that returns the inorder Successor node and cleans up the parent nodes child pointer that points to it.
        BinaryTreeNode *inorderSuccessor = [self inorderSuccessorFromRightTree:currentNode.right andAdjustParentWhereRemoved:currentNode byChildType:ChildTypeRight];
        
        // NOTE: It's not necessary to check here if the successor is the currentNode.right because parent pointer should have been set to nil already in the currentNode when it was found if so there should never be any feedback loops.
        
        // Set the successor's left and right children to the currentNode's left and right children
        inorderSuccessor.left = currentNode.left;
        inorderSuccessor.right = currentNode.right;
        
        // Then set the parent pointer depending on the child type
        if (childType == ChildTypeLeft) {
            parentNode.left = inorderSuccessor;
        } else if (childType == ChildTypeRight) {
            parentNode.right = inorderSuccessor;
        } else {
            self.root = inorderSuccessor;
        }
    } else if (currentNode.left) {
        // If there is no right child but there is a left one just replace the current node with its left child
        
        if (childType == ChildTypeLeft) {
            parentNode.left = currentNode.left;
        } else if (childType == ChildTypeRight) {
            parentNode.right = currentNode.left;
        } else {
            self.root = currentNode.left;
        }
    } else {
        // If there is no left or right child then just set the parent pointer to nil to release the memory
        if (childType == ChildTypeLeft) {
            parentNode.left = nil;
        } else if (childType == ChildTypeRight) {
            parentNode.right = nil;
        } else {
            self.root = nil;
        }
    }
    
    // Eventually would like to update this with actual error handling which will mean this will not just return YES, but, for now, if the software gets to this line it is assumed to have successfully replaced the currentNode with its inorder successor
    return YES;
}

// Find node to delete by its objectID
-(DeleteResult)findNodeToDeleteByID:(NSInteger)objectID throughCurrentNode:(BinaryTreeNode *)currentNode andAdjustParent:(BinaryTreeNode *)parentNode byChildType:(ChildType)childType {
    
    // If the currentNode is not nil
    if (currentNode) {
        // if less, go left. If more, go right. If equal, begin removal processs. If non-existent return NO
        if (objectID < currentNode.objectID) {
            // Continue searching down left branch
            return [self findNodeToDeleteByID:objectID throughCurrentNode:currentNode.left andAdjustParent:currentNode byChildType:ChildTypeLeft];
        } else if (objectID > currentNode.objectID) {
            // Continue searching down right branch
            return [self findNodeToDeleteByID:objectID throughCurrentNode:currentNode.right andAdjustParent:currentNode byChildType:ChildTypeRight];
        } else {
            // Found objectID to remove. Begin removal process
            [self replaceWithInorderSuccessor:currentNode andAdjustParentWhereRemoved:parentNode byChildType:childType];
                
            return SuccessfullyDeleted;
        }
    }
    // If the currentNode is nil that means the objectID wasn't found in the tree
    else {
        return SuccessfullyDeletedNotFound;
    }
}

// Remove an object from the tree by its object ID
- (DeleteResult)deleteObjectByID:(NSInteger)objectID {
    return [self findNodeToDeleteByID:objectID throughCurrentNode:self.root andAdjustParent:nil byChildType:ChildTypeRoot];
}

// Print the tree inorder
- (void)printInorderRecursively:(BinaryTreeNode *)currentNode {
    // If the currentNode is not nil
    if (currentNode) {
        // Call printInorderRecursively on left child
        [self printInorderRecursively:currentNode.left];
        
        // Print the value of the current node
        NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
        
        // Call printInorderRecursively on right child
        [self printInorderRecursively:currentNode.right];
    }
}
- (void)printInorder {
    // Call printInorderRecursively on the root
    [self printInorderRecursively:self.root];
}

// Adds data to the parameter retArray in order. Array is passed by reference so data is simply added at the correct place in the recursive tree rather than returning an array recursively which would be much more intensive computationally
- (void)addDataToReturnArray:(NSMutableArray *)retArray recursively:(BinaryTreeNode *)currentNode {
    // If the currentNode is not nil
    if (currentNode) {
        // First go left
        [self addDataToReturnArray:retArray recursively:currentNode.left];
        
        // Then add the data from the currentNode to the array
        [retArray addObject:currentNode.data];
        
        // Then go right
        [self addDataToReturnArray:retArray recursively:currentNode.right];
    }
}

// Returns an NSArray of data from the tree inorder
- (NSMutableArray *)returnDataInOrder {
    NSMutableArray *retData = [[NSMutableArray alloc] init];
     [self addDataToReturnArray:retData recursively:self.root];
    
    return retData;
}

// Print the tree preorder
- (void)printPreorderRecursively:(BinaryTreeNode *)currentNode {
    // If the currentNode is not nil
    if (currentNode) {
        // Print the value of the current node
        NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
        
        // Call printPreorderRecursively on left child
        [self printPreorderRecursively:currentNode.left];
        
        // Call printPreorderRecursively on right child
        [self printPreorderRecursively:currentNode.right];
    }
}
- (void)printPreorder {
    // Call printInorderRecursively on the root
    [self printPreorderRecursively:self.root];
}

// Print the tree postorder
- (void)printPostorderRecursively:(BinaryTreeNode *)currentNode {
    // If the currentNode is not nil
    if (currentNode) {
        // Call printPostorderRecursively on left child
        [self printPostorderRecursively:currentNode.left];
        
        // Call printPostorderRecursively on right child
        [self printPostorderRecursively:currentNode.right];
        
        // Print the value of the current node
        NSLog(@"%ld: %@ ", currentNode.objectID, currentNode.data);
    }
}
- (void)printPostorder {
    // Call printPostorderRecursively on the root
    [self printPostorderRecursively:self.root];
}

@end
