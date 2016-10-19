//
//  CCDeptMainViewController.h
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  选择科室主控制器
 */
@interface CCDeptMainViewController : UIViewController
@property (nonatomic, strong)UIImage *image;
@property (nonatomic,assign)BOOL isDoc;//判断是不是从按医生跳入的
@property (nonatomic, assign) BOOL isHospital ;//判断是不是从按医院控制器跳过来的
@end
