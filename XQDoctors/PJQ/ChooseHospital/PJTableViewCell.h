//
//  PJTableViewCell.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PJModel;
@protocol appoint <NSObject>

-(void)appoint;

@end
@interface PJTableViewCell : UITableViewCell
@property (nonatomic,strong)PJModel *model;
@property (nonatomic,strong)id<appoint>delegate;
@end
