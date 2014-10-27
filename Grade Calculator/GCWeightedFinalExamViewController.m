//
//  GCWeightedAssignmentViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCWeightedFinalExamViewController.h"
#import "Forms/GCWeightedFinalExamForm.h"
#import "FXForms.h"
#import "FinalGradeCalculator/GCFinalGradeCalculator.h"

@interface GCWeightedFinalExamViewController ()

@end

@implementation GCWeightedFinalExamViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.formController.form = [[GCWeightedFinalExamForm alloc] init];
    [self.tableView reloadData];
}

- (void)submitWeightedFinalExamForm:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];

    NSNumber *currentGrade = ((GCWeightedFinalExamForm *)sender.field.form).currentGrade;
    NSNumber *desiredGrade = ((GCWeightedFinalExamForm *)sender.field.form).desiredGrade;
    NSNumber *weightage = ((GCWeightedFinalExamForm *)sender.field.form).finalWeight;
    
    BOOL goAhead = YES;
    NSString *title;
    NSString *message;
    
    if (!currentGrade || currentGrade.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive current grade to continue the calculation.";
    } else if (!desiredGrade || desiredGrade.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive desired grade to continue the calculation.";
    } else if (!weightage || weightage.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive final weight to continue the calculation.";
    }
    
    if (goAhead) {
        double current = currentGrade.doubleValue;
        double desired = desiredGrade.doubleValue;
        double weight = weightage.doubleValue;
        
        NSNumber *userNeeds = [GCFinalGradeCalculator userNeedsOnFinalWithCurrentGrade:current andUserWants:desired andFinalWorth:weight];
        
        if (userNeeds) {
            // uialert the user
            title = @"Final Exam Score";
            message = [NSString stringWithFormat:@"In order to receive a %.2f%% in the class, you will need to get a %.2f%% on the final.", desired, userNeeds.doubleValue];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
