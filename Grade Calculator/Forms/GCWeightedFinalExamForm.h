//
//  GCWeightedFinalExamForm.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface GCWeightedFinalExamForm : NSObject <FXForm>

@property (nonatomic, strong) NSNumber *currentGrade;
@property (nonatomic, strong) NSNumber *desiredGrade;
@property (nonatomic, strong) NSNumber *finalWeight;

@end
