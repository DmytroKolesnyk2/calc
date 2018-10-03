//
//  RoundViewController.h
//  Calc
//
//  Created by Dmitriy Kolesnyk on 9/27/18.
//  Copyright © 2018 Dmitriy Kolesnyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface RoundViewController : UIViewController{
    UIButton *roundButton;
}

@property (nonatomic, retain) IBOutlet UIButton *roundButton;

- (void)roundMyView: (UIView*) view
        borderRadius: (CGFloat) radius
         borderWidth: (CGFloat) border
              color: (UIColor*) color;
@end
