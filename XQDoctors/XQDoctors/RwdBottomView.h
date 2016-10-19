//
//  RwdBottomView.h
//  RwdBottomView
//
//  Created by 任文迪 on 16/6/30.
//  Copyright © 2016年 spaceX. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^jumpVc)(NSString *);
@interface RwdBottomView : UIView

@property (copy,nonatomic)jumpVc jumpVcBlock;

@end
