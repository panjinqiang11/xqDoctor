//
//  personDataModel.h
//  XQDoctors
//
//  Created by kassia on 16/7/2.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^PersonBlock)(NSArray *result);
@interface personDataModel : NSObject

@property (nonatomic,assign) int age;
@property (nonatomic,copy) NSString *true_name;
@property (nonatomic,assign) double weight;
@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSString *mobile_number;
@property (nonatomic,copy) NSString *card_number;
@property (nonatomic,assign) double height;
@property (nonatomic,assign) int gender;
@property (nonatomic,copy) NSString *head_photo;

@property (nonatomic,strong) personDataModel *model;

+ (instancetype)personWithDict:(NSDictionary *)dict;

+ (void)returnWithURLString:(NSString *)URLString finishBlock:(PersonBlock)personBlock;

+ (instancetype)sharedPersonDataModel;
@end
