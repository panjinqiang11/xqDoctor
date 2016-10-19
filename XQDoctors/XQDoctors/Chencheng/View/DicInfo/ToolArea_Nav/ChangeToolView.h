//
//  ChangeToolView.h
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChangeToolView;
typedef void(^ChangeToolViewBlock) (NSInteger number);
@interface ChangeToolView : UIView

@property (weak, nonatomic) IBOutlet UIButton *titleBtn;
@property (nonatomic , copy) ChangeToolViewBlock block;
- (void)changeBottomViewForColor;
- (void)noChangeBottomViewForColor;
@end
