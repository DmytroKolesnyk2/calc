//
//  ViewController.m
//  Calc
//
//  Created by Guest Developer on 9/6/18.
//  Copyright © 2018 Guest Developer. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (strong, nonatomic) CalculatorController *controller;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _controller = [[CalculatorController alloc] initWithView:self];
    self.displayLabel.userInteractionEnabled = YES;
}

//полное очищение
- (IBAction)allClear:(UIButton *)button{
    _displayLabel.text = [_controller allClearButton];
}

//унарные операции ввода
- (IBAction)unaryOperations:(UIButton *)button{
    _displayLabel.text = [_controller unaryOperationsButton:[button tag]];
}

-(IBAction)binaryOperation:(UIButton *)button{
    _displayLabel.text = [_controller binaryOperationsButton:[button tag]];
}

-(IBAction)trigonometryOperations: (UIButton*) button{
    _displayLabel.text = [_controller trigonometryOperationsButton:[button tag]];
}

-(void)buttonSelectedMethod:(UIButton*)button{
    if (!button.isSelected) {
        [button setSelected: YES];
        button.backgroundColor = UIColor.lightGrayColor;
        button.tintColor = UIColor.lightGrayColor;
    } else {
        [button setSelected: NO];
        button.backgroundColor = UIColor.viewFlipsideBackgroundColor;
        button.tintColor = UIColor.viewFlipsideBackgroundColor;
    }
}

- (IBAction)secondPartOfScreenButton:(UIButton *)button {
    [self buttonSelectedMethod:button];
    [_controller secondButton];
    [self changeButtonState: button];
}

- (void) changeButtonState: (UIButton*)button {
    
    NSArray *array = @[@29, @30, @35, @36, @38, @39, @40, @44, @45, @46];
    
    for (NSNumber* buttonTag in array) {
        button = [self.view viewWithTag: buttonTag.integerValue];
        
        if (!button.isSelected) {
            [button setSelected:YES];
            button.tintColor = UIColor.viewFlipsideBackgroundColor;
            [button setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
        } else {
            [button setSelected:NO];
        }
    }
}

-(IBAction)radianToDegreesAndViceVersaButton:(UIButton *)button{
    [self buttonSelectedMethod:button];
    [_controller radianPressed];
    
}

//нажатие точки
- (IBAction)dotPressed:(UIButton*)button{
    _displayLabel.text = [_controller dotPressed:[button tag]];
}

- (IBAction)swipeLeftForDeleteLastEnteredNumberAction:(UISwipeGestureRecognizer*) swipe{
    if (swipe.direction == UISwipeGestureRecognizerDirectionLeft && [_displayLabel.text length] > 0){
        _displayLabel.text = [_displayLabel.text substringToIndex:[_displayLabel.text length]-1];
        [_controller swipeAction:_displayLabel.text];
    }
}

//ввод числа
- (IBAction)numericButtons:(UIButton *)button{
        _displayLabel.text =  [_controller numericButton:[button tag] andLabel:_displayLabel.text];
}

@end
