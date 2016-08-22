//
//  BNRImageViewController.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/21/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRImageViewController.h"

@interface BNRImageViewController () <UIScrollViewDelegate>
@property (nonatomic, strong) UIImageView *imView;
@end

@implementation BNRImageViewController

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if(self){
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        self.navigationItem.rightBarButtonItem = cancelItem;
        //self.image = image;
        self.imView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.width)];
        self.imView.image = image;
    }
    return self;
}

- (void)loadView
{
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.imView.frame];
    NSLog(@"%f", self.imView.frame.size.height);
    scrollView.contentSize = self.imView.frame.size;
    scrollView.delegate = self;
    scrollView.minimumZoomScale = 1;
    scrollView.maximumZoomScale = 5.0;
    [scrollView setMultipleTouchEnabled:YES];
    scrollView.pagingEnabled = NO;
    scrollView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:self.imView];
    self.view = scrollView;
}

-(UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"zoomed!");
    return self.imView;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)cancel:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
