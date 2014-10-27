//
//  GCUserGradeAfterFinalForm.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FXForms.h"

@interface GCUserGradeAfterFinalForm : NSObject <FXForm>

@property (nonatomic, strong) NSNumber *currentGrade;
@property (nonatomic, strong) NSNumber *finalGrade;
@property (nonatomic, strong) NSNumber *finalWeight;

@end
