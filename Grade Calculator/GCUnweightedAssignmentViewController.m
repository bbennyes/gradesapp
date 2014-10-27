//
//  GCUnweightedAssignmentViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCUnweightedAssignmentViewController.h"
#import "Forms/GCUnweightedAssignmentForm.h"
#import "GCFinalGradeCalculator.h"

@implementation GCUnweightedAssignmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.formController.form = [[GCUnweightedAssignmentForm alloc] init];
    [self.tableView reloadData];
}

- (void)submitUnweightedAssignment:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];

    NSNumber *currentGrade = ((GCUnweightedAssignmentForm *)sender.field.form).currentGrade;
    NSNumber *desiredGrade = ((GCUnweightedAssignmentForm *)sender.field.form).desiredGrade;
    NSNumber *finalPoints = ((GCUnweightedAssignmentForm *)sender.field.form).finalPoints;
    NSNumber *pointsEntered = ((GCUnweightedAssignmentForm *)sender.field.form).pointsEntered;
    
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
    } else if (!finalPoints || finalPoints.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points on the final to continue the calculation.";
    } else if (!pointsEntered || pointsEntered.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points entered in the gradebook to continue the calculation.";
    }
    
    if (goAhead) {
        double current = currentGrade.doubleValue;
        double desired = desiredGrade.doubleValue;
        double final = finalPoints.doubleValue;
        double entered = pointsEntered.doubleValue;
    
        NSDictionary *userNeeds = [GCFinalGradeCalculator userNeedsIfFinalIsPointsWithPointsEntered:entered andPointsOfFinal:final andCurrentGrade:current andUserWants:desired];
        
        if (userNeeds) {
            // uialert the user
            title = @"Item Score";
            message = [NSString stringWithFormat:@"In order to receive a %.2f%% in the class, you will need to get a %.2f%% (%.0f/%.0f) on the supplied item.", desired, [userNeeds[kPercentNeeded] doubleValue], [userNeeds[kPointsNeeded] doubleValue], final];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
        
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
