//
//  ViewController.h
//  CalculatorApp
//
//  Created by sqisoft on 2018. 7. 9..
//  Copyright © 2018년 sqisoft. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    STATUS_DEFAULT = 0,
    STATUS_DIVISION,
    STATUS_MULTIPLY,
    STATUS_MINUS,
    STATUS_PLUS,
    STATUS_RETURN
} kStatusCode;

@interface ViewController : UIViewController {
    double curValue;
    double totalCurValue;
    NSString *curInputValue;
    kStatusCode curStatusCode;
}

- (IBAction)digitPressed:(UIButton *)sender;
- (IBAction)operationPressed:(UIButton *)sender;


@property Float64 curValue;
@property Float64 totlaCurValue;
@property kStatusCode curStatusCode;

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@end

