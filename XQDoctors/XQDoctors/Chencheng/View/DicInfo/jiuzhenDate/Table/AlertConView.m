//
//  AlertConView.m
//  XQDoctors
//
//  Created by 陈成 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import "AlertConView.h"
@interface AlertConView()
@property (weak, nonatomic) IBOutlet UIButton *queRen;

@end
@implementation AlertConView

- (instancetype)init
{
    if (self = [super init]) {
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"AlertConView" owner:self options:nil] firstObject];
        self.queRen.layer.cornerRadius = 10;
        self.queRen.clipsToBounds = YES;
        self.queRen.backgroundColor = [UIColor colorWithRed:32/255.0 green:208/255.0 blue:198/255.0 alpha:1];
        self.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    }
    return self;
}

#pragma mark -- 确认按钮
- (IBAction)queRenBtn:(UIButton *)sender {
    
    if (self.block) {
        _block();
    }
}

@end
