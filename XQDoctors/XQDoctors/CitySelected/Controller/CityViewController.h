//
//  CityViewController.h
//  XQDoctors
//
//  Created by kassia on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^TitleBlock) (NSString *title);

@interface CityViewController : UITableViewController

- (void)returnTitleByTitleBlock:(TitleBlock)titleBlock;

@end
