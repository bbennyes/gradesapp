//
//  GCWeightedFinalExamForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCWeightedFinalExamForm.h"
#import "../CustomButtonCell.h"

@implementation GCWeightedFinalExamForm

- (NSDictionary *)currentGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 91.25%)", FXFormFieldTitle: @"Current Grade"};
}

- (NSDictionary *)desiredGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. at least 90.05%)", FXFormFieldTitle: @"Desired Grade"};
}

- (NSDictionary *)finalWeightField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 12.5%)", FXFormFieldTitle: @"Weight of Final"};
}

- (NSArray *)extraFields
{
    return @[
             @{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submitWeightedFinalExamForm:"}
             ];
}

@end
