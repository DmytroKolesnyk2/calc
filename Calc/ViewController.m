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
@property (assign, nonatomic) BOOL isSecondDisplayButtonPressed;
@property (assign, nonatomic) BOOL isRadButtonPressed;

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

- (void)viewDidLoad {
    [self calculator];
    [super viewDidLoad];
    self.displayLabel.userInteractionEnabled = YES;
}


//вывод на дисплей
- (void) displayTable{
    NSString *tableString = [NSString stringWithFormat: @"%g", _inputDigitX];
    
    [_displayLabel setText: tableString];
}

-(void) labelText{
     _displayLabel.text = @(_inputDigitX).stringValue;
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
- (IBAction)unaryOperations:(UIButton *)button{
    _operation = [button tag];
    switch (_operation) {
        case inverse:
            _inputDigitX = [_calculator inverseOperation: _inputDigitX];
            break;
        case percent:
            _inputDigitX = [_calculator percentOperation: _inputDigitX];
            break;
        case square:
            _inputDigitX = [_calculator squareOperation: _inputDigitX];
            break;
        case cube:
            _inputDigitX = [_calculator cubeOperation: _inputDigitX];
            break;
        case exponentaPower:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator yPowerOfXOperation:_inputDigitX] : [_calculator exponentaPowerOperation: _inputDigitX];
            break;
        case tenPower:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator twoPowerOfXOperation:_inputDigitX] : [_calculator twoPowerOfXOperation: _inputDigitX];
            break;
        case oneDivideX:
            _inputDigitX = [_calculator oneDivideXOperation: _inputDigitX];
            break;
        case naturalLogarithm:
            if (!_isSecondDisplayButtonPressed) {
                _inputDigitX = [_calculator naturalLogarithmOperation: _inputDigitX];
            }
            break;
        case tenLogarithm:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator twoLogarithmOperation:_inputDigitX] : [_calculator tenLogarithmOperation: _inputDigitX];
            break;
        case factorial:
            _inputDigitX = [_calculator factorialOperation: _inputDigitX];
            break;
        case exponenta:
            _inputDigitX = [_calculator exponentaOperation];
            break;
        case pi:
            _inputDigitX = [_calculator piOperation];
            break;
        case randomNumber:
            _inputDigitX = [_calculator randomNumberOperation];
            break;
        case memoryClean:
            _inputDigitX = [_calculator memoryCleanOperation];
            break;
        case memoryRecall:
            _inputDigitX = [_calculator memoryRecallOperation];
            break;
    }
    [self labelText];
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
                case naturalLogarithm:
                    if (_isSecondDisplayButtonPressed) {
                        _inputDigitX = [_calculator yLogarithmOperation: _inputDigitX];
                    }
                break;
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
                case memoryAdd:
                    _inputDigitX = [_calculator memoryAddOperation: _inputDigitX];
                    break;
                case memorySubstract:
                    _inputDigitX = [_calculator memorySubstractOperation: _inputDigitX];
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

-(IBAction)trigonometryOperations: (UIButton*) button{
    _operation = [button tag];
    switch (_operation) {
        case sinus:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator arcsinOperation:_inputDigitX] : [_calculator sinusOperation: _inputDigitX];
            break;
        case cosinus:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator arccosOperation:_inputDigitX] : [_calculator cosinusOperation: _inputDigitX];
            break;
        case tangent:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator arctangentOperation:_inputDigitX] : [_calculator tangentOperation: _inputDigitX];
            break;
        case hyperbolicSinus:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator hyperbolicArcsinOperation:_inputDigitX] : [_calculator hyperbolicSinusOperation: _inputDigitX];
            break;
        case hyperbolicCosinus:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator hyperbolicArccosOperation:_inputDigitX] : [_calculator hyperbolicCosinusOperation: _inputDigitX];
            break;
        case hyperbolicTangent:
            _inputDigitX = _isSecondDisplayButtonPressed ? [_calculator hyperbolicArctanOperation:_inputDigitX] : [_calculator hyperbolicTangentOperation: _inputDigitX];
            break;
        default:
            break;
    }
    [self labelText];
}

- (IBAction)secondPartOfScreenButton:(UIButton *)button {
    if (!_isSecondDisplayButtonPressed) {
        button.backgroundColor = UIColor.grayColor;
        [self changeButtonTitle: button];
        _isSecondDisplayButtonPressed = YES;
    } else {
        button.backgroundColor = UIColor.viewFlipsideBackgroundColor;
        [self changeButtonTitle: button];
        _isSecondDisplayButtonPressed = NO;
    }
}

-(void) changeTitle: (NSString*) title ForButton: (UIButton*) button ForState: (UIControlState) state{
//    NSDictionary *dictionaryTag = [NSDictionary dictionaryWithObjects:array forKeys:title count:2];
    return [button setTitle: title forState:UIControlStateNormal];
}

- (void) changeButtonTitle: (UIButton*)button {
    NSArray *array = @[@29, @30, @35, @36, @38, @39, @40, @44, @45, @46];
    for (NSNumber* buttonTag in array) {
            button = [self.view viewWithTag: buttonTag.integerValue];
            [self changeTitle:@" " ForButton:button ForState:UIControlStateSelected];
            switch ([button tag]) {
                case exponentaPower:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"yˣ" : @"eˣ") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case tenPower:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"2ˣ" : @"10ˣ") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case naturalLogarithm:
                     [self changeTitle:(!_isSecondDisplayButtonPressed ? @"log𝙮" : @"ln") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case tenLogarithm:
                     [self changeTitle:(!_isSecondDisplayButtonPressed ? @"log₂" : @"log₁₀") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case sinus:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"asin" : @"sin") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case cosinus:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"acos" : @"cos") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case tangent:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"atan" : @"tan") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case hyperbolicSinus:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"asinh" : @"asin") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case hyperbolicCosinus:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"acosh" : @"acos") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
                case hyperbolicTangent:
                    [self changeTitle:(!_isSecondDisplayButtonPressed ? @"atanh" : @"tanh") ForButton:button ForState:(!_isSecondDisplayButtonPressed ? UIControlStateSelected : UIControlStateNormal)];
                    break;
        }
    }
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

- (IBAction)swipeLeftForDeleteLastEnteredNumberAction:(UISwipeGestureRecognizer*) swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft && [_displayLabel.text length] > 0){
        _displayLabel.text = [_displayLabel.text substringToIndex:[_displayLabel.text length]-1];
        _inputDigitX = _displayLabel.text.doubleValue;
    }
}

//- (IBAction)changeRadiansToDegrees:(UIButton *)button {
//    if (!_isRadButtonPressed){
//
//    }
//}


//ввод числа
- (IBAction)num:(UIButton *)button{
    
    //    нажато равно
    if (_operationEnter){
        
        _dotCounter = 0;
        _isOperationEntered = YES;
//        _isButtonPressed = NO;
        
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
            [self enteredValue:button];
        } else{
            return;
        }
        
        [self displayTable];
        
    }
}



@end
