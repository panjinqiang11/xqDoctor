//
//  CCTwoRightTableViewController.h
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  选择科室右边的tableViewController
 */
#import "CCDeptMainViewController.h"
#import "CCHospitalViewController.h"
@interface CCTwoRightTableViewController : UITableViewController
@property (nonatomic ,assign)BOOL isHospital;//按医院
@property (nonatomic,strong)CCDeptMainViewController *mainCon;
@property (nonatomic ,strong)CCHospitalViewController *hosCon;
@end
