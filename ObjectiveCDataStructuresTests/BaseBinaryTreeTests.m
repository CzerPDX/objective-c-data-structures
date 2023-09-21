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
    NSNumber *testData3 = @3;
    [comparisonData addObject:testData3];
    
    // Then add the data to the tree
    // Add lower-numbered ID data first, followed by a higher ID
    [self.testBinaryTree addObjectByID:2 andObjectData:testData2];
    [self.testBinaryTree addObjectByID:1 andObjectData:testData1];
    XCTAssertEqual([self.testBinaryTree addObjectByID:3 andObjectData:testData3], SuccessfullyAdded, @"Adding data to a non-empty tree did not succeed.");
    
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
    NSNumber *testData3 = @3;
    [comparisonData addObject:testData3];
    
    // Then add the data to the tree
    // Add higher-numbered ID data first, followed by a lower ID
    [self.testBinaryTree addObjectByID:3 andObjectData:testData3];
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


- (void)helperAddRandomDataInRange:(int)randomNumberRangeCap forRandomNumberOfRoundsRange:(int)numberOfRoundsCap andUpdateComparisonDataArray:(NSMutableArray *)comparisonData {
    
    NSInteger numberOfRounds = arc4random_uniform(numberOfRoundsCap);
    
    for (int i = 0; i < numberOfRounds; i++) {
        // Create a random number to save as data
        NSInteger randomNumber = arc4random_uniform(randomNumberRangeCap);
        
        // Add the random number to the tree
        AddResult addResult = [self.testBinaryTree addObjectByID:randomNumber andObjectData:@(randomNumber)];
        
        // Only add to the comparisonData array if it was successfully added to the tree (no duplicates)
        if (addResult == SuccessfullyAdded) {
            [comparisonData addObject:@(randomNumber)];
        }
    }
}


// Adding tests for all test cases would be extensive. To supplement basic testing, I've created a random add test that will randomly add data to the tree.
// After being added, it compares the inorder output of the tree's data to the sorted data that was added.
// The sorted comparison data and the inorder data output from the tree should match. If not, then the original order of the data is output in the test failure message so it can be replicated.
- (void)testRandomAdd {
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    
    // Call the helper function to add random data to the tree
    [self helperAddRandomDataInRange:2000 forRandomNumberOfRoundsRange:100 andUpdateComparisonDataArray:comparisonData];
    
    
    // Sort the comparison data and get the sorted data from the tree
    NSArray *sortedComparisonData = [comparisonData sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *inorderBinaryTreeData = [self.testBinaryTree returnDataInOrder];
    
    // Compare the comparison data to the inorder data returned from the tree
    XCTAssertTrue([sortedComparisonData isEqualToArray:inorderBinaryTreeData], @"Data not added to tree correctly. \n\nOriginal Data added: \n%@ \n\n Output from binary tree: \n%@", [comparisonData description], [inorderBinaryTreeData description]);
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
- (void)getDataAtObjectIDWhenIDExistsAndIsLowestValue {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataLower = @"Lower test data";
    NSInteger testIDLower = 2;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 3;
    NSString *testDataHigher = @"Higher test data";
    NSInteger testIDHigher = 4;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 5;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDLower andObjectData:testDataLower];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHigher andObjectData:testDataHigher];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDLowest], testDataLowest, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data exists and is neither the highest, nor lowest, id in the tree
- (void)getDataAtObjectIDWhenIDExistsAndIsNeitherHigherNorLowestValue {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataLower = @"Lower test data";
    NSInteger testIDLower = 2;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 3;
    NSString *testDataHigher = @"Higher test data";
    NSInteger testIDHigher = 4;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 5;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDLower andObjectData:testDataLower];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHigher andObjectData:testDataHigher];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDMedium], testDataMedium, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data exists and is the highest-value id in the tree
- (void)getDataAtObjectIDWhenIDExistsAndIsHighestValue {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataLower = @"Lower test data";
    NSInteger testIDLower = 2;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 3;
    NSString *testDataHigher = @"Higher test data";
    NSInteger testIDHigher = 4;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 5;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDLower andObjectData:testDataLower];
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHigher andObjectData:testDataHigher];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    
    // Search for the data
    XCTAssertEqual([self.testBinaryTree getDataAtObjectID:testIDHighest], testDataHighest, @"Test data did not match expected search outcome.");
}

