//
//  headView.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "headView.h"

@implementation headView

+(instancetype)loadNibWithNibName:(NSString *)nibName{
    
   return [[[NSBundle mainBundle]loadNibNamed:nibName owner:nil options:nil] lastObject];
    
    
}

@end
