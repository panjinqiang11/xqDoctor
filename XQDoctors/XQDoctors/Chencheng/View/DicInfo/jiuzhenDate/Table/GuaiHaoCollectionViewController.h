//
//  GuaiHaoCollectionViewController.h
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopWeakView.h"
@interface GuaiHaoCollectionViewController : UICollectionViewController
-(instancetype)init:(CGFloat)wis:(CGFloat)h;
@property (nonatomic , assign) NSInteger number;//button点击事件控制
@property (nonatomic ,strong)TopWeakView *weakView; // 上一周
@end
