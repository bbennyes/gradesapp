//
//  GCWeightedAssignmentForm.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface GCWeightedAssignmentForm : NSObject <FXForm>

@property (nonatomic, strong) NSNumber *currentGrade;
@property (nonatomic, strong) NSNumber *desiredGrade;
@property (nonatomic, strong) NSNumber *possiblePointsOnAssignment;
@property (nonatomic, strong) NSNumber *assignmentWeight;
@property (nonatomic, strong) NSNumber *pointsInAssignmentCategory;
@property (nonatomic, strong) NSNumber *possiblePointsInAssignmentCategory;

@end
