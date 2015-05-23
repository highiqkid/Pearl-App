//
//  ViewController.m
//  Pearl
//
//  Created by Alex Fine on 5/11/15.
//  Copyright (c) 2015 AlexFine. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString * mainIdeas = @"Chile"; //This will be data from main concepts from our text search/index from the OCR data. Currently I'm setting it to Chile just to test
    NSString * sFeedURL = [NSString stringWithFormat:@"http://dragonflysearch.com/api/search.php?q=%@", mainIdeas];
    //RSS Feed URL goes between quotes
    
    NSString * sActualFeed = [NSString stringWithContentsOfURL:[NSURL URLWithString:sFeedURL] encoding:1 error:nil];
    
    
//    lblOne.text = sActualFeed;
    NSLog(@"%@", sActualFeed);
    
  // NSString * sActualFeed = _summary.text;
  //  [NSString sActualFeed componentsSeparatedByString:@","]
  //  [NSString sActualFeed:@"",""];
    
    _summary.text = [NSString stringWithFormat:@"%@",sActualFeed]; //Hook up the actual text field with what's going on in here

    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                              message:@"Device has no camera"
                                                             delegate:nil
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles: nil];
        
        [myAlertView show];
        
    }
    [self justTestingSomeShitHere];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)takePhoto:(id)sender {
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:NULL];
    
}

- (IBAction)selectPhoto:(id)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:NULL];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void) justTestingSomeShitHere {
    NSString * string = @"h,er,e's dat, string";
   // NSArray *myArray = [string componentsSeparatedByString:@","];
  //  NSString * strippedNumbers = [[myArray objectAtIndex:4] stringByReplacingOccurrencesOfRegex:@"[^0-9]" withString:@"kjhlkj"];
   // NSString *myString = [NSString stringWithFormat:@"%@ %@", [myArray objectAtIndex:3], strippedNumbers];
    [string componentsSeparatedByString:@","];
    NSLog(@"%@", string);
}
@end
