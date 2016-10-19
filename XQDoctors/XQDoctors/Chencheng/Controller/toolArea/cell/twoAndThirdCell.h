//
//  twoAndThirdCell.h
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import <UIKit/UIKit.h>
#import <Masonry.h>
typedef void (^jiuzhenBtnBlock)();
@interface twoAndThirdCell : UICollectionViewCell
@property (nonatomic ,weak) UIButton *sqBtn;//申请就诊
@property (nonatomic , weak)UIView *lineView;//分割线
@property (nonatomic, copy) jiuzhenBtnBlock block;
@end
