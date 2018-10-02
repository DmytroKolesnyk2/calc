//
//  ViewController.h
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/7/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
}

- (IBAction)unaryOperations:(UIButton *)button;
- (IBAction)allClear:(UIButton *)button;
- (IBAction)binaryOperation:(UIButton *)button;
- (IBAction)secondPartOfScreenButton:(UIButton *)button;
- (IBAction)numericButtons:(UIButton *)button;
- (IBAction)dotPressed:(UIButton*)button;
- (IBAction)trigonometryOperations: (UIButton*) button;
- (IBAction)swipeLeftForDeleteLastEnteredNumberAction:(UISwipeGestureRecognizer*) swipe;


@end

