//
//  BinaryTreeNode.m
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

- (instancetype)initWithObjectID:(NSInteger)objectID andDataObject:(id)data {
    // Initialize the parent class/superclass and set it as self
    self = [super init];
    // If parent class/superclass was successfully initialized, set objectData and children to incoming objectData and nil, respectively
    if (self) {
        self.objectID = objectID;
        self.data = data;
        self.left = nil;
        self.right = nil;
    }
    // Return the instance of the BinaryTreeNode
    return self;
}

@end
