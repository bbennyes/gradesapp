//
//  GCWeightedAssignmentForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCWeightedAssignmentForm.h"
#import "CustomButtonCell.h"

@implementation GCWeightedAssignmentForm

- (NSArray *)extraFields
{
    return @[
             @{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submitWeightedAssignment:"}
             ];
}

- (NSDictionary *)currentGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 91.27%)", FXFormFieldTitle: @"Current Grade", FXFormFieldHeader: @"Grades"};
}

- (NSDictionary *)desiredGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. at least 90.04%)", FXFormFieldTitle: @"Desired Grade"};
}

- (NSDictionary *)assignmentWeightField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 21.34%)", FXFormFieldTitle: @"Category Weight", FXFormFieldHeader: @"Item Category (Excluding the Item's Points)"};
}

- (NSDictionary *)pointsInAssignmentCategoryField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 962 points)", FXFormFieldTitle: @"Points Earned"};
}

- (NSDictionary *)possiblePointsInAssignmentCategoryField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 1014 points)", FXFormFieldTitle: @"Possible Points"};
}

- (NSDictionary *)possiblePointsOnAssignmentField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g 123 points)", FXFormFieldTitle: @"Possible Points", FXFormFieldHeader: @"Item (Assignment, Test, Final, etc.)"};
}

@end
