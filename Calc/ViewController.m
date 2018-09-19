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
};

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayLabel;
@property (assign, nonatomic) NSInteger operation;
@property (assign, nonatomic) BOOL operationEnter;
@property (assign, nonatomic) BOOL doubleOperation;
@property (assign, nonatomic) BOOL behindTheDecimal;
@property (assign, nonatomic) BOOL isOperationEntered;

@property (assign, nonatomic) int counter, dotCounter;
@property (assign, nonatomic) double inputDigitX, inputDigitY;
@property (assign, nonatomic) BOOL isEnteredPointer;
@property (assign, nonatomic)NSInteger a;
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
_counter = 0;

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
- (IBAction)allClear:(id)button{
    
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
        default:
            break;
    }
}

//бинарные операции ввода
- (IBAction)operation:(id)button{
    [_calculator setOperand:_inputDigitY];
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
                default:
                    break;
            }
        }
    }
    _inputDigitY = _inputDigitX;
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
- (IBAction)num:(id)button{
    
    //    нажато равно
    if (_operationEnter){
        
        _dotCounter = 0;
        _isOperationEntered = YES;
        
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
