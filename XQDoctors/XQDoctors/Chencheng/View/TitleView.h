//
//  TitleView.h
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^docInfoBlock)();
@interface TitleView : UIView
@property (nonatomic, copy) docInfoBlock block;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;//查看医院详情
@end
