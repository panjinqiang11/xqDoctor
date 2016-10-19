//
//  ApplicationModel.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationModel : NSObject
@property(nonatomic,copy)NSString *application;
+(NSArray *)info;
@end
