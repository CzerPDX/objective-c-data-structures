//
//  UnbalancedBinaryTree.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import "BinaryTreeNode.h"
#import "BinaryTreeProtocol.h"

// Create the manual stack as a child class of NSObject
@interface UnbalancedBinaryTree : NSObject <BinaryTreeProtocol>

- (void)addObjectByID:(NSInteger)objectID andObjectData:(id)objectData;
- (void)deleteObjectByID:(NSInteger)objectID;
- (void)printInorder;
- (void)printPreorder;
- (void)printPostorder;
- (id)searchForObjectID:(NSInteger *)objectID;

@end
