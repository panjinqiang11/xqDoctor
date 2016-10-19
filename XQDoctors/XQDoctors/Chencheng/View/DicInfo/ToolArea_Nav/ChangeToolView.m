//
//  ChangeToolView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "ChangeToolView.h"
#import "CCNavToolView.h"
@interface ChangeToolView()

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *rightView;

@end
@implementation ChangeToolView

#pragma mark -- 初始化，给当前view添加手势，改变bottomview的颜色
- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"ChangeToolView" owner:self options:nil] firstObject];
       
        [self.titleBtn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal];
        [self.titleBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:198/255.0 blue:198/255.0 alpha:1.0] forState:UIControlStateSelected];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btnClick)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma mark -- 按钮点击事件
- (IBAction)btnClick:(UIButton *)sender {
    
    
}

- (void)btnClick
{
   
    
    CCNavToolView *supView = (CCNavToolView *)self.superview;
    if (supView.isOk==YES) {
        //NSLog(@"");
        [((ChangeToolView *)supView.subviews.lastObject).titleBtn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal ];
        
    }
    for (ChangeToolView *tol in supView.subviews) {
       
        if (self == tol) {
            tol.titleBtn.selected = !tol.titleBtn.selected;
            [tol changeBottomViewForColor];
            //传值
            if (self.block) {
                _block(self.tag);
            }
            
           

            continue;
        }
        
        
                tol.titleBtn.selected = NO;
        
        [tol noChangeBottomViewForColor];
        
    }
    //supView.isOk = NO;
    
}

#pragma mark -- 下划线变色
- (void)changeBottomViewForColor
{
    self.bottomView.backgroundColor = [UIColor colorWithRed:32/255.0 green:198/255.0 blue:198/255.0 alpha:1.0];
}
#pragma mark -- 取消下划线变色
- (void)noChangeBottomViewForColor
{
    self.bottomView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1.0];
}




@end
