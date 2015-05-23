//
//  ViewController.h
//  Pearl
//
//  Created by Alex Fine on 5/11/15.
//  Copyright (c) 2015 AlexFine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)takePhoto:(id)sender;
- (IBAction)selectPhoto:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *move;
@property (strong, nonatomic) IBOutlet UITextView *summary;


@end

