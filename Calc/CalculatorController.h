//
//  CalculatorController.h
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/28/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

@interface CalculatorController : NSObject

-(void) setOperand: (double)operand;
-(NSString*)allClearButton;
-(NSString*)unaryOperationsButton:(NSInteger) buttonTag;
-(NSString*) binaryOperationsButton:(NSInteger) buttonTag;
-(NSString*)trigonometryOperationsButton: (NSInteger) buttonTag;
-(NSString*) enteredValueOperation:(NSInteger) buttonTag fromLabel:(NSString*)label;
-(NSString*)numericButton:(NSInteger)buttonTag andLabel:(NSString*) label;
-(NSString*)dotPressed:(NSInteger)buttonTag;

-(NSString*)swipeAction:(NSString*) receivedNumber;

@end
