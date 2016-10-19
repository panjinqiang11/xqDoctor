//
//  headView.h
//  testTableHeadView
//
//  Created by 任文迪 on 16/6/30.
//  Copyright © 2016年 spaceX. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^jumpBlock)(UIButton *btn);
@interface TestheadView : UIView

@property(copy,nonatomic)jumpBlock jump;

@end
