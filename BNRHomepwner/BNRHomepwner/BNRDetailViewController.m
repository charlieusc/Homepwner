//
//  BNRDetailViewController.m
//  BNRHomepwner
//
//  Created by YangJialin on 8/8/16.
//  Copyright © 2016 YangJialin. All rights reserved.
//

#import "BNRDetailViewController.h"
#import "BNRItem.h"
#import "BNRImageStore.h"
#import "CrossHairView.h"

@interface BNRDetailViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *serialNumberField;
@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;

@end

@implementation BNRDetailViewController

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    [[BNRImageStore sharedStore] setImage:image forKey:self.item.itemKey];
    
    self.imageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    [imagePicker setAllowsEditing:YES];
    CrossHairView *chv = [[CrossHairView alloc] init];
    [chv setFrame:CGRectMake(0, 0, [imagePicker view].bounds.size.width, [imagePicker view].bounds.size.height - 52)];
    [imagePicker setCameraOverlayView:chv];
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BNRItem *item = self.item;
    
    self.nameField.text = item.itemName;
    self.serialNumberField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    
    static NSDateFormatter *dateFormatter = nil;
    if(!dateFormatter){
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
    
    self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *itemKey = self.item.itemKey;
    
    UIImage *imageToDisplay = [[BNRImageStore sharedStore] imageForKey:itemKey];
    self.imageView.image = imageToDisplay;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.view endEditing:YES];
    
    BNRItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialNumberField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

- (void)setItem:(BNRItem *)item
{
    _item = item;
    self.navigationItem.title =_item.itemName;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField  resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTapped:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)deletePicture:(id)sender {
    [[BNRImageStore sharedStore] deleteImageForKey:self.item.itemKey];
    [self.imageView setImage:nil];
    //self.imageView.image = nil;
}










@end
