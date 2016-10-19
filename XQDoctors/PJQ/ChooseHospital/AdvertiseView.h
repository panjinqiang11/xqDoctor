//
//  AdvertiseView.h
//  XQDoctors
//
//  Created by li on 16/7/2.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^block) ();
@interface AdvertiseView : UIView
@property (nonatomic, copy) block btn;
@end
