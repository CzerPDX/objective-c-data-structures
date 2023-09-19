//
//  BinaryTreeProtocol.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, AddResult) {
    SuccessfullyAdded,
    FailedAddError,
    FailedAddDuplicate
};

typedef NS_ENUM(NSInteger, DeleteResult) {
    SuccessfullyDeleted,
    FailedDeleteError,
    SuccessfullyDeletedNotFound // If value is not present return successfully deleted (because it's not in the tree, which is the intended outcome) but not found.
};

// Protocol that defines the interface for all binary trees
@protocol BinaryTreeProtocol <NSObject>

- (AddResult)addObjectByID:(NSInteger)objectID andObjectData:(id)data;
- (DeleteResult)deleteObjectByID:(NSInteger)objectID;
- (void)printInorder;
- (NSMutableArray *)returnDataInOrder;
- (void)printPreorder;
- (void)printPostorder;
- (NSString *)getDataAtObjectID:(NSInteger)objectID;
@end

NS_ASSUME_NONNULL_END
