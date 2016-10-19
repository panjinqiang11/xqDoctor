//
//  personModel.h
//  XQDoctors
//
//  Created by kassia on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface personModel : NSObject
/**
 *  个人基本信息
 */
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *personID;
@property (nonatomic,copy) NSString *phoneNum;
@property (nonatomic,assign) int age;
@property (nonatomic,assign) double height;
@property (nonatomic,assign) double weight;
@property (nonatomic,copy) NSString *adress;
@property (nonatomic,assign) int sex;
@property (nonatomic,strong) UIImage *iconImage;

@end
