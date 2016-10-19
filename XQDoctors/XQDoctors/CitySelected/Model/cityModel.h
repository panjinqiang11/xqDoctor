//
//  cityModel.h
//  XQDoctors
//
//  Created by kassia on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface cityModel : NSObject
//城市名
@property (nonatomic, copy) NSString *name;


+(instancetype)cityWithDict:(NSDictionary *)dict;
@end
