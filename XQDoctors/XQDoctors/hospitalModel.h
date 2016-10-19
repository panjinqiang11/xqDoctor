//
//  hospitalModel.h
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface hospitalModel : NSObject

@property(copy,nonatomic)NSString *infos;

@property(copy,nonatomic)NSString *title;

+(NSArray *)hospitals;

@end
