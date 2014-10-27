//
//  GCMultipartFinalForm.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCMultipartFinalForm.h"
#import "../CustomButtonCell.h"

@implementation GCMultipartFinalForm

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.numParts = @(0);
        self.numTaken = @(0);
    }
    return self;
}

- (NSArray *)fields
{
    return @[@"currentGrade", @"desiredGrade", @"finalWeight", @"numParts", @"numTaken"];
}

- (NSDictionary *)currentGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 92.5%)", FXFormFieldTitle: @"Current Grade", FXFormFieldHeader: @"Grades"};
}

- (NSDictionary *)desiredGradeField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. at least 91.44%)", FXFormFieldTitle: @"Desired Grade"};
}

- (NSDictionary *)finalWeightField
{
    return @{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 9.75%)", FXFormFieldTitle: @"Weight of Final", FXFormFieldHeader: @"Final Exam"};
}

- (NSDictionary *)numPartsField
{
    return @{FXFormFieldType: FXFormFieldTypeInteger, FXFormFieldTitle: @"Total Parts", FXFormFieldCell: [FXFormStepperCell class], FXFormFieldAction: @"refreshFields:"};
}

- (NSDictionary *)numTakenField
{
    return @{FXFormFieldType: FXFormFieldTypeInteger, FXFormFieldTitle: @"Parts Taken", FXFormFieldCell: [FXFormStepperCell class], FXFormFieldAction: @"refreshFields:"};
}

- (NSArray *)extraFields
{
    int numParts = [self.numParts intValue];
    int numTaken = [self.numTaken intValue];
    
    NSMutableArray *fields = [NSMutableArray arrayWithCapacity:(numParts + numTaken)];
    
//    if (numTaken <= numParts) {
        for (int i = 1; i <= numParts; i++) {
            NSString *header = [NSString stringWithFormat:@"Final (Part %d)", i];
            NSString *key = [NSString stringWithFormat:@"test%d", i];
            [fields addObject:@{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 123 points)", FXFormFieldTitle: @"Possible Points", FXFormFieldHeader: header, FXFormFieldKey: key, FXFormFieldAction: @"saveTestWorth:"}];
            if (i <= numTaken) {
                [fields addObject:@{FXFormFieldType: FXFormFieldTypeFloat, FXFormFieldPlaceholder: @"(e.g. 91.43 points)", FXFormFieldTitle: @"Points Earned", FXFormFieldKey: key, FXFormFieldAction: @"saveTestScore:"}];
            }
        }
//    }
    
    [fields addObject:@{FXFormFieldCell: [CustomButtonCell class], FXFormFieldHeader: @"", FXFormFieldAction: @"submtMultipartForm:"}];
    
    return fields;
}
@end
