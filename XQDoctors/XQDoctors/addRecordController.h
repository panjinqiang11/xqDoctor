//
//  addRecordController.h
//  XQDoctors
//
//  Created by 任文迪 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^retBlock)(BOOL isArgu,NSInteger number);

@interface addRecordController : UIViewController

@property (assign,nonatomic)BOOL isClicked;

@property (copy,nonatomic)retBlock bacBlock;

@end
