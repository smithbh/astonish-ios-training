//
//  CalculatorViewController.m
//  LERzor
//
//  Created by Brandon Smith on 4/1/14.
//  Copyright (c) 2014 Astonish Design. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController () <UITextFieldDelegate>

@end

@implementation CalculatorViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    annualSalaryInput.delegate = self;
    billableRateInput.delegate = self;
    billableHoursInput.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel{
    [annualSalaryInput resignFirstResponder];
    [billableRateInput resignFirstResponder];
    [billableHoursInput resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if ( [textField isEqual: annualSalaryInput] ){
        [annualSalaryInput resignFirstResponder];
        [billableRateInput becomeFirstResponder];
        return NO;
    } else if ( [textField isEqual: billableRateInput] ){
        [billableRateInput resignFirstResponder];
        [billableHoursInput becomeFirstResponder];
        return NO;
    } else if ([textField isEqual: billableHoursInput]) {
        [billableHoursInput resignFirstResponder];
        return NO;
    }
    
    return YES;
    
}


- (IBAction)calculateLER {
    float weeklySalary = [annualSalaryInput.text floatValue] / 52;
    float billableRate = [billableRateInput.text floatValue];
    float billableHours = [billableHoursInput.text floatValue];
    
    float currentLER = [self currentLER:weeklySalary hourlyRate:billableRate totalHours:billableHours];
    
    currentLERLabel.text = [NSString stringWithFormat:@"%.02f", currentLER];
}

- (float)currentLER:(float)salary hourlyRate:(float)rate totalHours:(float)hours {
    float currentOutput = rate * hours;

    return currentOutput / salary;
}


@end
