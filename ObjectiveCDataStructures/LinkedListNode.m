//
//  LinkedListNode.m
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/8/23.
//

#import "LinkedListNode.h"

@implementation LinkedListNode

- (instancetype)initWithData:(id)objectData {
    // Initialize the parent class/superclass and set it as self
    self = [super init];
    // If parent class/superclass was successfully initialized, set objectData and next to incoming objectData and nil, respectively
    if (self) {
        self.objectData = objectData;
        self.next = nil;
    }
    // Return the instance of the LinkedListNode
    return self;
}

@end
