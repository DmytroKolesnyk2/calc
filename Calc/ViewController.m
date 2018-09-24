//
//  ViewController.m
//  Calc
//
//  Created by Guest Developer on 9/6/18.
//  Copyright © 2018 Guest Developer. All rights reserved.
//

#import "ViewController.h"
#import "CalcModel.h"

//операции для кейса по тагам
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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (assign, nonatomic) BOOL operationEnter;
@property (assign, nonatomic) BOOL doubleOperation;
@property (assign, nonatomic) BOOL behindTheDecimal;
@property (assign, nonatomic) BOOL isOperationEntered;
@property (assign, nonatomic) BOOL isEnteredPointer;
@property (assign, nonatomic) BOOL isButtonPressed;

//@property (assign, nonatomic) double memory;
@property (assign, nonatomic) NSInteger operation;
@property (assign, nonatomic) NSInteger counter, dotCounter;
@property (assign, nonatomic) double inputDigitX, inputDigitY;

@property (strong, nonatomic) CalcModel *calculator;

@end

@implementation ViewController

-(CalcModel *)calculator{
    if (!_calculator) {
        _calculator = [CalcModel new];
    }
    return _calculator;
}

//счетчик количества символов
//_counter = 0;


- (void)viewDidLoad {
    [self calculator];
    [super viewDidLoad];
    
}


//вывод на дисплей
- (void) displayTable{
    NSString *tableString = [NSString stringWithFormat: @"%g", _inputDigitX];
    
    [_displayLabel setText: tableString];
}


//полное очищение
- (IBAction)allClear:(UIButton *)button{
    _inputDigitX = 0;
    _inputDigitY = 0;
    //    _counter = 0;
    _dotCounter = 0;
    _doubleOperation = NO;
    
    [self displayTable];
    
}

//унарные операции ввода
- (void)unaryOperations:(UIButton *)button{
    _operation = [button tag];
    switch (_operation) {
        case inverse:
            _inputDigitX = [_calculator inverseOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case percent:
            _inputDigitX = [_calculator percentOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case square:
            _inputDigitX = [_calculator squareOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
        case cube:
            _inputDigitX = [_calculator cubeOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case naturalLogarithm:
            _inputDigitX = [_calculator naturalLogarithmOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case tenLogarithm:
            _inputDigitX = [_calculator tenLogarithmOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case factorial:
            _inputDigitX = [_calculator factorialOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case sinus:
            _inputDigitX = [_calculator sinusOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case cosinus:
            _inputDigitX = [_calculator sinusOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case exponenta:
            _inputDigitX = [_calculator exponentaOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case hyperbolicSinus:
            _inputDigitX = [_calculator sinusOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case hyperbolicCosinus:
            _inputDigitX = [_calculator hyperbolicCosinusOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case hyperbolicTangent:
            _inputDigitX = [_calculator sinusOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case pi:
            _inputDigitX = [_calculator piOperation: _inputDigitX];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case randomNumber:
            _inputDigitX = [_calculator randomNumberOperation];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case memoryClean:
            _inputDigitX = [_calculator memoryCleanOperation];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        case memoryRecall:
            _inputDigitX = [_calculator memoryRecallOperation];
            _displayLabel.text = @(_inputDigitX).stringValue;
            break;
        default:
            break;
    }
}

//бинарные операции ввода
- (IBAction)binaryOperation:(UIButton *)button{
    [_calculator setOperand:_inputDigitY];
    //    TODO: разобраться с сменой цвета кнопки при нажатии
//    if (!_isButtonPressed) {
//        button.backgroundColor = UIColor.grayColor;
//        _isButtonPressed = YES;
//    }
    //    если дважды ввод операции
    if (_doubleOperation) {
        //        если не нажато равно
        if (!_operationEnter) {
            switch (_operation) {
                case plus:
                    _inputDigitX = [_calculator operationPlus: _inputDigitX];
                    break;
                case minus:
                    _inputDigitX = [_calculator operationMinus: _inputDigitX];
                    break;
                case multiply:
                    _inputDigitX = [_calculator operationMultiply: _inputDigitX];
                    break;
                case divide:
                    _inputDigitX = [_calculator operationDivide: _inputDigitX];
                    break;
                case power:
                    _inputDigitX = [_calculator powerOperation: _inputDigitX];
                    break;
                case yRootOfX:
                    _inputDigitX = [_calculator yRootOfXOperation: _inputDigitX];
                    break;
                case EE:
                    _inputDigitX = [_calculator EEOperation: _inputDigitX];
                    break;
                
//                    неправильно выводит, переделать
//                case memoryClean:
//                    _inputDigitX = [_calculator memoryCleanOperation];
//                    break;
                case memoryAdd:
                    _inputDigitX = [_calculator memoryAddOperation: _inputDigitX];
                    break;
                case memorySubstract:
                    _inputDigitX = [_calculator memorySubstractOperation: _inputDigitX];
                    break;
//                case memoryRecall:
//                    _inputDigitX = [_calculator memoryRecallOperation];
//                    break;
                default:
                    break;
            }
        }
    }
    _inputDigitY = _inputDigitX;
//    _memory = _inputDigitY;
    _operation = [button tag];
    _operationEnter = YES;
    _doubleOperation = YES;
    
    [self displayTable];
}

//нажатие точки
- (IBAction)dotPressed:(UIButton*)button{
    _dotCounter++;
    if (_dotCounter == 1) {
        NSString *title = [NSString stringWithFormat:@"%@.", @(_inputDigitX).stringValue];
        _isEnteredPointer = YES;
        _displayLabel.text = title;
    }
}

//запись числа
-(void) enteredValue:(id) button{
    NSString *enteredValue = _displayLabel.text;
    NSString *newResult = [NSString stringWithFormat:@"%@%@", enteredValue, @([button tag])];
    _displayLabel.text = newResult;
    _inputDigitX = newResult.doubleValue;
}

//ввод числа
- (IBAction)num:(UIButton *)button{
    
    //    нажато равно
    if (_operationEnter){
        
        _dotCounter = 0;
        _isOperationEntered = YES;
//        _isButtonPressed = NO;
        
        //        _counter = 0;
        
        _inputDigitY = _inputDigitX;
        _inputDigitX = 0;
        _displayLabel.text = @" ";
        _operationEnter = NO;
    }
    
    //    если нажата точка
    if (_isEnteredPointer && _isOperationEntered) {
        _dotCounter = 0;
        _isEnteredPointer = NO;
        _isOperationEntered = NO;
        [self enteredValue:button];
    } else {
        if (_displayLabel.text.length < 6) {
            //            _counter++;
            [self enteredValue:button];
        } else{
            return;
        }
        
        [self displayTable];
        
    }
}

@end
