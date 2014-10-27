//
//  GCUserGradeAfterFinalForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCUserGradeAfterFinalForm.h"
#import "CustomButtonCell.h"

@implementation GCUserGradeAfterFinalForm

- (NSArray *)extraFields
{
    return @[
             @{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submitCalcFinalGrade:"}
             ];
}

- (NSDictionary *)currentGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 90.5%)", FXFormFieldTitle: @"Current Grade", FXFormFieldHeader: @"Gradebook (excluding final)"};
}

- (NSDictionary *)finalGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 85%)", FXFormFieldTitle: @"Final Exam Grade", FXFormFieldHeader: @"Final Exam"};
}

- (NSDictionary *)finalWeightField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 12%)", FXFormFieldTitle: @"Final Exam Weight"};
}

@end
