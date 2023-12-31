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

- (AddResult)addObjectByID:(NSInteger)objectID andObjectData:(id)objectData;
- (DeleteResult)deleteObjectByID:(NSInteger)objectID;
- (void)printInorder;
- (NSMutableArray *)returnDataInOrder;
- (void)printPreorder;
- (void)printPostorder;
- (NSString *)getDataAtObjectID:(NSInteger)objectID;

@end
