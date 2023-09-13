//
//  BinaryTreeNode.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

// The nodes are meant to hold any kind of data at the dataObject id pointer and organized via NS

// Holds the object for this BinaryTreeNode
@property (nonatomic, strong) NSInteger *objectID;
@property (nonatomic, strong) id dataObject;

// Holds the pointers to the left and right children
@property (nonatomic, strong) BinaryTreeNode *left;
@property (nonatomic, strong) BinaryTreeNode *right;

// Custom constructor/initializer with objectID and a dataObject as parameters
- (instancetype)initWithObjectID:(NSInteger *)objectID andDataObject:(id)dataObject;


@end
