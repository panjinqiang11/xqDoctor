//
//  rwdfooterView.h
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^jumpRecord)(UIButton *btn);

@interface rwdfooterView : UIView

@property(copy,nonatomic)jumpRecord jumpToRecord;

+(instancetype)loadNib;

@end
