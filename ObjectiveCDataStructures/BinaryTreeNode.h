//
//  BinaryTreeNode.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/12/23.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject

// These properties are public as a node will function more like a struct than a real class that manages its own data members

// Holds the object for this BinaryTreeNode
@property (nonatomic, strong) id objectData;

// Holds the pointers to the left and right children
@property (nonatomic, strong) BinaryTreeNode *left;
@property (nonatomic, strong) BinaryTreeNode *right;

// Custom constructor/initializer with an object as a parameter
- (instancetype)initWithData:(id)objectData;

@end
