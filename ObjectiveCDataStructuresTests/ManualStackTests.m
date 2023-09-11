//
//  ManualStackTests.m
//  ObjectiveCDataStructuresTests
//
//  Created by Czer on 9/11/23.
//

#import <XCTest/XCTest.h>
#import "ManualStack.h"
#import "BaseStackTests.h"

@interface ManualStackTests : BaseStackTests

@end

@implementation ManualStackTests

// Override the setup method
- (void)setUp {
    [super setUp];
    self.testStack = [[ManualStack alloc] init];
}

@end
