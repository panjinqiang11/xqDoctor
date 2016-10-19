//
//  CALayer+XQExtension.m
//  XQDoctor
//
//  Created by 张清 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CALayer+XQExtension.h"

@implementation CALayer (XQExtension)

- (void)setLayerBorderColor:(UIColor *)color {
    self.borderColor = color.CGColor;
}
@end
