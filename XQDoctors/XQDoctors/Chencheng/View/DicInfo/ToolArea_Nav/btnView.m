//
//  btnView.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "btnView.h"
@interface btnView()

@property(nonatomic,weak)IBOutlet UIButton* shoushuL;
@property(nonatomic,weak)IBOutlet UIButton* xianghuaL;
@property(nonatomic,weak)IBOutlet UIButton* jingqiL;
@end
@implementation btnView

- (void)awakeFromNib
{
    [self.shoushuL setTitle:@"手术量：" forState:UIControlStateNormal];
    
  [self.xianghuaL setTitle:@"鲜花量：" forState:UIControlStateNormal];
    [self.jingqiL setTitle:@"锦旗数：" forState:UIControlStateNormal];
}

- (IBAction)shoushuBtn:(id)sender
{
    NSLog(@"shoushuBtn");
}

- (IBAction)xianghuaL:(id)sender
{
     NSLog(@"xianghuaL");
}
- (IBAction)jiaqiL:(id)sender
{
     NSLog(@"jiaqiL");
}

@end
