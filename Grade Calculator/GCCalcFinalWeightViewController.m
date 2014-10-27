//
//  GCCalcFinalWeightViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCCalcFinalWeightViewController.h"
#import "Forms/GCCalcFinalWeightForm.h"
#import "GCFinalGradeCalculator.h"

@interface GCCalcFinalWeightViewController ()

@end

@implementation GCCalcFinalWeightViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.formController.form = [[GCCalcFinalWeightForm alloc] init];
    [self.tableView reloadData];
}

- (void)submitCalcFinalWeight:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];
    
    NSNumber *finalPoints = ((GCCalcFinalWeightForm *)sender.field.form).finalPoints;
    NSNumber *pointsEntered = ((GCCalcFinalWeightForm *)sender.field.form).pointsEntered;
    
    BOOL goAhead = YES;
    NSString *title;
    NSString *message;
    
    if (!finalPoints || finalPoints.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points on the final to continue the calculation.";
    } else if (!pointsEntered || pointsEntered.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive value for the number of points entered into the gradebook to continue the calculation.";
    }
    
    if (goAhead) {
        double final = finalPoints.doubleValue;
        double entered = pointsEntered.doubleValue;
        
        NSNumber *worth = [GCFinalGradeCalculator finalIsWorthWithPointsEntered:entered andPointsOfFinal:final];
        
        if (worth) {
            // uialert the user
            title = @"Final Weight";
            message = [NSString stringWithFormat:@"A final worth %.0f points in a class with %.0f points entered (excluding the final) has a weight of %.2f%%.", final, entered, worth.doubleValue];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
