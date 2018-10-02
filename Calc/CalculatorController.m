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
    randomNumber = 48,
    yPowerOfX = 51,
    twoPowerOfX = 52,
    logarithmY = 53,
    logarithmTwo = 54,
    arcSinus = 55,
    arcCosinus = 56,
    arcTangent = 57,
    hyperbolicArcSinus = 58,
    hyperbolicArcCosinus = 59,
    hyperbolicArcTangent = 50
};

@interface CalculatorController()

@property (strong, nonatomic) NSString* title;

@property (assign, nonatomic) BOOL operationEnter;
@property (assign, nonatomic) BOOL doubleOperation;
@property (assign, nonatomic) BOOL behindTheDecimal;
@property (assign, nonatomic) BOOL isOperationEntered;
@property (assign, nonatomic) BOOL isEnteredDot;
@property (assign, nonatomic) BOOL isButtonPressed;
@property (assign, nonatomic) BOOL isSecondDisplayButtonPressed;
@property (assign, nonatomic) BOOL isRadButtonPressed;

@property (assign, nonatomic) NSInteger operationUnary, operationBinary, operationTrigonometry;
@property (assign, nonatomic) NSInteger counter, dotCounter;
@property (assign, nonatomic) double inputDigitFirst, inputDigitSecond;

@property (strong, nonatomic) NSString* inputNumber;

@property (strong, nonatomic) CalcModel *model;
@property (weak, nonatomic) ViewController* view;

@end

@implementation CalculatorController

-(instancetype)init{
    self = [super init];
    if(self){
        _model = [[CalcModel alloc] init];
    }
    return self;
}
-(void) setOperand: (double)operand{
    self.inputDigitFirst = operand;
}

-(NSString*)allClearButton{
    _inputDigitFirst = 0;
    _inputDigitSecond = 0;
    _dotCounter = 0;
    _doubleOperation = NO;
    
    
    return @(_inputDigitFirst).stringValue;
}

-(NSString*)unaryOperationsButton:(NSInteger) buttonTag{
    _inputDigitFirst = _inputNumber.doubleValue;
    _operationUnary = buttonTag;
    switch (_operationUnary) {
        case inverse:
            if (_operationBinary) {
                _inputNumber = @([_model inverseOperation: _inputDigitFirst]).stringValue;
            } else{
                _inputNumber = @([_model inverseOperation: _inputDigitFirst]).stringValue;
            }
            break;
        case percent:
            _inputNumber = @([_model percentOperation: _inputDigitFirst]).stringValue;
            break;
        case square:
            _inputNumber = @([_model squareOperation: _inputDigitFirst]).stringValue;
            break;
        case cube:
            _inputNumber = @([_model cubeOperation: _inputDigitFirst]).stringValue;
            break;
        case exponentaPower:
            _inputNumber = @([_model exponentaPowerOperation: _inputDigitFirst]).stringValue;
            break;
        case tenPower:
            _inputNumber = @([_model twoPowerOfXOperation: _inputDigitFirst]).stringValue;
            break;
        case twoPowerOfX:
            _inputNumber = @([_model twoPowerOfXOperation:_inputDigitFirst]).stringValue;
        case oneDivideX:
            _inputNumber = @([_model oneDivideXOperation: _inputDigitFirst]).stringValue;
            break;
        case naturalLogarithm:
            _inputNumber = @([_model naturalLogarithmOperation: _inputDigitFirst]).stringValue;
            break;
        case tenLogarithm:
            _inputNumber = @([_model tenLogarithmOperation: _inputDigitFirst]).stringValue;
            break;
        case logarithmTwo:
            _inputNumber = @([_model twoLogarithmOperation:_inputDigitFirst]).stringValue;
        case factorial:
            _inputNumber = @([_model factorialOperation: _inputDigitFirst]).stringValue;
            break;
        case exponenta:
            _inputNumber= @([_model exponentaOperation]).stringValue;
            break;
        case pi:
            _inputNumber = @([_model piOperation]).stringValue;
            break;
        case randomNumber:
            _inputNumber = @([_model randomNumberOperation]).stringValue;
            break;
        case memoryClean:
            _inputNumber = @([_model memoryCleanOperation]).stringValue;
            break;
        case memoryRecall:
            _inputNumber = @([_model memoryRecallOperation]).stringValue;
            break;
    }
    _inputDigitFirst = _inputNumber.doubleValue;
    return _inputNumber;
}

