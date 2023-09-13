//
//  BinaryTreeProtocol.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Results of tree operations are defined as enums for clarity

// Results when adding to the binary trees
typedef NS_ENUM(NSInteger, BinaryTreeAddObjectIDResult) {
    BinaryTreeAddObjectIDResultSuccess,
    BinaryTreeAddObjectIDResultFailure,
    BinaryTreeAddObjectIDResultAlreadyExists
};

// Results when deleting from binary trees
typedef NS_ENUM(NSInteger, BinaryTreeDeleteObjectIDResult) {
    BinaryTreeDeleteObjectIDResultSuccess,
    BinaryTreeDeleteObjectIDResultFailure,
    BinaryTreeDeleteObjectIDesultDoesNotExist
}

// Protocol that defines the interface for all binary trees
@protocol BinaryTreeProtocol <NSObject>

- (BinaryTreeAddObjectIDResult)addObjectID:(NSInteger)objectID andObjectData:(id)objectData);
- (BinaryTreeDeleteObjectIDResult)deleteObjectID:(NSInteger)objectID;
- (void)printInorder;
- (void)printPreorder;
- (void)printPostorder;
- (id)searchForObjectID:(NSInteger *)objectID;
@end

NS_ASSUME_NONNULL_END
