//
//  StackProtocol.h
//  ObjectiveCDataStructures
//
//  Created by Czer on 9/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StackProtocol <NSObject>

- (void)push:(id)item;
- (id)pop;
- (id)peek;
- (BOOL)isEmpty;

@end

NS_ASSUME_NONNULL_END
