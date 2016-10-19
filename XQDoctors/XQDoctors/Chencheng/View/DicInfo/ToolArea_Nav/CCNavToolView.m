//
//  CCNavToolView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCNavToolView.h"
#import "ChangeToolView.h"
@interface CCNavToolView()
@end
@implementation CCNavToolView
static CCNavToolView *tool;

+ (instancetype)sharedCCToolView
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[CCNavToolView alloc] init];
        [tool addPageTool];
    });
    return tool;
}
//- (instancetype)init
//{
//    if (self = [super init]) {
//        
//        
//        
//        
//        
//        
//    
//    }
//    return tool;
//}

#pragma mark -- 添加选项卡
- (void)addPageTool
{
    NSArray *arr = @[@"接诊条件",@"医生简介",@"就诊时间"];
    
    for (int i=0; i<3; i++) {
        
        ChangeToolView *tool = [ChangeToolView new];
        tool.titleBtn.tag = i;
        [tool.titleBtn setTitle:arr[i] forState:UIControlStateNormal];
        [self addSubview:tool];
       
    }
    
    
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    NSLog(@"%ld",self.subviews.count);
    CGFloat w = self.frame.size.width/3.0;
    CGFloat h = self.frame.size.height;
    //循环给子控件设置frame
    for (int i=0; i<3; i++) {
        
        ChangeToolView *tools = self.subviews[i];
        tools.tag = i;
        tools.frame = CGRectMake(w*i, 0, w, h);
        if (i==0) {
            tools.titleBtn.selected = YES;
            [tools changeBottomViewForColor];
        }

       
    }
}

@end
