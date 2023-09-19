//
//  BaseTreeTests.h
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/19/23.
//

#import <XCTest/XCTest.h>
#import "BinaryTreeProtocol.h"

@interface BaseTreeTests : XCTestCase
// Base class will assume that the tree is an object of type id that uses the BinaryTreeProtocol
@property (nonatomic, strong) id<BinaryTreeProtocol> testTree;
@end
