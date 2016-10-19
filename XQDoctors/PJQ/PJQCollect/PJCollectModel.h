//
//  PJCollectModel.h
//  XQDoctors
//
//  Created by 潘金强 on 16/7/1.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^finishBlock)(id result);
@interface PJCollectModel : NSObject
@property(nonatomic,copy)NSString *doctor_name;
@property(nonatomic,copy)NSString *doctor_hospital_name;
@property(nonatomic,assign)NSInteger flower;
@property(nonatomic,assign)NSInteger banner;
@property(nonatomic,assign)NSInteger operation_count;
@property(nonatomic,copy)NSString *doctor_portrait;
+(instancetype)initWith:(NSDictionary *)dic;

+(void)objectWtihUrl:(NSString *)urlStr dic:(NSDictionary *)dic finishBlock:(finishBlock)finishBlock;

@end
