//
//  UIView+Frame.m
//  传智彩票
//
//  Created by whitcast on 16/5/28.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)


// x

- (CGFloat)x{
    
    return self.frame.origin.x;
}


- (void)setX:(CGFloat)x{
    
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

// y

- (CGFloat)y{
    
    return self.frame.origin.y;
}


- (void)setY:(CGFloat)y{
    
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}


// w

- (CGFloat)w{
    
    return self.frame.size.width;
}


- (void)setW:(CGFloat)w{
    
    CGRect rect = self.frame;
    rect.size.width = w;
    self.frame = rect;
}


// h

- (CGFloat)h{
    
    return self.frame.size.height;
}


- (void)setH:(CGFloat)h{
    
    CGRect rect = self.frame;
    rect.size.height = h;
    self.frame = rect;
}












@end
