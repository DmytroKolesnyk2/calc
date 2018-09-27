//
//  RoundViewController.m
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/27/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RoundViewController.h"

@implementation RoundViewController

@synthesize roundButton;

- (void)dealloc{
    self.roundButton = nil;
//    [super dealloc];
}

- (void)viewDidUnload{
    self.roundButton = nil;
    [super viewDidUnload];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self roundMyView:roundButton borderRadius:50.0f borderWidth:2.0f color:[UIColor blackColor]];
}

- (void)roundMyView:(UIView *)view
       borderRadius:(CGFloat)radius
        borderWidth:(CGFloat)border
              color:(UIColor *)color{
    
    CALayer* layer = [view layer];
    layer.masksToBounds = YES;
    layer.cornerRadius = radius;
    layer.borderWidth = border;
    layer.borderColor = color.CGColor;
}


@end
