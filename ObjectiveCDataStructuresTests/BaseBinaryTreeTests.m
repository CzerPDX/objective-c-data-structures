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
    // Set up comparison array and add test data to it in the correct order
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    NSNumber *testData1 = @1;
    [comparisonData addObject:testData1];
    
    // Then add the data to the tree
    XCTAssertEqual([self.testBinaryTree addObjectByID:1 andObjectData:testData1], SuccessfullyAdded, @"Adding data to an empty tree did not succeed.");
    
    // Then, verify that the tree contains the same objects in the comparisonData array
    XCTAssertTrue([comparisonData isEqualToArray:[self.testBinaryTree returnDataInOrder]], @"Data not added to tree correctly");
}

// Add when tree already contains a lower ID than the one being added
- (void)testAddObjectByIDWhenTreeContainsLowerIDs {
    // Set up comparison array and add test data to it in the correct order
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    NSNumber *testData1 = @1;
    [comparisonData addObject:testData1];
    NSNumber *testData2 = @2;
    [comparisonData addObject:testData2];
    
    // Then add the data to the tree
    // Add lower-numbered ID data first, followed by a higher ID
    [self.testBinaryTree addObjectByID:1 andObjectData:testData1];
    XCTAssertEqual([self.testBinaryTree addObjectByID:2 andObjectData:testData2], SuccessfullyAdded, @"Adding data to a non-empty tree did not succeed.");
    
    // Then, verify that the tree contains the same objects in the comparisonData array
    XCTAssertTrue([comparisonData isEqualToArray:[self.testBinaryTree returnDataInOrder]], @"Data not added to tree correctly.");
}

// Add when tree already contains a higher ID than the one being added
- (void)testAddObjectByIDWhenTreeContainsHigherIDs {
    // Set up comparison array and add test data to it in the correct order
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    NSNumber *testData1 = @1;
    [comparisonData addObject:testData1];
    NSNumber *testData2 = @2;
    [comparisonData addObject:testData2];
    
    // Then add the data to the tree
    // Add higher-numbered ID data first, followed by a lower ID
    [self.testBinaryTree addObjectByID:2 andObjectData:testData2];
    XCTAssertEqual([self.testBinaryTree addObjectByID:1 andObjectData:testData1], SuccessfullyAdded, @"Adding data to a non-empty tree did not succeed.");
    
    // Then, verify that the tree contains the same objects in the comparisonData array
    XCTAssertTrue([comparisonData isEqualToArray:[self.testBinaryTree returnDataInOrder]], @"Data not added to tree correctly.");
}

// Add when tree already contains a higher ID and a lower ID than the one being added
- (void)testAddObjectByIDWhenTreeContainsHigherAndLowerIDs {
    // Set up comparison array and add test data to it in the correct order
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    NSNumber *testData1 = @1;
    [comparisonData addObject:testData1];
    NSNumber *testData2 = @2;
    [comparisonData addObject:testData2];
    NSNumber *testData3 = @3;
    [comparisonData addObject:testData3];
    
    // Then add the data to the tree
    // Add lower and a higher-numbered ID data first, then add the middle-valued ID
    [self.testBinaryTree addObjectByID:1 andObjectData:testData1];
    [self.testBinaryTree addObjectByID:3 andObjectData:testData3];
    XCTAssertEqual([self.testBinaryTree addObjectByID:2 andObjectData:testData2], SuccessfullyAdded, @"Adding data to a non-empty tree did not succeed.");
    
    // Then, verify that the tree contains the same objects in the comparisonData array
    XCTAssertTrue([comparisonData isEqualToArray:[self.testBinaryTree returnDataInOrder]], @"Data not added to tree correctly.");
}

// Add a duplicate to the tree (should fail with specific type FailedAddDuplicate)
- (void)testAddObjectByIDWithDuplicateID {
    // Add some test data to the tree
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Test data"];
    
    // Try to add the same test data to the tree again
    XCTAssertEqual([self.testBinaryTree addObjectByID:42 andObjectData:@"Duplicate ID data"], FailedAddDuplicate, @"Adding duplicate ID to tree should fail with FailedAddDuplicate type, but it did not.");
}

// Get data at object ID
// Get data at objectID when tree is empty
- (void)getDataAtObjectIDWhenTreeIsEmpty {
    XCTAssertNil([self.testBinaryTree getDataAtObjectID:42], @"Trying to get data at object id when tree is empty should return nil");
}

// Get data at objectID when tree is not empty and the data exists and it is the only data in the tree
- (void)getDataAtObjectIDWhenDataExistsAlone {
    NSString *testData = @"Test data";
    NSInteger testID = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testID andObjectData:testData];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testID], testData, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data exists and is the highest-value id in the tree
- (void)getDataAtObjectIDWhenIDExistsAndIsLowestValueID {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 2;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDLowest], testDataLowest, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data exists and is the highest-value id in the tree
- (void)getDataAtObjectIDWhenIDExistsAndIsNeitherHigherNorLowestValueID {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 2;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDMedium], testDataMedium, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data exists and is the highest-value id in the tree
- (void)getDataAtObjectIDWhenIDExistsAndIsHighestValueID {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 2;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDHighest], testDataHighest, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data does not exist
- (void)getDataAtObjectIDWhenIDDoesNotExist {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 2;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 3;
    NSInteger testIDDoesntExist = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertNil([self.testBinaryTree getDataAtObjectID:testIDDoesntExist], @"Searching for test ID that has not added should have resulted in nil.");
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
