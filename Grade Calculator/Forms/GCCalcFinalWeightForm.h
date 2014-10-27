//
//  GCCalcFinalWeightForm.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/13/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FXForms.h"

@interface GCCalcFinalWeightForm : NSObject <FXForm>

@property (nonatomic, strong) NSNumber *finalPoints;
@property (nonatomic, strong) NSNumber *pointsEntered;

@end
