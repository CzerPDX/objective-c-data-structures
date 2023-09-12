//
//  BaseStackTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/8/23.
//

/*
 BaseStackTests is the base class for the subclasses IdiomaticStackTests and ManualStackTests.
 
 Both Idiomatic and Manual stack tests need to pass the exact same tests the same way even though they are implemented differently. To that end, these tests are created in this base class and each subclass of tests will simply instatiate its own class in setup step.
 
 Note: Testing data structures can be difficult because using other functions that govern the data structure are usually required to validate the behavior. Due to this, some of these tests may behave a bit more like functional tests rather than unit tests.
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

// Because this base class should not be running any of these tests itself (though they should be defined here), I have overriden the behavior of the testInvocations function (only for this base class) to return an empty array.
// Usually testInvocations returns an array of NSInvocation objects that represent the functions for each test. An empty one should be returned for the base class so that it doesn't run any tests on the base class.
+ (NSArray *)testInvocations {
    return (self == [BaseStackTests class]) ? [NSArray array] : [super testInvocations];
}


// isEmpty
// isEmpty should return true before anything is added
- (void)testIsEmptyWhenStackIsEmpty {
    // Validate that isEmpty is true
    XCTAssertTrue([self.testStack isEmpty], @"Stack should be empty.");
}
// isEmpty should return false after something is added
- (void)testIsEmptyWhenStackIsNotEmpty {
    // Add something to the stack
    [self.testStack push:@1];
    
    // Validate that isEmpty is false
    XCTAssertFalse([self.testStack isEmpty], @"Stack should not be empty.");
}


// peek
// Peek should return nil when stack is empty
- (void)testPeekWhenStackIsEmpty {
    XCTAssertNil([self.testStack peek], @"Peek should be nil when stack is empty.");
}
// Peek should return the data added to the stack last when not empty and not be empty after peeking
- (void)testPeekWhenStackIsNotEmpty {
    // Create a test string and push it onto to the stack
    NSString *testString = @"Test string content";
    [self.testStack push:testString];
    
    // Verify that the test string is returned from peek and that the stack is not empty after peeking
    XCTAssertEqual([self.testStack peek], testString, @"Peek did not return the test string");
    XCTAssertFalse([self.testStack isEmpty], @"Stack should not be empty after peek");
}


// push
// When pushing to an empty stack it should no longer be empty afterward and peek should show the correct data. Push should continue this behavior even if more items are pushed onto the stack.
- (void)testPush {
    // Create a test string and push it onto to the stack
    NSString *testItemOne = @"Test string content";
    [self.testStack push:testItemOne];
    
    // Validate that isEmpty is false and that the data matches
    XCTAssertFalse([self.testStack isEmpty], @"Stack should not be empty after pushing data to it.");
    XCTAssertEqual([self.testStack peek], testItemOne, @"Push did not place the correct data on the stack.");
    
    // Add a new piece of data to the stack and check that it is at the head when checked
    NSNumber *testItemTwo = @42;
    [self.testStack push:testItemTwo];
    XCTAssertFalse([self.testStack isEmpty], @"Stack should not be empty after pushing the second piece of data to it.");
    XCTAssertEqual([self.testStack peek], testItemTwo, @"Push did not place the correct data on the stack after adding the second piece of data");
}


// pop
// When trying to pop an empty stack, nil should be returned.
- (void)testPopWhenStackIsEmpty {
    // Validate that pop returns nil on empty stack
    XCTAssertNil([self.testStack pop], @"Pop should return nil if stack is empty");
}
// When trying to pop a stack with one item in it the item should be returned and the stack should be empty afterward
- (void)testPopWhenStackHasOneItem {
    // Add a single item to the stack
    NSNumber *testNumber = @42;
    [self.testStack push:testNumber];
    
    // Pop the single item off the stack and validate that its data matches the data added and that the stack is now empty.
    XCTAssertEqual([self.testStack pop], testNumber, "Pop should return data last added to the stack.");
    XCTAssertTrue([self.testStack isEmpty], "Stack should be empty after popping off final item.");
}
// When trying to pop a stack with multiple items in it, the stack should return items in reverse order (LIFO) that they were added and then be empty after
- (void) testPopWhenStackHasMultipleItems {
    // Add three items to the stack
    NSNumber *testItemOne = @42;
    NSString *testItemTwo = @"This is a test string.";
    NSNumber *testItemThree = @3;
    [self.testStack push:testItemOne];
    [self.testStack push:testItemTwo];
    [self.testStack push:testItemThree];
    
    // Verify the items pop off in reverse order and that the stack is empty after
    XCTAssertEqual([self.testStack pop], testItemThree, "Incorrect value popped off the stack");
    XCTAssertEqual([self.testStack pop], testItemTwo, "Incorrect value popped off the stack");
    XCTAssertEqual([self.testStack pop], testItemOne, "Incorrect value popped off the stack");
    XCTAssertTrue([self.testStack isEmpty], "Stack should be empty after popping off all items");
}

@end
