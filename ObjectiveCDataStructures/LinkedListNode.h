//
//  LinkedListNode.h
//  ObjectiveCStack
//
//  Created by Czer on 9/8/23.
//

/*
 The LinkedListNode class will hold nodes for a singly-linked list. They can be used in any "reinventing the wheel" data structure that requires a singly linked list such as a Linked List, Stack, Circular Linked List, etc.
 */

#import <Foundation/Foundation.h>

@interface LinkedListNode : NSObject

// These properties are public as a node will function more like a struct than a real class that manages its own data members

// Holds the object for this LinkedListNode
@property (nonatomic, strong) id objectData;

// Holds the pointer to the next LinkedListNode
@property (nonatomic, strong) LinkedListNode *next;

// Custom constructor/initializer with an object as a parameter
- (instancetype)initWithData:(id)objectData;

@end
