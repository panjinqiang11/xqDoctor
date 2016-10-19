//
//  BottomView.h
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^jumpvc)();
@interface BottomView : UIView<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)UITableView *MytableView;
@property (nonatomic, copy) jumpvc jumpVcBlock;
@end
