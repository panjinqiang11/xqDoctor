//
//  BottomView.m
//  XQDoctors
//
//  Created by 潘金强 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "BottomView.h"
#import "AttentionCell.h"
#import "CCDeptMainViewController.h"
@implementation BottomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    
    if(self = [super initWithFrame:frame]) {
        
        [self.MytableView registerNib:[UINib nibWithNibName:@"AttentionCell" bundle:nil] forCellReuseIdentifier:@"attention"];
    }
    return self;
}

-(UITableView *)MytableView{
    
    if(!_MytableView) {
        
   _MytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width,300)];
     
       _MytableView.delegate = self;
        
        _MytableView.dataSource = self;
        
        _MytableView.tableHeaderView = [[NSBundle mainBundle]loadNibNamed:@"Bottom" owner:nil options:nil].lastObject;
        
        [self addSubview:_MytableView];
    }
    return _MytableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"attention" forIndexPath:indexPath];
    
    
    return cell;
        
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    if(self.jumpVcBlock){
    
        self.jumpVcBlock();
    
    }
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
@end
