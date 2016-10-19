//
//  PJModel.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PJModel : NSObject
@property (nonatomic,copy)NSString *price;
@property(nonatomic,copy)NSString *resource;
@property(nonatomic,copy)NSString *buttonLabel;
+(NSMutableArray *)InfoArr;
@end
