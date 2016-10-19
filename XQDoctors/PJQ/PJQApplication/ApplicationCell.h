//
//  ApplicationCell.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ApplicationModel.h"
@interface ApplicationCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *check;
@property (nonatomic,strong)ApplicationModel *model;
@end
