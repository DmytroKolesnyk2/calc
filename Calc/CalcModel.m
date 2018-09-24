//
//  CalcModel.m
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/12/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import "CalcModel.h"
#import <math.h>

@interface CalcModel()

@property (assign, nonatomic) double accumulator;
@property (assign, nonatomic) double memory;

@end

@implementation CalcModel

-(void) setOperand: (double)operand{
    self.memory = operand;
    self.accumulator = operand;
}

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
    return sin(operand);
}

-(double)cosinusOperation: (double) operand{
    return cos(operand);
}

-(double)tangentOperation: (double) operand{
    return tan(operand);
}

-(double)exponentaOperation: (double) operand{
    return M_E;
}

-(double)hyperbolicSinusOperation: (double) operand{
    return sinh(operand);
}

-(double)hyperbolicCosinusOperation: (double) operand{
    return cosh(operand);
}

-(double)hyperbolicTangentOperation: (double) operand{
    return tanh(operand);
}

-(double)piOperation: (double) operand{
    return M_PI;
}
-(double)randomNumberOperation{
    //Спросить по поводу time
//    srand48(time(0));
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


-(double)result{
    return self.accumulator;
}

@end
