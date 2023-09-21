//
//  UnbalancedBinaryTreeTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/19/23.
//
#import <XCTest/XCTest.h>
#import "UnbalancedBinaryTree.h"
#import "BaseBinaryTreeTests.h"

@interface UnbalancedBinaryTreeTests : BaseBinaryTreeTests

@end

@implementation UnbalancedBinaryTreeTests

// Override the setup method
- (void)setUp {
    [super setUp];
    self.testBinaryTree = [[UnbalancedBinaryTree alloc] init];
}


// Delete nodes from the unbalanced binary tree

// Below I wrote out the tests that would need to happen to verify that deleting the root works in all scenarios. This is too extensive for me to undertake, so instead I will try to write a randomized test that can apply to all trees and focuses more on putting the tree though a bunch of scenarios and then verifying that it has the correct information afterward.
// Delete root
//      - When it has no children
//      - When it has a left child
//          - And left child is leaf
//          - And left child has left child
//          - And left child has right child
//          - And left child has left and right child
//      - When it has a right child
//          - And right child is leaf
//          - And right child has left child
//          - And right child has right child
//          - And right child has left and right child
//      - When it has both left and right children
//          - And both are leaves
//          - Left child is leaf right child has children
//              - Right child has only left child
//              - Right child has only right child
//              - Right child has both left and right child
//              - Left child has only left child
//              - Left child has only right child
//              - Left child has both left and right child
//          - Right child is a leaf and left child has children
//              - Right child has only left child
//              - Right child has only right child
//              - Right child has both left and right child
//              - Left child has only left child
//              - Left child has only right child
//              - Left child has both left and right child
//          - Both left and right have children
//              - Right has only left child
//                  - Left has only left child
//                  - Left has only right child
//                  - Left has both left and right child
//              - Right has only right child
//                  - Left has only left child
//                  - Left has only right child
//                  - Left has both left and right child
//              - Right has both left and right child
//                  - Left has only left child
//                  - Left has only right child
//                  - Left has both left and right child

@end
