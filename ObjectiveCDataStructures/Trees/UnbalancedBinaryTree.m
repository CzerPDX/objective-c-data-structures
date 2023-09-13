//
//  UnbalancedBinaryTree.m
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

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


- (BOOL)addObjectIDRecursive:(BinaryTreeNode *)newNode {
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
