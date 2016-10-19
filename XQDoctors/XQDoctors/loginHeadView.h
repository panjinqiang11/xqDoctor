//
//  loginHeadView.h
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^login)(NSInteger index);
@interface loginHeadView : UIView

@property (nonatomic, copy) login loginBlock;

@end
