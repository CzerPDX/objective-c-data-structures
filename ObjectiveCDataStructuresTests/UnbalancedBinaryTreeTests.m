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

@end
