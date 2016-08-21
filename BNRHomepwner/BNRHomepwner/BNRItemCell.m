//
//  BNRItemCell.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/20/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRItemCell.h"

@implementation BNRItemCell

- (IBAction)showImage:(id)sender
{
    if(self.actionBlock){
        self.actionBlock();
    }
}
@end
