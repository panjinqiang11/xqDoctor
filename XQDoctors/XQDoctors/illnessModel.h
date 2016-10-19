//
//  illnessModel.h
//  XQDoctors
//
//  Created by 张清 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//
#import <Foundation/Foundation.h>
typedef void(^CompleteBlock)(NSArray *dataArr);
@interface illnessModel : NSObject
@property (nonatomic, copy) NSString *ci3_name;
+(void)dataArrwithWithURLString:(NSString *)URLString paramDict:(NSDictionary *)param completeBlock:(CompleteBlock)completeBlock;
@end
