//
//  BNRItemViewController.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/4/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRItemsViewController.h"
#import "BNRItemStore.h"
#import "BNRItem.h"

@implementation BNRItemsViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if(self){
        for(int i=0; i<10; i++){
            [[BNRItemStore sharedStore] createItem];
        }
        //set an image as the background to tableview
        UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"table_background.png"]];
        [tempImageView setFrame:self.tableView.frame];
        self.tableView.backgroundView = tempImageView;
    }
    return self;
}

-(instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //return 2;
    NSInteger i = 0;
    if([[[BNRItemStore sharedStore] allExpenItems] count] > 0) i++;
    if([[[BNRItemStore sharedStore] allCheapItems] count] > 0) i++;
    return i;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0) return [[[BNRItemStore sharedStore] allCheapItems] count]+1;
    return [[[BNRItemStore sharedStore] allExpenItems] count]+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSArray *items;
    NSInteger index;
    if(indexPath.section == 0){
        items = [[BNRItemStore sharedStore] allCheapItems];
        if(indexPath.row == [[[BNRItemStore sharedStore] allCheapItems] count]){
            cell.textLabel.text = @"no more items!";
        }else{
            BNRItem *item = items[indexPath.row];
            cell.textLabel.text = [item description];
        }
    }else{
        items = [[BNRItemStore sharedStore] allExpenItems];
        if(indexPath.row == [[[BNRItemStore sharedStore] allExpenItems] count]){
            cell.textLabel.text = @"no more items!";
        }else{
            BNRItem *item = items[indexPath.row];
            cell.textLabel.text = [item description];
        }
    }
    
    return cell;
}
//set cell background to clear
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
}

/*
- (CGRect)rectForSection:(NSInteger)section
{
    CGRect ret;
    CGRect screen = [[UIScreen mainScreen] bounds];
    if(section == 0){
        ret = CGRectMake(0, 20, screen.size.width, 350);
    }else{
        ret = CGRectMake(400, 20, screen.size.width, 350);
    }
    return ret;
}
*/

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0){
        if(indexPath.row < [[[BNRItemStore sharedStore] allCheapItems] count]){
            return 60.0;
        }
    }else{
        if(indexPath.row < [[[BNRItemStore sharedStore] allExpenItems] count]){
            return 60.0;
        }
    }
    return 44.0;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
}








@end
