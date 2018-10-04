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

-(void)setOperand: (double)operand;

-(double)percentOperation: (double) operand;
-(double)inverseOperation: (double) operand;

-(double)squareOperation: (double) operand;
-(double)cubeOperation: (double) operand;
-(double)powerOperation: (double) operand;
-(double)exponentaPowerOperation: (double) operand;
-(double)tenPowerOperation: (double) operand;
-(double)yRootOfXOperation: (double) operand;
-(double)squareRootOperation: (double) operand;
-(double)cubeRootOperation: (double) operand;
-(double)EEOperation: (double) operand;
-(double)yPowerOfXOperation: (double) operand;
-(double)twoPowerOfXOperation: (double) operand;

-(double)oneDivideXOperation: (double) operand;

-(double)naturalLogarithmOperation: (double) operand;
-(double)tenLogarithmOperation: (double) operand;

-(double)factorialOperation: (double) operand;

-(double)sinusOperationDegrees: (double) operand;
-(double)cosinusOperationDegrees: (double) operand;
-(double)tangentOperationDegrees: (double) operand;
-(double)hyperbolicSinusOperationDegrees: (double) operand;
-(double)hyperbolicCosinusOperationDegrees: (double) operand;
-(double)hyperbolicTangentOperationDegrees: (double) operand;

-(double)exponentaOperation;
-(double)piOperation;
-(double)randomNumberOperation;

-(double)operationPlus: (double) operand;
-(double)operationMinus: (double) operand;
-(double)operationDivide:(double)operand;
-(double)operationMultiply:(double)operand;

-(double)memoryCleanOperation;
-(double)memoryAddOperation: (double) operand;
-(double)memorySubstractOperation: (double) operand;
-(double)memoryRecallOperation;


-(double)sinusOperationRadian: (double) operand;
-(double)cosinusOperationRadian: (double) operand;
-(double)tangentOperationRadian: (double) operand;
-(double)hyperbolicSinusOperationRadian: (double) operand;
-(double)hyperbolicCosinusOperationRadian: (double) operand;
-(double)hyperbolicTangentOperationRadian: (double) operand;

//second displays button
-(double)arcsinOperationDegrees: (double) operand;
-(double)arccosOperationDegrees: (double) operand;
-(double)arctangentOperationDegrees: (double) operand;
-(double)hyperbolicArcsinOperationDegrees: (double) operand;
-(double)hyperbolicArccosOperationDegrees:(double)operand;
-(double)hyperbolicArctanOperationDegrees:(double)operand;

-(double)arcsinOperationRadian: (double) operand;
-(double)arccosOperationRadian: (double) operand;
-(double)arctangentOperationRadian: (double) operand;
-(double)hyperbolicArcsinOperationRadian: (double) operand;
-(double)hyperbolicArccosOperationRadian:(double)operand;
-(double)hyperbolicArctanOperationRadian:(double)operand;




-(double)twoLogarithmOperation: (double) operand;
-(double)yLogarithmOperation: (double) operand;




@end

