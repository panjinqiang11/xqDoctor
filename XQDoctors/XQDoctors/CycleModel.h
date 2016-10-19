//
//  CycleModel.h
//  XQDoctor
//
//  Created by kassia on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^FinishBlock)(NSArray *result);
@interface CycleModel : NSObject
//tilte
@property (nonatomic,copy) NSString *banner_title;
//图片
@property (nonatomic,copy) NSString *banner_img_url;
//链接
@property (nonatomic,copy) NSString *banner_link;
//id
@property (nonatomic,assign) int banner_id;

//利用block将数据返回回去
+ (void)arrayWithURLString:(NSString *)URLString finishBlock:(FinishBlock)finishBlock;
@end
