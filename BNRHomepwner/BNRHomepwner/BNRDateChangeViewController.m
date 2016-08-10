//
//  BNRDateChangeViewController.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/9/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRDateChangeViewController.h"
#import "BNRItem.h"

@interface BNRDateChangeViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation BNRDateChangeViewController

- (IBAction)changeDate:(id)sender {
    NSDate *date = self.datePicker.date;
    self.item.dateCreated = date;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title = [NSString stringWithFormat:@"Change time"];
}

@end