-(NSString*) binaryOperationsButton:(NSInteger) buttonTag{
     _inputDigitFirst = _inputNumber.doubleValue;
    [_model setOperand:_inputDigitSecond];
    //    если дважды ввод операции
    if (_doubleOperation) {
        //        если нажато равно
        if (!_operationEnter) {
            switch (_operationBinary) {
                case logarithmY:
                    _inputNumber = @([_model yLogarithmOperation: _inputDigitFirst]).stringValue;
                    break;
                case yPowerOfX:
                    _inputNumber = @([_model yPowerOfXOperation: _inputDigitFirst]).stringValue;
                    break;
                case plus:
                    _inputNumber = @([_model operationPlus: _inputDigitFirst]).stringValue;
                    break;
                case minus:
                    _inputNumber = @([_model operationMinus: _inputDigitFirst]).stringValue;
                    break;
                case multiply:
                    _inputNumber = @([_model operationMultiply: _inputDigitFirst]).stringValue;
                    break;
                case divide:
                    _inputNumber = @([_model operationDivide: _inputDigitFirst]).stringValue;
                    break;
                case power:
                    _inputNumber = @([_model powerOperation: _inputDigitFirst]).stringValue;
                    break;
                case yRootOfX:
                    _inputNumber = @([_model yRootOfXOperation: _inputDigitFirst]).stringValue;
                    break;
                case EE:
                    _inputNumber = @([_model EEOperation: _inputDigitFirst]).stringValue;
                    break;
                case memoryAdd:
                    _inputNumber = @([_model memoryAddOperation: _inputDigitFirst]).stringValue;
                    break;
                case memorySubstract:
                    _inputNumber = @([_model memorySubstractOperation: _inputDigitFirst]).stringValue;
                    break;
                default:
                    break;
            }
        }
    }
    _inputDigitSecond = _inputDigitFirst;
    _operationBinary = buttonTag;
    _operationEnter = YES;
    _doubleOperation = YES;
    _inputDigitFirst = _inputNumber.doubleValue;
    
    return _inputNumber;
}

-(NSString*)trigonometryOperationsButton: (NSInteger) buttonTag{
    _operationTrigonometry = buttonTag;
    switch (_operationTrigonometry) {
        case sinus:
            _inputNumber = @([_model sinusOperation: _inputDigitFirst]).stringValue;
            break;
        case arcSinus:
            _inputNumber = @([_model arcsinOperation:_inputDigitFirst]).stringValue;
        case cosinus:
            _inputNumber = @([_model cosinusOperation: _inputDigitFirst]).stringValue;
            break;
        case arcCosinus:
            _inputNumber = @([_model arccosOperation:_inputDigitFirst]).stringValue;
        case tangent:
            _inputNumber = @([_model tangentOperation: _inputDigitFirst]).stringValue;
            break;
        case arcTangent:
            _inputNumber = @([_model arctangentOperation:_inputDigitFirst]).stringValue;
        case hyperbolicSinus:
            _inputNumber = @([_model hyperbolicSinusOperation: _inputDigitFirst]).stringValue;
            break;
        case hyperbolicArcSinus:
            _inputNumber = @([_model hyperbolicArcsinOperation:_inputDigitFirst]).stringValue;
        case hyperbolicCosinus:
            _inputNumber = @([_model hyperbolicCosinusOperation: _inputDigitFirst]).stringValue;
            break;
        case hyperbolicArcCosinus:
            _inputNumber = @([_model hyperbolicArccosOperation:_inputDigitFirst]).stringValue;
        case hyperbolicTangent:
            _inputNumber = @([_model hyperbolicTangentOperation: _inputDigitFirst]).stringValue;
            break;
        case hyperbolicArcTangent:
            _inputNumber = @([_model hyperbolicArctanOperation:_inputDigitFirst]).stringValue;
        default:
            break;
    }
    _inputDigitFirst = _inputNumber.doubleValue;
    return _inputNumber;
}

-(NSString*) enteredValueOperation:(NSInteger) buttonTag fromLabel:(NSString*)label{
    NSString *enteredValue = label;
    if (label != 0) {
        label = @" ";
        NSString *newResult = [NSString stringWithFormat:@"%@%@", enteredValue, @(buttonTag)];
        label = newResult;
        _inputNumber = newResult;
    }
    return _inputNumber;
}

- (NSString*)dotPressed:(NSInteger)buttonTag{
    _dotCounter++;
    if (_dotCounter == 1) {
        _title = [NSString stringWithFormat:@"%@.", _inputNumber];
        _isEnteredDot = YES;
    } else {
        _title = [NSString stringWithFormat:@"%@", _inputNumber];
    }
    return _title;
}

-(NSString*)swipeAction:(NSString*) receivedNumber{
    _inputNumber = receivedNumber;
    _inputDigitFirst = _inputNumber.doubleValue;
    return _inputNumber;
}

- (NSString*)numericButton:(NSInteger)buttonTag andLabel:(NSString*) label{
    
    //    нажато равно
    if (_operationEnter){
        
        _dotCounter = 0;
        _isOperationEntered = YES;
        
        _inputDigitSecond = _inputDigitFirst;
        _inputDigitFirst = 0;
        label = @" ";
        _operationEnter = NO;
    }
    
    //    если нажата точка
    if (_isEnteredDot && _isOperationEntered) {
            _inputDigitFirst = 0;
            _dotCounter = 0;
            _isEnteredDot = NO;
            _isOperationEntered = NO;
            [self enteredValueOperation:buttonTag fromLabel:label];
    } else {
        if (label.length < 7) {
            if ([label isEqualToString:@"0"]) {
                label = @"";
                _inputNumber = [self enteredValueOperation:buttonTag fromLabel:label];
            }else{
                _inputNumber = [self enteredValueOperation:buttonTag fromLabel:label];
            }
            return _inputNumber;
        } else{
            return _inputNumber;
        }
    }
    return _inputNumber;
}




@end
