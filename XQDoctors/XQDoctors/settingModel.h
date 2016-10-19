//
//  settingModel.h
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface settingModel : NSObject

@property(copy,nonatomic)NSString *title;

@property(copy,nonatomic)NSString *image;

@property(copy,nonatomic)NSString *targetVc;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)settingWithDict:(NSDictionary *)dict;

+(NSArray *)settingModelsWithPlistName:(NSString *)plistName;

@end
