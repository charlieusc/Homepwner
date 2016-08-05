//
//  BNRItemStore.h
//  BNRHomepwner
//
//  Created by YangJialin on 8/4/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BNRItem;

@interface BNRItemStore : NSObject

@property (nonatomic, readonly) NSArray *allExpenItems;
@property (nonatomic, readonly) NSArray *allCheapItems;

+ (instancetype)sharedStore;
- (BNRItem *)createItem;

@end
