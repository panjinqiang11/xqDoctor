//
//  XQBaseButton.h
//  XQDoctor
//
//  Created by 张清 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
#define UICOLOR_WITH_RGBINT(rgbInt) UICOLOR_WITH_RGBINT_A(rgbInt,1)
#define UICOLOR_WITH_RGBINT_A(rgbInt,a) [UIColor colorWithRed:((float)((rgbInt & 0xFF0000) >> 16))/255.0 green:((float)((rgbInt & 0xFF00) >> 8))/255.0 blue:((float)(rgbInt & 0xFF))/255.0 alpha:a]

@interface XQBaseButton : UIButton

@end
