//
//  PersonIconController.h
//  XQDoctors
//
//  Created by kassia on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ImageBlock) (UIImage *image);
@interface PersonIconController : UIViewController
//将图片传给上一控制器
- (void)sendImage:(ImageBlock)imageBlock;

@end
