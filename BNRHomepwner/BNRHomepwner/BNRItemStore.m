//
//  BNRItemStore.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/4/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore ()

@property (nonatomic) NSMutableArray *expenItems;
@property (nonatomic) NSMutableArray *cheapItems;

@end

@implementation BNRItemStore

+ (instancetype)sharedStore
{
    static BNRItemStore *sharedStore = nil;
    if(!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton" reason:@"Use + [BNRItemStore sharedstore]" userInfo:nil];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    if(self){
        _expenItems = [[NSMutableArray alloc] init];
        _cheapItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allCheapItems
{
    return self.cheapItems;
}

- (NSArray *)allExpenItems
{
    return self.expenItems;
}

- (BNRItem *)createItem
{
    BNRItem *item = [BNRItem randomItem];
    if(item.valueInDollars>50){
        [self.expenItems addObject:item];
    }else{
        [self.cheapItems addObject:item];
    }
    return item;
}










@end
