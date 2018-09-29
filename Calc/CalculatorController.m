//
//  CalculatorController.m
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/28/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculatorController.h"
#import "CalcModel.h"
#import "ViewController.h"

enum{
    inverse = 11,
    percent = 12,
    divide = 13,
    multiply = 14,
    minus = 15,
    plus = 16,
    memoryClean = 21,
    memoryAdd = 22,
    memorySubstract = 23,
    memoryRecall = 24,
    square = 26,
    cube = 27,
    power = 28,
    exponentaPower = 29,
    tenPower = 30,
    oneDivideX = 31,
    squareRoot = 32,
    cubeRoot = 33,
    yRootOfX = 34,
    naturalLogarithm = 35,
    tenLogarithm = 36,
    factorial  = 37,
    sinus = 38,
    cosinus = 39,
    tangent = 40,
    exponenta = 41,
    EE = 42,
    hyperbolicSinus = 44,
    hyperbolicCosinus = 45,
    hyperbolicTangent = 46,
    pi = 47,
    randomNumber = 48
};

@interface CalculatorController()

@property (assign, nonatomic) BOOL operationEnter;
@property (assign, nonatomic) BOOL doubleOperation;
@property (assign, nonatomic) BOOL behindTheDecimal;
@property (assign, nonatomic) BOOL isOperationEntered;
@property (assign, nonatomic) BOOL isEnteredPointer;
@property (assign, nonatomic) BOOL isButtonPressed;
@property (assign, nonatomic) BOOL isSecondDisplayButtonPressed;
@property (assign, nonatomic) BOOL isRadButtonPressed;

@property (assign, nonatomic) NSInteger operation;
@property (assign, nonatomic) NSInteger counter, dotCounter;
@property (assign, nonatomic) double inputDigitX, inputDigitY;

@property (strong, nonatomic) CalcModel *calculator;

@end

@implementation CalculatorController

-(NSString*)allClearButton{
    _inputDigitX = 0;
    _inputDigitY = 0;
    _dotCounter = 0;
    _doubleOperation = NO;
    
    
    return @(_inputDigitX).stringValue;
}

@end
