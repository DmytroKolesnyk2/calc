//
//  CalcModel.m
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/12/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import "CalcModel.h"

@interface CalcModel()

@property (assign, nonatomic) double accumulator;

@end

@implementation CalcModel

-(void) setOperand: (double)operand{
    self.accumulator = operand;
}

-(double) percentOperation: (double) operand{
    return operand * 0.01;
}

-(double) inverseOperation: (double) operand{
    return -(operand);
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

-(double)result{
    return self.accumulator;
}

@end
