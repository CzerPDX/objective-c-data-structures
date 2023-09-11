//
//  BaseStackTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/8/23.
//

/*
 BaseStackTests is the base class for the subclasses IdiomaticStackTests and ManualStackTests.
 
 Both Idiomatic and Manual stack tests need to pass the exact same tests the same way even though they are implemented differently. To that end, these tests are created in this base class and each subclass of tests will simply instatiate its own class in setup step.
 */

#import "BaseStackTests.h"

@implementation BaseStackTests

// Set up the state for the start of each test method
- (void)setUp {
    // self.testStack will be initialized in the subclasses not in this base class
    [super setUp];
}

// Clean up the state after the completion of each test method
- (void)tearDown {
    self.testStack = nil;
    [super tearDown];
}

// Because this base class should not be running any of these tests itself (though they should be defined here), I have overriden the behavior of the testInvocations function (only for this base class) to return an empty array. testInvocations returns an array of NSInvocation objects that represent the functions for each test. An empty one should be returned for the base class so that it doesn't run any tests on the base class, only on the child classes.
+ (NSArray *)testInvocations {
    return (self == [BaseStackTests class]) ? [NSArray array] : [super testInvocations];
}


// Testing the isEmpty function
// isEmpty should return true before anything is added
- (void)testIsEmptyWhenStackIsEmpty {
    // Validate that isEmpty is true
    XCTAssertTrue([self.testStack isEmpty], @"Stack should be empty but it is not");
}
// isEmpty should return false after something is added
- (void)testIsEmptyWhenStackIsNotEmpty {
    // Add something to the stack
    [self.testStack push:@1];
    
    // Validate that isEmpty is false
    XCTAssertFalse([self.testStack isEmpty], @"Stack should not be empty but it is");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
