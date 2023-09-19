//
//  BaseTreeTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/19/23.
//

#import "BaseBinaryTreeTests.h"

@implementation BaseBinaryTreeTests

- (void)setUp {
    // self.testStack will be initialized in the subclasses not in this base class
    [super setUp];
}

- (void)tearDown {
    self.testBinaryTree = nil;
    [super tearDown];
}

// Override the testInvocations function for the base class only so tests don't run for the base class.
+ (NSArray *)testInvocations {
    return (self == [BaseBinaryTreeTests class]) ? [NSArray array] : [super testInvocations];
}

// Test the addObjectByID function
// Add when tree is empty
- (void)testAddObjectByIDWhenTreeIsEmpty {
    XCTAssertEqual([self.testBinaryTree addObjectByID:42 andObjectData:@"Test data"], SuccessfullyAdded, @"Adding data to an empty tree did not succeed.");
}
// Add when tree is not empty
- (void)testAddObjectByIDWhenTreeIsNotEmpty {
    XCTAssertEqual([self.testBinaryTree addObjectByID:42 andObjectData:@"Test data"], SuccessfullyAdded, @"Adding data to an empty tree did not succeed.");
    XCTAssertEqual([self.testBinaryTree addObjectByID:16 andObjectData:@"Test data the second."], SuccessfullyAdded, @"Adding data to a non-empty tree did not succeed.");
}
// Add a duplicate to the tree (should fail with specific type FailedAddDuplicate)
- (void)testAddObjectByIDWithDuplicateID {
    XCTAssertEqual([self.testBinaryTree addObjectByID:42 andObjectData:@"Test data"], SuccessfullyAdded, @"Adding data to an empty tree did not succeed.");
    XCTAssertEqual([self.testBinaryTree addObjectByID:42 andObjectData:@"Duplicate ID data"], FailedAddDuplicate, @"Adding duplicate ID to tree should fail with FailedAddDuplicate type, but it did not.");
}

// Delete object by ID


@end
