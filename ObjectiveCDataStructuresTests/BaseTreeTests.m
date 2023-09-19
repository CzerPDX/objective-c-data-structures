//
//  BaseTreeTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/19/23.
//

#import "BaseTreeTests.h"

@implementation BaseTreeTests

- (void)setUp {
    // self.testStack will be initialized in the subclasses not in this base class
    [super setUp];
}

- (void)tearDown {
    self.testTree = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

// Override the testInvocations function for the base class only so tests don't run for the base class.
+ (NSArray *)testInvocations {
    return (self == [BaseTreeTests class]) ? [NSArray array] : [super testInvocations];
}


- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
