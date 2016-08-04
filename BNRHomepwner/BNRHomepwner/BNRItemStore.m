//
//  BNRItemStore.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/4/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRItemStore.h"

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
    return self;
}

@end
