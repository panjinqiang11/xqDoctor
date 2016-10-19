//
//  XQSearchTableViewController.h
//  XQDoctor
//
//  Created by 张清 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IllnessBlock)(NSString *illnessName);
typedef void(^SyndromeBlock)(NSDictionary *stringDict);
@interface XQSearchTableViewController : UITableViewController

@property (nonatomic, assign) BOOL isJiBingXiFen;
@property (nonatomic, weak) NSDictionary *param;

-(void)retureIllnessNameByIllnessBlock:(IllnessBlock)illnessBlock;
-(void)retureSyndromeNameBySyndromeBlock:(SyndromeBlock)syndromeBlock;
@end
