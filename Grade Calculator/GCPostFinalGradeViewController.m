//
//  GCPostFinalGradeViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCPostFinalGradeViewController.h"
#import "Forms/GCUserGradeAfterFinalForm.h"
#import "GCFinalGradeCalculator.h"

@interface GCPostFinalGradeViewController ()

@end

@implementation GCPostFinalGradeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.formController.form = [[GCUserGradeAfterFinalForm alloc] init];
    [self.tableView reloadData];
}

- (void)submitCalcFinalGrade:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];
    
    NSNumber *currentGrade = ((GCUserGradeAfterFinalForm *)sender.field.form).currentGrade;
    NSNumber *finalGrade = ((GCUserGradeAfterFinalForm *)sender.field.form).finalGrade;
    NSNumber *finalWeight = ((GCUserGradeAfterFinalForm *)sender.field.form).finalWeight;
    
    BOOL goAhead = YES;
    NSString *title;
    NSString *message;
    
    if (!currentGrade || currentGrade.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive current grade to continue the calculation.";
    } else if (!finalGrade || finalGrade.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive final grade to continue the calculation.";
    } else if (!finalWeight || finalWeight.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive final weight to continue the calculation.";
    }
    
    if (goAhead) {
        double current = currentGrade.doubleValue;
        double final = finalGrade.doubleValue;
        double weight = finalWeight.doubleValue;
        
        NSNumber *worth = [GCFinalGradeCalculator userGradeAfterFinalWithCurrentGrade:current andExamGrade:final andFinalWorth:weight];
        
        if (worth) {
            // uialert the user
            title = @"Class Grade";
            message = [NSString stringWithFormat:@"After receiving a %.2f%% on the final, your grade in the class will be %.2f%%.", final, worth.doubleValue];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
