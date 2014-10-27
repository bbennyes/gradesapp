//
//  Grade_CalculatorTests.m
//  Grade CalculatorTests
//
//  Created by Nikhil Kalra on 6/8/14.
//  Copyright (c) 2014 Nikhil Kalra. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GCFinalGradeCalculator.h"

@interface GCFinalGradeCalculator_Grade_CalculatorTests : XCTestCase
@end

@implementation GCFinalGradeCalculator_Grade_CalculatorTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testUserNeedsOnFinalWithCurrentGrade
{
    double userNeeds = [[GCFinalGradeCalculator userNeedsOnFinalWithCurrentGrade:93.46 andUserWants:89.5 andFinalWorth:12] doubleValue];
    XCTAssertEqual(userNeeds, 60.46);
}

- (void)testUserGradeAfterFinal
{
    double userGrade = [[GCFinalGradeCalculator userGradeAfterFinalWithCurrentGrade:93.46 andExamGrade:60.46 andFinalWorth:12] doubleValue];
    XCTAssertEqual(userGrade, 89.5);
}

- (void)testUserMultipartFinalGrade
{
    NSDictionary *part1 = @{kTestWorth: [NSNumber numberWithInt:100], kScoreReceived: [NSNumber numberWithInt:75]};
    NSDictionary *part2 = @{kTestWorth: [NSNumber numberWithInt:200], kScoreReceived: [NSNumber numberWithInt:150]};
    NSDictionary *part3 = @{kTestWorth: [NSNumber numberWithInt:300], kScoreReceived: [NSNumber numberWithInt:-1]};
    NSDictionary *part4 = @{kTestWorth: [NSNumber numberWithInt:400], kScoreReceived: [NSNumber numberWithInt:-1]};
    
    double userGrade = [[GCFinalGradeCalculator userNeedsIfFinalIsMultipartWithCurrentGrade:95 andUserWants:90 andFinalWorth:10 andFinalParts:@[part1, part2, part3, part4]] doubleValue];
    XCTAssertEqual(userGrade, 32.14);
}

- (void)testUserNeedsIfFinalIsTest
{
    NSDictionary *userNeeds = [GCFinalGradeCalculator userNeedsIfFinalIsTestWithCurrentGrade:95 andUserWants:90 andTestWeightage:20 andPointsInTestCategory:300 andPossiblePointsInTestCategory:400 andPossiblePointsOnFinal:100];
    XCTAssertEqual([userNeeds[kPercentNeeded] doubleValue], -50);
    XCTAssertEqual([userNeeds[kPointsNeeded] doubleValue], -50);
}

- (void)testFinalIsWorth
{
    double finalWorth = [[GCFinalGradeCalculator finalIsWorthWithPointsEntered:1633 andPointsOfFinal:274] doubleValue];
    XCTAssertEqual(finalWorth, 14.37);
}

- (void)testUserNeedsIfFinalIsPoints
{
    NSDictionary *userNeeds = [GCFinalGradeCalculator userNeedsIfFinalIsPointsWithPointsEntered:200 andPointsOfFinal:100 andCurrentGrade:100 andUserWants:90];
    XCTAssertEqual([userNeeds[kPercentNeeded] doubleValue], 70);
    XCTAssertEqual([userNeeds[kPointsNeeded] doubleValue], 70);
}

@end
