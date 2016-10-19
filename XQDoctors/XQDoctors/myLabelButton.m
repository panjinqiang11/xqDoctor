


//
//  myLabelButton.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "myLabelButton.h"

@implementation myLabelButton

-(instancetype)initwithTitle:(NSString *)title{
    
    if ([self initWithFrame:CGRectZero]) {
        
        [self setTitle:title forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"duigou"] forState:UIControlStateSelected];
        
        [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        
        [self setTitleColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0]  forState:UIControlStateSelected];
        
        self.layer.borderWidth = 1.0;
        
//        [self setTintAdjustmentMode:UIViewTintAdjustmentModeAutomatic];
        
        
                [self setFont:[UIFont systemFontOfSize:15]];
        //        self.layer.borderColor = [UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0].CGColor;
        
        
        
        
        [self addTarget:self action:@selector(didClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
    
}


-(void)didClick{
    
    self.selected = !self.selected;
    
    if (self.isSelected) {
        
        self.layer.borderColor = [UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0].CGColor;
        

        
    }else{
        
        
        self.layer.borderColor = [UIColor grayColor].CGColor;

        
    }
    
    
}


@end
