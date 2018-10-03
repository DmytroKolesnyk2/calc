//
//  CalcModel.h
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/12/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CalcModel : NSObject

@property (assign, nonatomic, readonly) double result;

-(double)percentOperation: (double) operand;
-(double)inverseOperation: (double) operand;
-(double)squareOperation: (double) operand;
-(double)cubeOperation: (double) operand;
-(double)powerOperation: (double) operand;
-(double)exponentaPowerOperation: (double) operand;
-(double)tenPowerOperation: (double) operand;
-(double)oneDivideXOperation: (double) operand;
-(double)squareRootOperation: (double) operand;
-(double)cubeRootOperation: (double) operand;
-(double)yRootOfXOperation: (double) operand;
-(double)naturalLogarithmOperation: (double) operand;
-(double)tenLogarithmOperation: (double) operand;
-(double)factorialOperation: (double) operand;
-(double)sinusOperation: (double) operand;
-(double)cosinusOperation: (double) operand;
-(double)tangentOperation: (double) operand;
-(double)exponentaOperation;
-(double)hyperbolicSinusOperation: (double) operand;
-(double)hyperbolicCosinusOperation: (double) operand;
-(double)hyperbolicTangentOperation: (double) operand;
-(double)piOperation;
-(double)randomNumberOperation;
-(double)operationPlus: (double) operand;
-(double) operationMinus: (double) operand;
-(double) operationDivide:(double)operand;
-(double) operationMultiply:(double)operand;
-(double) EEOperation: (double) operand;
-(void)setOperand: (double)operand;
-(double) memoryCleanOperation;
-(double) memoryAddOperation: (double) operand;
-(double) memorySubstractOperation: (double) operand;
-(double) memoryRecallOperation;


//second displays button
-(double)arcsinOperation: (double) operand;
-(double)arccosOperation: (double) operand;
-(double)arctangentOperation: (double) operand;
-(double)hyperbolicArcsinOperation: (double) operand;
-(double)hyperbolicArccosOperation:(double)operand;
-(double)hyperbolicArctanOperation:(double)operand;
-(double)yPowerOfXOperation: (double) operand;
-(double)twoPowerOfXOperation: (double) operand;
-(double)twoLogarithmOperation: (double) operand;
-(double)yLogarithmOperation: (double) operand;




@end

