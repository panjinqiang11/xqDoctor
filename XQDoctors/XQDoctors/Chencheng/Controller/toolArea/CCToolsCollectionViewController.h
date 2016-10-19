//
//  CCToolsCollectionViewController.h
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^toolBlock) (NSInteger number);
@interface CCToolsCollectionViewController : UICollectionViewController
-(instancetype)init:(CGFloat)wis:(CGFloat)h;
@property (nonatomic , assign)NSInteger number;
@property (nonatomic , copy) toolBlock block;
@end
