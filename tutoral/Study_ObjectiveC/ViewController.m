//
//  ViewController.m
//  Study_ObjectiveC
//
//  Created by sqisoft on 2018. 7. 5..
//  Copyright © 2018년 sqisoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"imageEx" ofType:@"png"]]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)buttonTouch:(id)sender {
    
}
- (IBAction)inputTextToTextView:(id)sender {
    [_textView setText:[_textField text]];
}
- (IBAction)switchTouch:(id)sender {
    if ([_switchButton isOn]) {
        NSLog(@"asdasd");
        [_imageView setAlpha:1.0f];
    } else {
        [_imageView setAlpha:0.0f];
    }

}
@end
