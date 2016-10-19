//
//  XQMingYiTongViewController.h
//  XQDoctor
//
//  Created by 张清 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    肿瘤 = 1,
    血液病,
    心血管系统,
    神经系统,
    骨科病,
} illnessTypeEnum;
@interface XQMingYiTongViewController : UIViewController
@property (nonatomic, copy) NSString *illnessname;
@property (nonatomic, assign) illnessTypeEnum illness;
@end
