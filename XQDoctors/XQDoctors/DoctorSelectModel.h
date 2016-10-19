//
//  DoctorSelectModel.h
//  XQDoctors
//
//  Created by li on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^modelNet)(NSArray *infosArr);

@interface DoctorSelectModel : NSObject

//"flower": 0,
//"operation_count": 0,
//"banner": 0,
//"doctor_hospital_name": "北京协和医院",
//"doctor_name": "何晔鑫",
//"doctor_portrait": "http://hdkj-web1.chinacloudapp.cn:8080/res/2093000003151445677716555.jpg",
//"doctor_id": 300000315,
//"doctor_title_name": "心理医生",
//"doctor_gender": 1,
//"accuracy": "98%",
//"easymob_id": "d300000315"

//送花数
@property (nonatomic, assign) NSInteger *flower;
//手术数
@property (nonatomic, assign) NSInteger *operation_count;
//旗帜数
@property (nonatomic, assign) NSInteger *banner;
//医院名字
@property (nonatomic, copy) NSString *doctor_hospital_name;
//医生名字
@property (nonatomic, copy) NSString *doctor_name;
//图像地址
@property (nonatomic, copy) NSString *doctor_portrait;
//医生id
@property (nonatomic, copy) NSString *doctor_id;
//医生职称
@property (nonatomic, copy) NSString *doctor_title_name;
//医生性别
@property (nonatomic, copy) NSString *doctor_gender;
//匹配度
@property (nonatomic, copy) NSString *accuracy;
//环信id
@property (nonatomic, copy) NSString *easymob_id;

+ (void)modelWithUrl:(NSString *)str andParam:(NSDictionary *) param andfinishBlock:(modelNet)modelBlock;

@end
