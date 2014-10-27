//
//  GCWeightedAssignmentViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCWeightedAssignmentViewController.h"
#import "GCWeightedAssignmentForm.h"
#import "GCFinalGradeCalculator.h"

@interface GCWeightedAssignmentViewController ()

@end

@implementation GCWeightedAssignmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.formController.form = [[GCWeightedAssignmentForm alloc] init];
    [self.tableView reloadData];
}

- (void)submitWeightedAssignment:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];

    NSNumber *currentGrade = ((GCWeightedAssignmentForm *)sender.field.form).currentGrade;
    NSNumber *desiredGrade = ((GCWeightedAssignmentForm *)sender.field.form).desiredGrade;
    NSNumber *assignmentWeight = ((GCWeightedAssignmentForm *)sender.field.form).assignmentWeight;
    NSNumber *pointsInAssignmentCategory = ((GCWeightedAssignmentForm *)sender.field.form).pointsInAssignmentCategory;
    NSNumber *possiblePointsInAssignmentCategory = ((GCWeightedAssignmentForm *)sender.field.form).possiblePointsInAssignmentCategory;
    NSNumber *possiblePointsOnAssignment = ((GCWeightedAssignmentForm *)sender.field.form).possiblePointsOnAssignment;
    
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
    } else if (!assignmentWeight || assignmentWeight.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive assignment weight to continue the calculation.";
    } else if (!pointsInAssignmentCategory || pointsInAssignmentCategory.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points earned in the item's category.";
    } else if (!possiblePointsInAssignmentCategory || possiblePointsInAssignmentCategory.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of possible points in the item's category.";
    } else if (!possiblePointsOnAssignment || possiblePointsOnAssignment.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points possible on the item.";
    }
    
    if (goAhead) {
        double current = currentGrade.doubleValue;
        double desired = desiredGrade.doubleValue;
        double weight = assignmentWeight.doubleValue;
        double earned = pointsInAssignmentCategory.doubleValue;
        double possible = possiblePointsInAssignmentCategory.doubleValue;
        double assignment = possiblePointsOnAssignment.doubleValue;
            
        NSDictionary *userNeeds = [GCFinalGradeCalculator userNeedsIfFinalIsTestWithCurrentGrade:current andUserWants:desired andTestWeightage:weight andPointsInTestCategory:earned andPossiblePointsInTestCategory:possible andPossiblePointsOnFinal:assignment];
        
        if (userNeeds) {
            // uialert the user
            title = @"Item Score";
            message = [NSString stringWithFormat:@"In order to receive a %.2f%% in the class, you will need to get a %.2f%% (%.0f/%.0f) on the supplied item.", desired, [userNeeds[kPercentNeeded] doubleValue], [userNeeds[kPointsNeeded] doubleValue], assignment];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
