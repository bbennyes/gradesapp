//
//  GCUnweightedAssignmentForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCUnweightedAssignmentForm.h"
#import "CustomButtonCell.h"

@implementation GCUnweightedAssignmentForm

- (NSArray *)extraFields
{
    return @[
             @{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submitUnweightedAssignment:"}
             ];
}

- (NSDictionary *)currentGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 91.25%)", FXFormFieldTitle: @"Current Grade", FXFormFieldHeader: @"Grades"};
}

- (NSDictionary *)desiredGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. at least 90.00%)", FXFormFieldTitle: @"Desired Grade"};
}

- (NSDictionary *)pointsEnteredField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 1014 points)", FXFormFieldTitle: @"Total Points", FXFormFieldHeader: @"Gradebook (excluding item)"};
}

- (NSDictionary *)finalPointsField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 123 points)", FXFormFieldTitle: @"Possible Points", FXFormFieldHeader: @"Item"};
}

@end
