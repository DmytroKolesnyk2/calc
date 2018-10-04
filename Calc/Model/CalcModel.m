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

-(instancetype)init{
    self = [super init];
    if(self){
        self.memory = 0;
        self.accumulator = 0;
    }
    return self;
}

-(void) setOperand: (double)operand{
    self.memory = operand;
    self.accumulator = operand;
}

#pragma mark Basic unary operations

-(double) percentOperation: (double) operand{
    return operand * 0.01;
}

-(double) inverseOperation: (double) operand{
    return operand * -1;
}

#pragma mark Root and power operations

-(double) squareOperation:(double)operand{
    return pow(operand, 2);
}

-(double) cubeOperation:(double)operand{
    return pow(operand, 3);
}

-(double)tenPowerOperation: (double) operand{
    return pow(10, operand);
}

-(double)squareRootOperation: (double) operand{
    return sqrt(operand);
}

-(double)cubeRootOperation: (double) operand{
    return  pow(operand, 1.0f/3.0f);
}

-(double)exponentaPowerOperation: (double) operand{
    return pow(M_E, operand);
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

-(double)yPowerOfXOperation:(double)operand{
    return pow(operand, _accumulator);
}

-(double)twoPowerOfXOperation:(double)operand{
    return pow(2, operand);
}


#pragma mark Reciprocal operation

-(double)oneDivideXOperation: (double) operand{
    return 1 / operand;
}


#pragma Logarithm operations

-(double)naturalLogarithmOperation: (double) operand{
    return log(operand);
}

-(double)tenLogarithmOperation: (double) operand{
    return log10(operand);
}

-(double)yLogarithmOperation:(double)operand{
    return log(_accumulator)/log(operand);
}

-(double)twoLogarithmOperation:(double)operand{
    return log2(operand);
}

#pragma mark Factorial operation

-(double)factorialOperation: (double) operand{
    return tgammaf(++operand);
}

#pragma mark trigonometry operations in degrees

-(double)sinusOperationDegrees: (double) operand{
    return sin(RADIANS(operand));
}

-(double)arcsinOperationDegrees: (double) operand{
    return DEGREES(asin(operand));
}

-(double)cosinusOperationDegrees:(double)operand{
    return cos(RADIANS(operand));
}

-(double)arccosOperationDegrees: (double) operand{
    return DEGREES(acos(operand));
}

-(double)tangentOperationDegrees: (double) operand{
    return tan(RADIANS(operand));
}

-(double)arctangentOperationDegrees: (double) operand{
    return DEGREES(atan(operand));
}

-(double)hyperbolicSinusOperationDegrees: (double) operand{
    return sinh(operand);
}

-(double)hyperbolicArcsinOperationDegrees: (double) operand{
    return asinh(operand);
}

-(double)hyperbolicCosinusOperationDegrees: (double) operand{
    return cosh(operand);
}

-(double)hyperbolicArccosOperationDegrees:(double)operand{
    return acosh(operand);
}

-(double)hyperbolicTangentOperationDegrees: (double) operand{
    return tanh(operand);
}

-(double)hyperbolicArctanOperationDegrees:(double)operand{
    return atanh(operand);
}


#pragma mark Constant PI and E

-(double)exponentaOperation{
    return M_E;
}

-(double)piOperation{
    return M_PI;
}


#pragma mark Randomizer

-(double)randomNumberOperation{
    return drand48();
}

#pragma mark Basic binary operations

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

#pragma mark Trigonometry operations with radians

-(double)sinusOperationRadian:(double)operand{
    return sin(operand);
}

-(double)cosinusOperationRadian:(double)operand{
    return cos(operand);
}

-(double)tangentOperationRadian:(double)operand{
    return tan(operand);
}

-(double)arcsinOperationRadian: (double) operand{
    return asin(operand);
}

-(double)arccosOperationRadian: (double) operand{
    return acos(operand);
}

-(double)arctangentOperationRadian: (double) operand{
    return atan(operand);
}

-(double)hyperbolicSinusOperationRadian: (double) operand{
    return sinh(operand);
}

-(double)hyperbolicCosinusOperationRadian: (double) operand{
    return cosh(operand);
}

-(double)hyperbolicTangentOperationRadian: (double) operand{
    return tanh(operand);
}

-(double)hyperbolicArcsinOperationRadian: (double) operand{
    return asinh(operand);
}

-(double)hyperbolicArccosOperationRadian:(double)operand{
    return acosh(operand);
}

-(double)hyperbolicArctanOperationRadian:(double)operand{
    return atanh(operand);
}



#pragma mark MemoryOperations

-(double) memoryCleanOperation{
    _memory = 0;
    NSLog(@"memory: %f",_memory);
    NSLog(@"accumulator: %f", _accumulator);
    return _memory;
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
    return _memory;
}

-(double)result{
    return self.accumulator;
}

//-(NSString*)historyOfCalculator(NSString*) 

@end
