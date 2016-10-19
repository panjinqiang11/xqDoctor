//
//  AlertConView.h
//  XQDoctors
//
//  Created by 陈成 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AlertConView;
 typedef void (^queRenblock)();
@interface AlertConView : UIView
@property (nonatomic , copy) queRenblock block;
@end
