//
//  TopWeakView.h
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <UIKit/UIKit.h>
#import <Masonry.h>
@class TopWeakView;
typedef void (^buttonClick)(NSInteger number,TopWeakView *weakView);
@interface TopWeakView : UIView
@property (nonatomic,copy)buttonClick block;
@property (weak, nonatomic) IBOutlet UIButton *leftBtn;//左箭头
@property (weak, nonatomic) IBOutlet UILabel *weakLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightBtn;//右箭头
- (void)giBlock;
@end
