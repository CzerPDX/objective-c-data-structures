//
//  IdiomaticStackTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/11/23.
//

#import <XCTest/XCTest.h>
#import "IdiomaticStack.h"
#import "BaseStackTests.h"

@interface IdiomaticStackTests : BaseStackTests

@end

@implementation IdiomaticStackTests

// Override the setup method
- (void)setUp {
    [super setUp];
    self.testStack = [[IdiomaticStack alloc] init];
}

@end
