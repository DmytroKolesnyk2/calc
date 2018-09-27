//
//  CalcModel.m
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/12/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import "CalcModel.h"
#import <math.h>
#define DEGREES(radians) (radians * 180 / M_PI)
#define RADIANS(degrees) (degrees * M_PI / 180)

@interface CalcModel()

@property (assign, nonatomic) double accumulator;
@property (assign, nonatomic) double memory;

@end

@implementation CalcModel

-(void) setOperand: (double)operand{
    self.memory = operand;
    self.accumulator = operand;
}

double (^percentOperation)(double) = ^(double operand){
    return operand * 0.01;
};

-(double) percentOperation: (double) operand{
    return operand * 0.01;
}

-(double) inverseOperation: (double) operand{
    return -(operand);
}

-(double) squareOperation:(double)operand{
    return pow(operand, 2);
}

-(double) cubeOperation:(double)operand{
    return pow(operand, 3);
}

-(double)exponentaPowerOperation: (double) operand{
    return pow(M_E, operand);
}

-(double)tenPowerOperation: (double) operand{
    return pow(10, operand);
}

-(double)oneDivideXOperation: (double) operand{
    return 1 / operand;
}

-(double)squareRootOperation: (double) operand{
    return sqrt(operand);
}

-(double)cubeRootOperation: (double) operand{
    return  pow(operand, 1.0f/3.0f);
}

-(double)naturalLogarithmOperation: (double) operand{
    return log(operand);
}

-(double)tenLogarithmOperation: (double) operand{
    return log10(operand);
}

-(double)factorialOperation: (double) operand{
    return tgammaf(++operand);
}

-(double)sinusOperation: (double) operand{
    return sin(RADIANS(operand));
}

-(double)arcsinOperation: (double) operand{
    return DEGREES(asin(operand));
}

-(double)cosinusOperation: (double) operand{
    return cos(RADIANS(operand));
}

-(double)arccosOperation: (double) operand{
    return DEGREES(acos(operand));
}

-(double)tangentOperation: (double) operand{
    return tan(RADIANS(operand));
}

-(double)arctangentOperation: (double) operand{
    return DEGREES(atan(operand));
}

-(double)exponentaOperation{
    return M_E;
}

-(double)hyperbolicSinusOperation: (double) operand{
    return sinh(operand);
}

-(double)hyperbolicArcsinOperation: (double) operand{
    return DEGREES(asinh(operand));
}

-(double)hyperbolicCosinusOperation: (double) operand{
    return cosh(operand);
}

-(double)hyperbolicArccosOperation:(double)operand{
    return DEGREES(acosh(operand));
}

-(double)hyperbolicTangentOperation: (double) operand{
    return tanh(operand);
}

-(double)hyperbolicArctanOperation:(double)operand{
    return DEGREES(atanh(operand));
}

-(double)piOperation{
    return M_PI;
}
-(double)randomNumberOperation{
    return drand48();
}

-(double) operationPlus: (double) operand{
    return _accumulator + operand;
}

-(double) operationMinus: (double) operand{
    return _accumulator - operand;
}

-(double) operationDivide:(double)operand{
    return _accumulator / operand;
}

-(double) operationMultiply:(double)operand{
    return _accumulator * operand;
}

-(double) powerOperation:(double)operand{
    return pow(_accumulator, operand);
}

-(double) yRootOfXOperation:(double)operand{
    return  pow(_accumulator, 1.0f/operand);
}

-(double) EEOperation:(double)operand{
    return _accumulator * pow(10, operand);
}

-(double) memoryCleanOperation{
    _memory = 0;
    NSLog(@"memory: %f",_memory);
    NSLog(@"accumulator: %f", _accumulator);
    return _accumulator;
}

-(double) memoryAddOperation:(double)operand{
    _memory += operand;
    _accumulator += operand;
    NSLog(@"memory: %f",_memory);
    NSLog(@"accumulator: %f", _accumulator);
    return _accumulator;
}

-(double) memorySubstractOperation:(double)operand{
    _memory -= operand;
    _accumulator -= operand;
    NSLog(@"memory: %f",_memory);
    NSLog(@"accumulator: %f", _accumulator);
    return _accumulator;
}

-(double) memoryRecallOperation{
    _accumulator = _memory;
    NSLog(@"memory: %f",_memory);
    NSLog(@"accumulator: %f", _accumulator);
    return _accumulator;
}


-(double)yPowerOfXOperation:(double)operand{
    return pow(operand, _accumulator);
}

-(double)twoPowerOfXOperation:(double)operand{
    return pow(2, operand);
}

-(double)yLogarithmOperation:(double)operand{
    return log(_accumulator)/log(operand);
}

-(double)twoLogarithmOperation:(double)operand{
    return log2(operand);
}

-(double)result{
    return self.accumulator;
}

//-(NSString*)historyOfCalculator(NSString*) 

@end
