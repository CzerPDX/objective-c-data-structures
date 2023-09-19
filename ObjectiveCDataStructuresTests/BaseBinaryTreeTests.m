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

// Get data at object ID
// Get data at objectID when tree is empty
- (void)getDataAtObjectIDWhenTreeIsEmpty {
    XCTAssertNil([self.testBinaryTree getDataAtObjectID:42], @"Trying to get data at object id when tree is empty should return nil");
}

// Delete object by ID
// Delete from an empty tree
- (void)testDeleteObjectByIDWhenTreeEmpty {
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeletedNotFound, @"Deleting from tree when tree is empty should return SuccessfullyDeletedNotFound but it did not.");
}

// Delete from a tree where the item exists with no children
- (void)testDeleteObjectByIDWhenIDExistsAlone {
    // Add data to remove
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    
    // Verify that deleting it is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree did not return SuccessfullyDeleted.");
}

// Delete from a tree where the item to delete was added first and then
- (void)testDeleteObjectByIDWhenIDWasAddedFirstThenLowerIDsAdded {
    // First, add the data to remove
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    // Then add some lower-numbered ID data
    [self.testBinaryTree addObjectByID:16 andObjectData:@"Some lower-numbered test data"];
    [self.testBinaryTree addObjectByID:11 andObjectData:@"Some more lower-numbered test data"];
    
    // Then verify that deleting the original data is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree did not return SuccessfullyDeleted.");
}

// Delete from a tree where the item exists at the root with a left child which itself does not have any children
- (void)testDeleteObjectByIDWhenIDWasAddedFirstThenHigherIDsAdded {
    // First, add the data to remove
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    // Then add some higher-numbered ID data
    [self.testBinaryTree addObjectByID:50 andObjectData:@"Some higher-numbered test data"];
    [self.testBinaryTree addObjectByID:51 andObjectData:@"Some more higher-numbered test data"];
    
    // Then verify that deleting the original data is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree did not return SuccessfullyDeleted.");
}

// Delete from a tree where the item exists at the root both left and right children which themselves do not have any children
- (void)testDeleteObjectByIDWhenItemExistsAtRootWithBothChildrenAsLeaves {
    // Add the data to the root
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    // Add data to the right child
    [self.testBinaryTree addObjectByID:50 andObjectData:@"Some test data for right child"];
    // Add data to the left child
    [self.testBinaryTree addObjectByID:16 andObjectData:@"Some test data for left child"];
    
    // Verify that deleting the root is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree when tree is empty should return SuccessfullyDeletedNotFound but it did not.");
}

// Delete from a tree where the item exists at the root with a left child which itself has a left child
- (void)testDeleteObjectByIDWhenItemExistsAtRootWithLeftChild {
    // Add the data to the root
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    // Add data to the left child
    [self.testBinaryTree addObjectByID:16 andObjectData:@"Some test data for left child"];
    // Add data to the left child
    [self.testBinaryTree addObjectByID:16 andObjectData:@"Some test data for left child"];
    
    // Verify that deleting the root is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree when tree is empty should return SuccessfullyDeletedNotFound but it did not.");
}

@end
