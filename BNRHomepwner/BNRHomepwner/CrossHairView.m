//
//  CrossHairView.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/11/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "CrossHairView.h"

@implementation CrossHairView

- (instancetype)init
{
    self = [super init];
    if(self){
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGRect bounds = [self bounds];
    CGPoint center;
    center.x = bounds.origin.x + bounds.size.width/2;
    center.y = bounds.origin.y + bounds.size.height/2;
    CGContextSetLineWidth(ctx, 2.0);
    [[UIColor whiteColor] setStroke];
    CGContextMoveToPoint(ctx, center.x-20, center.y);
    CGContextAddLineToPoint(ctx, center.x+20, center.y);
    CGContextMoveToPoint(ctx, center.x, center.y-20);
    CGContextAddLineToPoint(ctx, center.x, center.y+20);
    CGContextStrokePath(ctx);
}
// This next method is critical.  Without it, this view captures all input gestures and doesn't allow you to edit
// Adding the below line will allow the parent view to receive input
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return NO;
}

@end
