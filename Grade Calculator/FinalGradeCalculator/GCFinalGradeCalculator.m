//
//  GCFinalGradeCalculator.m
//  Grade Calculator
//
//  Created by Nikhil Kalra on 6/8/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import "GCFinalGradeCalculator.h"

@implementation GCFinalGradeCalculator

+ (NSNumber *)userNeedsOnFinalWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andFinalWorth:(double)finalWorth
{
    // futureGrade = worth * score + (1 - worth) * currentGrade
    // futureGrade - (1 - worth) * currentGrade = worth * score
    // (futureGrade - (1 - worth) * currentGrade) / (worth) = score
    
    currentGrade = [self toDecimal:currentGrade];
    userWants = [self toDecimal:userWants];
    finalWorth = [self toDecimal:finalWorth];
    
    return [self toPercent:(userWants - (1 - finalWorth) * currentGrade) / finalWorth];
}

+ (NSNumber *)userGradeAfterFinalWithCurrentGrade:(double)currentGrade andExamGrade:(double)examGrade andFinalWorth:(double)finalWorth
{
    // futureGrade = worth * score + (1 - worth) * currentGrade
    
    currentGrade = [self toDecimal:currentGrade];
    examGrade = [self toDecimal:examGrade];
    finalWorth = [self toDecimal:finalWorth];
    
    return [self toPercent:finalWorth * examGrade + (1 - finalWorth) * currentGrade];
}

+ (NSDictionary *)userNeedsIfFinalIsTestWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andTestWeightage:(double)testWeightage andPointsInTestCategory:(double)pointsInTests andPossiblePointsInTestCategory:(double)possibleTestPoints andPossiblePointsOnFinal:(double)finalPossiblePoints
{
    // ((pointsInTest + score) / (possibleTestPoints + finalWorth)) - (pointsInTests / possibleTestPoints) = deltaTest
    // gradeAfterFinal  = currentGrade + deltaTest * testWeightage
    
    // userWants = currentGrade + deltaTest * testWeightage
    // userWants - currentGrade = deltaTest * testWeightage
    // (userWants - currentGrade) / TestWeightage = ((pointsInTests + score) / (possibleTestPoints + finalPossiblePoints)) - (pointsInTets / possibleTestPoints)
    // ((userWants - currentGrade) / testWeightage) + (pointsInTests / possibleTestPoints) = (pointsInTests + score) / (possibleTestPoints + finalPossiblePoints)
    // ((userWants - currentGrade) / testWeightage) + (pointsInTests / possibleTestPoints) * (possibleTestPoints + finalPossiblePoints) = (pointsInTests + score)
    // ((userWants - currentGrade) / testWeightage) + (pointsInTests / possibleTestPoints) * (possibleTestPoints + finalPossiblePoints) - pointsInTests = score
    
    
    currentGrade = [self toDecimal:currentGrade];
    userWants = [self toDecimal:userWants];
    testWeightage = [self toDecimal:testWeightage];
    
    double deltaGrade = userWants - currentGrade;
    double testGrade = pointsInTests / possibleTestPoints;
    
    double score = (possibleTestPoints + finalPossiblePoints) * ((deltaGrade / testWeightage) + testGrade) - pointsInTests;
    
    return @{kPercentNeeded: [self toPercent:score / finalPossiblePoints], kPointsNeeded: [self roundToTwoPlaces:score]};
}

+ (NSNumber *)userNeedsIfFinalIsMultipartWithCurrentGrade:(double)currentGrade andUserWants:(double)userWants andFinalWorth:(double)finalWorth andFinalParts:(NSArray *)parts
{
    double partsWorth = 0;
    double partsNotTakenWorth = 0;
    double scoreOnPartsTaken = 0;
    
    double totalUserNeeds = [[self userNeedsOnFinalWithCurrentGrade:currentGrade andUserWants:userWants andFinalWorth:finalWorth] doubleValue];
    
    for (NSDictionary *part in parts) {
        partsWorth += [part[kTestWorth] doubleValue];
        double score = [part[kScoreReceived] doubleValue];
        if (score >= 0) scoreOnPartsTaken += score;
        else partsNotTakenWorth += [part[kTestWorth] doubleValue];
    }
    
    return [self toPercent:((totalUserNeeds / 100) * partsWorth - scoreOnPartsTaken) / partsNotTakenWorth];
}

+ (NSNumber *)finalIsWorthWithPointsEntered:(double)pointsEntered andPointsOfFinal:(double)finalPoints
{
    return [self toPercent:finalPoints / (pointsEntered + finalPoints)];
}

+ (NSDictionary *)userNeedsIfFinalIsPointsWithPointsEntered:(double)pointsEntered andPointsOfFinal:(double)finalPoints andCurrentGrade:(double)currentGrade andUserWants:(double)userWants
{
    NSNumber *percent = [self userNeedsOnFinalWithCurrentGrade:currentGrade andUserWants:userWants andFinalWorth:[[self finalIsWorthWithPointsEntered:pointsEntered andPointsOfFinal:finalPoints] doubleValue]];
    NSNumber *points = [self roundToTwoPlaces:finalPoints * [percent doubleValue] / 100];
    
    return @{kPercentNeeded: percent, kPointsNeeded: points};
}

+ (double)toDecimal:(double)percent
{
    return percent / 100;
}

+ (NSNumber *)toPercent:(double)decimal
{
    double percent = decimal * 100;
    return [self roundToTwoPlaces:percent];
}

+ (NSNumber *)roundToTwoPlaces:(double)decimal
{
    double val = [[NSString stringWithFormat:@"%.2f", decimal] doubleValue];
    return [NSNumber numberWithDouble:val];
}

@end
