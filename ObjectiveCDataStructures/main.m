//
//  main.m
//  ObjectiveCStack
//
//  Created by Czer on 9/7/23.
//

#import <Foundation/Foundation.h>
#import "ManualStack.h"
#import "IdiomaticStack.h"
#import "UnbalancedBinaryTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Declare an NSInteger objectID and some objectData (doesn't matter what kind)
        NSInteger objectID = 42;
        NSString *objectData = @"A piece of data!";
        
        // Declare the unbalanced binary tree
        UnbalancedBinaryTree *aUnbalancedBinaryTree = [[UnbalancedBinaryTree alloc] init];
        
        // Add an object to the binary tree (should report success to console)
        [aUnbalancedBinaryTree addObjectByID:objectID andObjectData:objectData];
        
        // Try to add the same objectID to the tree (should report failure)
        [aUnbalancedBinaryTree addObjectByID:objectID andObjectData:objectData];
        
        
//        // Declare the idiomatic stack object
//        IdiomaticStack *aIdiomaticStack = [[IdiomaticStack alloc] init];
//
//        // Add some literals to the idiomatic stack
//        [aIdiomaticStack push:@1];
//        [aIdiomaticStack push:@"A test string"];
//        [aIdiomaticStack push:@42];
//
//        // Test the output by performing peek, pop, and another push operation
//        // print the result to the console
//        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 42
//        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 42
//        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // A test string
//        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 1
//        NSLog(@"Is the stack empty:     %d", [aIdiomaticStack isEmpty]);    // 0
//        [aIdiomaticStack push:@12345];
//        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 12345
//        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 12345
//        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 1
//        NSLog(@"Is the stack empty:     %d", [aIdiomaticStack isEmpty]);    // 1
    }
    return 0;
}
