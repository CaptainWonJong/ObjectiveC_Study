//
//  ViewController.h
//  Study_ObjectiveC
//
//  Created by sqisoft on 2018. 7. 5..
//  Copyright © 2018년 sqisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

- (IBAction)buttonTouch:(id)sender;
- (IBAction)inputTextToTextView:(id)sender;
- (IBAction)switchTouch:(id)sender;


@end

