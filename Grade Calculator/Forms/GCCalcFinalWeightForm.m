//
//  GCCalcFinalWeightForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCCalcFinalWeightForm.h"
#import "CustomButtonCell.h"

@implementation GCCalcFinalWeightForm

- (NSArray *)extraFields
{
    return @[
             @{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submitCalcFinalWeight:"}
             ];
}

- (NSDictionary *)pointsEnteredField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 1014 points)", FXFormFieldTitle: @"Total Points", FXFormFieldHeader: @"Gradebook (excluding final)"};
}

- (NSDictionary *)finalPointsField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 123 points)", FXFormFieldTitle: @"Possible Points", FXFormFieldHeader: @"Final"};
}

@end