// Get data at objectID when tree is not empty and the data does not exist
- (void)getDataAtObjectIDWhenIDDoesNotExist {
    NSString *testDataLowest = @"Lowest test data";
    NSInteger testIDLowest = 1;
    NSString *testDataLower = @"Lower test data";
    NSInteger testIDLower = 2;
    NSString *testDataMedium = @"Mediumest test data";
    NSInteger testIDMedium = 3;
    NSString *testDataHigher = @"Higher test data";
    NSInteger testIDHigher = 4;
    NSString *testDataHighest = @"Highest test data";
    NSInteger testIDHighest = 5;
    NSInteger testIDDoesntExist = 42;
    
    // Add the data to the tree
    [self.testBinaryTree addObjectByID:testIDMedium andObjectData:testDataMedium];
    [self.testBinaryTree addObjectByID:testIDHighest andObjectData:testDataHighest];
    [self.testBinaryTree addObjectByID:testIDHigher andObjectData:testDataHigher];
    [self.testBinaryTree addObjectByID:testIDLowest andObjectData:testDataLowest];
    [self.testBinaryTree addObjectByID:testIDLower andObjectData:testDataLower];
    
    // Search for the data that doesn't exist
    XCTAssertNil([self.testBinaryTree getDataAtObjectID:testIDDoesntExist], @"Searching for test ID that has not added should have resulted in nil.");
}

// Delete object by ID
// Delete from an empty tree
- (void)testDeleteObjectByIDWhenTreeIsEmpty {
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeletedNotFound, @"Deleting from tree when tree is empty should return SuccessfullyDeletedNotFound but it did not.");
}

// Delete from a tree where the item exists at root with no children
- (void)testDeleteObjectByIDWhenIDExists {
    // Add data to remove
    [self.testBinaryTree addObjectByID:42 andObjectData:@"Some test data"];
    
    // Verify that deleting it is successful
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeleted, @"Deleting from tree did not return SuccessfullyDeleted.");
    
}

// Delete from a tree where the item does not exist
- (void)testDeleteObjectByIDWhenIDDoesNotExist {
    // Add data to the tree
    [self.testBinaryTree addObjectByID:1 andObjectData:@"Some more test data"];
    [self.testBinaryTree addObjectByID:3 andObjectData:@"Even more test data"];
    [self.testBinaryTree addObjectByID:2 andObjectData:@"Even even more test data"];
    
    // Try to delete an objectID that hasn't been added (should be SuccessfullyDeletedNotFound)
    XCTAssertEqual([self.testBinaryTree deleteObjectByID:42], SuccessfullyDeletedNotFound, @"Deleting non-existent item from the tree did not return SuccessfullyDeletedNotFound.");
}

// This is a random test function meant to supplement testing of the delete function.
// It interleaves adding data manually that is not added to comparisonData array so it can be removed
// Comparison data without data to remove is sorted and compared to inorder data output from the tree. They should match or the test fails.
- (void)testRandomAddDelete {
    NSMutableArray *comparisonData = [[NSMutableArray alloc] init];
    
    // Add some data manually before removing anything (do not add to comparisonData)
    [self.testBinaryTree addObjectByID:239 andObjectData:@(239)];
    [self.testBinaryTree addObjectByID:1571 andObjectData:@(1571)];
    
    // Then run the helper function (round 1)
    [self helperAddRandomDataInRange:2000 forRandomNumberOfRoundsRange:50 andUpdateComparisonDataArray:comparisonData];
    
    // Then add more data manually (do not add to comparisonData)
    [self.testBinaryTree addObjectByID:181 andObjectData:@(181)];
    [self.testBinaryTree addObjectByID:1559 andObjectData:@(1559)];
    
    // Then run helper function (round 2)
    [self helperAddRandomDataInRange:2000 forRandomNumberOfRoundsRange:50 andUpdateComparisonDataArray:comparisonData];
    
    // Then add more data manually (do not add to comparisonData)
    [self.testBinaryTree addObjectByID:42 andObjectData:@(42)];
    [self.testBinaryTree addObjectByID:977 andObjectData:@(977)];
    
    // Then delete all removed data added manually
    [self.testBinaryTree deleteObjectByID:239];
    [self.testBinaryTree deleteObjectByID:1571];
    [self.testBinaryTree deleteObjectByID:181];
    [self.testBinaryTree deleteObjectByID:1559];
    [self.testBinaryTree deleteObjectByID:42];
    [self.testBinaryTree deleteObjectByID:977];
    
    // Sort the comparison data and get the sorted data from the tree
    NSArray *sortedComparisonData = [comparisonData sortedArrayUsingSelector:@selector(compare:)];
    NSMutableArray *inorderBinaryTreeData = [self.testBinaryTree returnDataInOrder];
    
    // Compare the comparison data to the inorder data returned from the tree
    XCTAssertTrue([sortedComparisonData isEqualToArray:inorderBinaryTreeData], @"Data not removed from tree correctly. \n%@ \n\n Output from binary tree: \n%@", [comparisonData description], [inorderBinaryTreeData description]);
}

@end
