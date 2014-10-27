//
//  GCUnweightedAssignmentForm.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/11/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXForms.h"

@interface GCUnweightedAssignmentForm : NSObject <FXForm>

@property (nonatomic, strong) NSNumber *currentGrade;
@property (nonatomic, strong) NSNumber *desiredGrade;
@property (nonatomic, strong) NSNumber *finalPoints;
@property (nonatomic, strong) NSNumber *pointsEntered;

@end
