//
//  PJFootView.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol dnextDay <NSObject>

-(void)nextDay;
-(void)lastDay;

@end
@interface PJFootView : UIView
@property (nonatomic,weak)id <dnextDay>delegate;
@end
