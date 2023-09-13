//
//  UnbalancedBinaryTree.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import "LinkedListNode.h"
#import "BinaryTreeProtocol.h"

// Create the manual stack as a child class of NSObject
@interface UnbalancedBinaryTree : NSObject <BinaryTreeProtocol>

- (void)addObjectID:(NSInteger)objectID andObjectData:(id)objectData);
- (void)deleteObjectID:(NSInteger)objectID;
- (void)printInorder;
- (void)printPreorder;
- (void)printPostorder;
- (id)searchForObjectID:(NSInteger *)objectID;

@end
