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
        
        NSLog(@"Testing Unbalanced Binary Tree with a Frank Herbert Dune Quote");
        // Declare the unbalanced binary tree
        UnbalancedBinaryTree *aUnbalancedBinaryTree = [[UnbalancedBinaryTree alloc] init];
        
        // Add an object to the binary tree
        [aUnbalancedBinaryTree addObjectByID:3 andObjectData:@"Fear is the little-death that brings total obliteration."];
        
        // Try to add the same objectID to the tree (should report failure)
        NSLog(@"There should be a failure message below this line:");
        [aUnbalancedBinaryTree addObjectByID:3 andObjectData:@"Fear is the little-death that brings total obliteration."];
        NSLog(@"");
        
        // Add some more objects to the binary trees
        [aUnbalancedBinaryTree addObjectByID:8 andObjectData:@"Only I will remain."];
        [aUnbalancedBinaryTree addObjectByID:5 andObjectData:@"I will permit it to pass over me and through me."];
        [aUnbalancedBinaryTree addObjectByID:1 andObjectData:@"I must not fear."];
        [aUnbalancedBinaryTree addObjectByID:7 andObjectData:@"Where the fear has gone there will be nothing."];
        [aUnbalancedBinaryTree addObjectByID:6 andObjectData:@"And when it has gone past I will turn the inner eye to see its path."];
        [aUnbalancedBinaryTree addObjectByID:2 andObjectData:@"Fear is the mind-killer."];
        [aUnbalancedBinaryTree addObjectByID:4 andObjectData:@"I will face my fear."];
        
        // If printInorder is correctly written, the quote should be displayed in the correct order
        NSLog(@"Output the lines in the quote in the correct order:");
        [aUnbalancedBinaryTree printInorder];
        NSLog(@"");
        NSLog(@"");
        
        
        NSLog(@"Testing Manual Stack");
        // Declare the idiomatic stack object
        IdiomaticStack *aIdiomaticStack = [[IdiomaticStack alloc] init];

        // Add some literals to the idiomatic stack
        [aIdiomaticStack push:@1];
        [aIdiomaticStack push:@"A test string"];
        [aIdiomaticStack push:@42];

        // Test the output by performing peek, pop, and another push operation
        // print the result to the console
        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 42
        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 42
        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // A test string
        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 1
        NSLog(@"Is the stack empty:     %d", [aIdiomaticStack isEmpty]);    // 0
        [aIdiomaticStack push:@12345];
        NSLog(@"Peek:   %@", [aIdiomaticStack peek]);                       // 12345
        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 12345
        NSLog(@"Pop:    %@", [aIdiomaticStack pop]);                        // 1
        NSLog(@"Is the stack empty:     %d", [aIdiomaticStack isEmpty]);    // 1
    }
    return 0;
}
