//
//  BaseStackTests.h
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/11/23.
//

#import <XCTest/XCTest.h>
#import "StackProtocol.h"

@interface BaseStackTests : XCTestCase
// Base class will assume that the stack is an object of type  id that uses the StackProtocol
@property (nonatomic, strong) id<StackProtocol> testStack;
@end
