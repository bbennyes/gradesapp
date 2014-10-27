//
//  GCFinalGradeCalculator.h
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/8/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <Foundation/Foundation.h>

static const NSString *kPercentNeeded = @"kPercentNeeded";
static const NSString *kPointsNeeded = @"kPointsNeeded";

static const NSString *kTestWorth = @"kTestWorth";
static const NSString *kScoreReceived = @"kScoreReceived";

@interface GCFinalGradeCalculator : NSObject

+ (NSNumber *)userNeedsOnFinalWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andFinalWorth:(double)finalWorth;

+ (NSNumber *)userGradeAfterFinalWithCurrentGrade:(double)currentGrade andExamGrade:(double)examGrade andFinalWorth:(double)finalWorth;

+ (NSNumber *)userNeedsIfFinalIsMultipartWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andFinalWorth:(double)finalWorth andFinalParts:(NSArray *)parts;

+ (NSDictionary *)userNeedsIfFinalIsTestWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andTestWeightage:(double)testWeightage andPointsInTestCategory:(double)pointsInTests andPossiblePointsInTestCategory:(double)possibleTestPoints andPossiblePointsOnFinal:(double)finalPossiblePoints;

+ (NSNumber *)finalIsWorthWithPointsEntered:(double)pointsEntered andPointsOfFinal:(double)finalPoints;

+ (NSDictionary *)userNeedsIfFinalIsPointsWithPointsEntered:(double)pointsEntered andPointsOfFinal:(double)finalPoints andCurrentGrade:(double)currentGrade andUserWants:(double)userWants;

@end
