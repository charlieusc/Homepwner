//
//  BNRItem.h
//  RandomItems
//
//  Created by YangJialin on 7/23/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BNRItem : NSObject <NSCoding>

+ (instancetype)randomItem;
//BNRItem designated initializer

- (instancetype)initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber;

- (instancetype)initWithItemName:(NSString *)name;

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, strong) NSDate *dateCreated;
@property (nonatomic, copy) NSString *itemKey;
@property (nonatomic, strong) UIImage *thumbnail;

-(void)setThumbnailFromImage:(UIImage *)image;

@end
