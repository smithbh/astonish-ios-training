//
//  CalculatorViewController.h
//  LERzor
//
//  Created by Brandon Smith on 4/1/14.
//  Copyright (c) 2014 Astonish Design. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController <UITextFieldDelegate> {
    
    // initialize UI element objects here
    IBOutlet UITextField *annualSalaryInput, *billableRateInput, *billableHoursInput;
    IBOutlet UILabel *currentLERLabel;
}

// declare class methods here
- (IBAction)calculateLER;
- (IBAction)cancel;

- (float)currentLER:(float)salary hourlyRate:(float)rate totalHours:(float)hours;

@end

