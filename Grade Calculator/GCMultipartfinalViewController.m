//
//  GCMultipartfinalViewController.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/14/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCMultipartfinalViewController.h"
#import "Forms/GCMultipartFinalForm.h"
#import "GCFinalGradeCalculator.h"

@interface GCMultipartfinalViewController ()

@property (nonatomic, strong) NSMutableDictionary *testWorths;
@property (nonatomic, strong) NSMutableDictionary *testScores;

@end

@implementation GCMultipartfinalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.testWorths = [[NSMutableDictionary alloc] init];
    self.testScores = [[NSMutableDictionary alloc] init];
    
    self.formController.form = [[GCMultipartFinalForm alloc] init];
    [self.tableView reloadData];
}

- (void)refreshFields:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];
    self.formController.form = self.formController.form;
    [self.tableView reloadData];
}

- (void)saveTestWorth:(id <FXFormFieldCell>)sender
{
    NSString *text = ((FXFormTextFieldCell *)sender).textField.text;
    [self.testWorths setObject:@(text.doubleValue) forKey:sender.field.key];
}

- (void)saveTestScore:(id <FXFormFieldCell>)sender
{
    NSString *text = ((FXFormTextFieldCell *)sender).textField.text;
    [self.testScores setObject:@(text.doubleValue) forKey:sender.field.key];}

- (void)submtMultipartForm:(id <FXFormFieldCell>)sender
{
    [self.tableView endEditing:YES];
    
    // get data from non extra fields
    NSNumber *currentGrade = ((GCMultipartFinalForm *)sender.field.form).currentGrade;
    NSNumber *desiredGrade = ((GCMultipartFinalForm *)sender.field.form).desiredGrade;
    NSNumber *finalWeight = ((GCMultipartFinalForm *)sender.field.form).finalWeight;
    NSNumber *numParts = ((GCMultipartFinalForm *)sender.field.form).numParts;
    NSNumber *numTaken = ((GCMultipartFinalForm *)sender.field.form).numTaken;
    
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
    } else if (!finalWeight || finalWeight.doubleValue < 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"You must enter a positive final weight to continue the calculation.";
    } else if (numParts.doubleValue <= 0) {
        goAhead = NO;
        title = @"Input Error";
        message = @"The number of parts on a multi-part final cannot be zero.";
    } else if (numTaken.doubleValue > numParts.doubleValue) {
        goAhead = NO;
        title = @"Input Error";
        message = @"The number of parts taken cannot be greater than the number of parts on the final.";
    }
    
    if (goAhead) {
        double current = currentGrade.doubleValue;
        double desired = desiredGrade.doubleValue;
        double weight = finalWeight.doubleValue;
        double parts = numParts.doubleValue;
    
        NSMutableArray *scores = [[NSMutableArray alloc] init];
            
        for (int i = 1; i <= parts; i++) {
            
            NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithCapacity:2];
            NSString *key = [NSString stringWithFormat:@"test%d", i];
            
            [dict setObject:self.testWorths[key] forKey:kTestWorth];
            
            // check scores dict if we have a score in there
            NSNumber *score = self.testScores[key];
            
            if (score) [dict setObject:score forKey:kScoreReceived];
            else [dict setObject:@(-1) forKey:kScoreReceived];
            
            [scores addObject:dict]; // add to dict
        }
    
        NSNumber *worth = [GCFinalGradeCalculator userNeedsIfFinalIsMultipartWithCurrentGrade:current andUserWants:desired andFinalWorth:weight andFinalParts:scores];
        
        if (worth) {
            // uialert the user
            title = @"Final Exam Score";
            message = [NSString stringWithFormat:@"In order to receive a %.2f%% in the class, you will need to get a %.2f%% on the remaining parts of the final.", desired, worth.doubleValue];
        } else {
            title = @"Unknown Error";
            message = @"There was an unknown error. Please try again.";
        }
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
}

@end
