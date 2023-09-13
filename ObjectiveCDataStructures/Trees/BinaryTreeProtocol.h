//
//  BinaryTreeProtocol.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Protocol that defines the interface for all binary trees
@protocol BinaryTreeProtocol <NSObject>

- (void)addObjectID:(NSInteger)objectID andObjectData:(id)objectData;
- (void)deleteObjectID:(NSInteger)objectID;
- (void)printInorder;
- (void)printPreorder;
- (void)printPostorder;
- (id)searchForObjectID:(NSInteger *)objectID;
@end

NS_ASSUME_NONNULL_END
