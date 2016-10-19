


//
//  MytestCell.m
//  RwdTestTableViewCell
//
//  Created by 任文迪 on 16/6/30.
//  Copyright © 2016年 spaceX. All rights reserved.
//

#import "MytestCell.h"
#import "Masonry.h"
@interface MytestCell()
//左侧线
@property(weak,nonatomic)UIView *leftLine;
//日期
@property(weak,nonatomic)UILabel *dateLabel;
//横线
@property(weak,nonatomic)UIView *horizenView;
//中间的大背景
@property(weak,nonatomic)UIView *bigView;
//中间的图片view
@property(weak,nonatomic)UIImageView *iconView;
//中间的标题
@property(weak,nonatomic)UILabel *titleLabel;
//中间的内容
@property(weak,nonatomic)UILabel *contentLabel;
@end
@implementation MytestCell

- (void)awakeFromNib {
    
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        //添加左侧竖线
        UIView *leftLine = [[UIView alloc]init];
        
        [self addSubview:leftLine];
        
        leftLine.backgroundColor = [UIColor lightGrayColor];
        
        self.leftLine = leftLine;
        //添加左上方日期标签  可以从模型中获取
        UILabel *dateLabel = [[UILabel alloc]init];
        
        [self addSubview:dateLabel];
        
        dateLabel.text = @"2016-06-30  15:00";
        
        dateLabel.font = [UIFont systemFontOfSize:15];
        
        dateLabel.textColor = [UIColor grayColor];
        
        self.dateLabel = dateLabel;
        //添加横着的线
        UIView *horizenView = [[UIView alloc]init];
        
        [self addSubview:horizenView];
        
        self.horizenView = horizenView;
        
        horizenView.backgroundColor = [UIColor lightGrayColor];
        
        //中间大View
        UIView *bigView = [[UIView alloc]init];
        
        [self addSubview:bigView];
        
        bigView.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        bigView.layer.borderWidth = 1.0;
        
        bigView.backgroundColor = [UIColor whiteColor];
        
        self.bigView = bigView;
        //中间的图片
        UIImageView *iconView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo"]];
        
        [self addSubview:iconView];
        
        self.iconView = iconView;
        
        //中间的标题
        UILabel *titleLabel = [[UILabel alloc]init];
        
        titleLabel.text = @"患者基本病例";
        
        titleLabel.textColor = [UIColor blackColor];
        
        titleLabel.font = [UIFont systemFontOfSize:18];
        
        self.titleLabel = titleLabel;
        
        [self addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc]init];
        
        contentLabel.text = @"异步函数：NSOperationQueue都是异步函数。加入到NSOperationQueue中的任务，内部会调用start方法，让任务在当前线程中同步串行执行，并且调用内部的main方法";
        
        contentLabel.textColor = [UIColor grayColor];
        
        [self addSubview:contentLabel];
        
        contentLabel.numberOfLines = 3;
        
        contentLabel.font = [UIFont systemFontOfSize:12];
        
        
        self.contentLabel = contentLabel;
        
    }
    
    
    return self;
    
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.mas_left).mas_equalTo(10);
        
        make.width.mas_equalTo(0.5);
        
        make.height.equalTo(self.mas_height);
        
    }];
    
    [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftLine.mas_right).mas_equalTo(10);
        
        make.top.equalTo(self.mas_top).mas_equalTo(10);
        
        
    }];
    
    [self.horizenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftLine.mas_right).mas_equalTo(0);
        
        make.width.equalTo(self.dateLabel.mas_width).mas_equalTo(10);
        
        make.height.mas_equalTo(0.5);
        
        make.top.equalTo(self.dateLabel.mas_bottom).mas_equalTo(10);
        
    }];
    
    [self.bigView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftLine.mas_right).mas_equalTo(10);
        
        make.top.equalTo(self.horizenView.mas_top).mas_equalTo(10);
        
        make.right.equalTo(self.mas_right).mas_equalTo(-12);
        
        make.height.mas_equalTo(80);
        
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.bigView.mas_left).mas_equalTo(9);
        
        make.top.equalTo(self.bigView.mas_top).mas_equalTo(9);
        
        make.bottom.equalTo(self.bigView.mas_bottom).mas_equalTo(-9);
        
        make.width.mas_equalTo(70);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconView.mas_right).mas_equalTo(10);
        
        make.top.equalTo(self.bigView.mas_top).mas_equalTo(9);
        
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.iconView.mas_right).mas_equalTo(10);
        
        make.right.equalTo(self.mas_right).mas_equalTo(-15);
        
        make.top.equalTo(self.titleLabel.mas_bottom).mas_equalTo(3);
        
    }];
    
    
    
}


@end
