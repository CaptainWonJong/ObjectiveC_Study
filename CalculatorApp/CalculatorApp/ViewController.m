//
//  ViewController.m
//  CalculatorApp
//
//  Created by sqisoft on 2018. 7. 9..
//  Copyright © 2018년 sqisoft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self ClearCalculation];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations {
    // 단말기의 세로방향만 지원
    return UIInterfaceOrientationMaskPortrait;
    // 단말기의 가로방향만 지원
    // return UIInterfaceOrientationMaskLandscapeLeft;
    // return UIInterfaceOrientationMaskLandscapeRight;
    // 단말기의 세로/가로 모드를 모두 지원
    // return UIInterfaceOrientationMaskAll
}

// 라벨에 문자열을 출력
- (void)DisplayInputValue:(NSString *)displayText {
    NSString *CommaText;
    CommaText = [self ConvertComma:displayText];
    
    [self.displayLabel setText:CommaText];
    
}

// 계산 결과를 화면에 출력
- (void) DisplayCalculationValue {
    NSString *displayText;
    displayText = [NSString stringWithFormat: @"%g", totalCurValue];
    [self DisplayInputValue:displayText];
    curInputValue = @"";
}

// 계산기 초기화
- (void) ClearCalculation {
    curInputValue = @"";
    curValue = 0;
    totalCurValue = 0;
    
    [self DisplayInputValue:curInputValue];
    
    curStatusCode = STATUS_DEFAULT;
}

// 천 원 단위를 표시하는 메서드
- (NSString *) ConvertComma:(NSString *)data {
    if (data == nil) {
        return nil;
    }
    
    if ([data length] <= 3) {
        return data;
    }
    
    NSString *integerString = nil;
    NSString *floatString = nil;
    NSString *minusString = nil;
    
    // 소수점을 찾습니다.
    NSRange pointRange = [data rangeOfString:@"."];
    if (pointRange.location == NSNotFound) {
        // 소수점이 없습니다.
        integerString = data;
    } else {
        // 소수점 이하 영역을 찾습니다.
        NSRange r;
        r.location = pointRange.location;
        r.length = [data length] - pointRange.location;
        floatString = [data substringWithRange:r];
        
        r.location = 0;
        r.length = pointRange.location;
        integerString = [data substringWithRange:r];
    }
    
    // 음수 부호를 찾습니다.
    NSRange minusRange = [integerString rangeOfString:@"-"];
    if (minusRange.location != NSNotFound) {
        minusString = @"-";
        integerString = [integerString stringByReplacingOccurrencesOfString:@"-" withString:@""];
    }
    
    // 세 자리 단위로 콤마를 찍습니다.
    NSMutableString *integerStringCommaInserted = [[NSMutableString alloc] init];
    int integerStringLength = [integerString length];
    int idx = 0;
    while (idx < integerStringLength) {
        [integerStringCommaInserted appendFormat:@"%C", [integerString characterAtIndex:idx]];
        if ((integerStringLength - (idx + 1)) % 3 == 0
            && integerStringLength != (idx + 1)) {
            [integerStringCommaInserted appendString:@","];
        }
        idx++;
    }
    
    NSMutableString *returnString = [[NSMutableString alloc] init];
    if (minusString != nil) {
        [returnString appendString:minusString];
    }
    
    if (integerStringCommaInserted != nil) {
        [returnString appendString:integerStringCommaInserted];
    }
    
    if (floatString != nil) {
        [returnString appendString:floatString];
    }
    
    return returnString;
}

// 숫자와 소수점 버튼을 누르면 호출되는 메서드
- (IBAction)digitPressed:(UIButton *)sender {
    NSString *numPoint = [[sender titleLabel] text];
    curInputValue = [curInputValue stringByAppendingFormat:numPoint];
    [self DisplayInputValue:curInputValue];
}

- (IBAction)operationPressed:(UIButton *)sender {
    NSString *operationText = [[sender titleLabel] text];
    
    if ([@"+"isEqualToString:operationText]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_PLUS];
    } else if ([@"-"isEqualToString:operationText]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MINUS];
    } else if ([@"*"isEqualToString:operationText]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_MULTIPLY];
    } else if ([@"/"isEqualToString:operationText]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_DIVISION];
    } else if ([@"C"isEqualToString:operationText]) {
        [self ClearCalculation];
    } else if ([@"="isEqualToString:operationText]) {
        [self Calculation:curStatusCode CurStatusCode:STATUS_RETURN];
    }
}

- (void) Calculation:(kStatusCode)StatusCode CurStatusCode:(kStatusCode)cStatusCode {
    switch (StatusCode) {
        case STATUS_DEFAULT:
            [self DefaultCalculation];
            break;
            
        case STATUS_DIVISION:
            [self DivisionCalculation];
            break;
            
        case STATUS_MULTIPLY:
            [self MultiplyCalculation];
            break;
            
        case STATUS_MINUS:
            [self MinusCalculation];
            break;
            
        case STATUS_PLUS:
            [self PlusCalculation];
            break;
            
        default:
            break;
    }
    curStatusCode = cStatusCode;
}

- (void) DefaultCalculation {
    curValue = [curInputValue doubleValue];
    totalCurValue = curValue;
    
    [self DisplayCalculationValue];
}

- (void) PlusCalculation {
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue + curValue;
    
    [self DisplayCalculationValue];
}

- (void) MinusCalculation {
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue - curValue;
    
    [self DisplayCalculationValue];
}


- (void) MultiplyCalculation {
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue * curValue;
    
    [self DisplayCalculationValue];
}

- (void) DivisionCalculation {
    curValue = [curInputValue doubleValue];
    totalCurValue = totalCurValue / curValue;
    
    [self DisplayCalculationValue];
}


@end
