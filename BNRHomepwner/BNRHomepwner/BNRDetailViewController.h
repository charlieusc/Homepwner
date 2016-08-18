//
//  BNRDetailViewController.h
//  BNRHomepwner
//
//  Created by YangJialin on 8/8/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BNRItem;

@interface BNRDetailViewController : UIViewController

- (instancetype)initForNewItem:(BOOL)isNew;
@property (nonatomic, strong) BNRItem *item;
@property (nonatomic, copy) void (^dismissBlock)(void);


@end
