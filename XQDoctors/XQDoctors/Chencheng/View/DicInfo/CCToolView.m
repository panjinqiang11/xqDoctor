//
//  CCToolView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS
#import "CCToolView.h"
#import "CCNavToolView.h"//功能栏，医生简介 就诊时间
#import <Masonry.h>
#import "CCToolsCollectionViewController.h"
#import "ChangeToolView.h"
@interface CCToolView ()
@property (nonatomic , weak)CCNavToolView *navToolView;
@property (nonatomic,strong)CCToolsCollectionViewController *toolController;
@end
@implementation CCToolView

- (CCToolsCollectionViewController *)toolController
{
    if (!_toolController) {
        _toolController = [[CCToolsCollectionViewController alloc]init:self.bounds.size.width:self.bounds.size.height-40];
        
        __weak typeof (self)weakSelf = self;
        _toolController.block = ^(NSInteger number)
        {
            for (ChangeToolView *tool in weakSelf.navToolView.subviews) {
                
                if (tool.tag == number) {
                    tool.titleBtn.selected = YES;
                    [tool changeBottomViewForColor];
                    continue;
                }
                tool.titleBtn.selected = NO;
                [tool noChangeBottomViewForColor];
            }
        };
        
        [self addSubview:_toolController.collectionView];
    }
    return _toolController;
}

- (CCNavToolView *)navToolView
{
    if (!_navToolView) {
        CCNavToolView *toolView = [CCNavToolView sharedCCToolView];
        [self addSubview:toolView];
        _navToolView.backgroundColor = [UIColor blueColor];
        _navToolView = toolView;
        for (ChangeToolView * tol in _navToolView.subviews) {
            tol.block = ^(NSInteger number){
                
                self.toolController.number = number;
            };
        }
    }
    return _navToolView;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //功能区布局
    [self.navToolView makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.equalTo(40.);
    }];
    self.navToolView.backgroundColor = [UIColor blueColor];
    
    __block CGFloat h = self.frame.size.height - 40.;
    [self.toolController.collectionView makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(h);
    }];
    

    }
@end
