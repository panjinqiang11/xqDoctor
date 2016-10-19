//
//  PJHeadView.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol calendar <NSObject>

-(void)clikCalendar;

@end
@interface PJHeadView : UIView
@property (nonatomic,weak)id <calendar>delegate;
@end
