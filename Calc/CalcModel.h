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
-(double)operationPlus: (double) operand;
-(double) operationMinus: (double) operand;
-(double) operationDivide:(double)operand;
-(double) operationMultiply:(double)operand;
-(void)setOperand: (double)operand;

@end

