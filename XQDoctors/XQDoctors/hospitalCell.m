//
//  hospitalCell.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "hospitalCell.h"
#import "hospitalModel.h"
#import <Masonry.h>
@interface hospitalCell()

@property(weak,nonatomic)UILabel *titleLabel;

@property(weak,nonatomic)UILabel *desLabel;


@end
@implementation hospitalCell

//- (void)awakeFromNib {
//    
//    [self setUpUI];
//    // Initialization code
//}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(hospitalModel *)model{
    
    _model = model;
    
    self.titleLabel.text = model.title;
    
    self.desLabel.text = model.infos;
    

    
    
}


-(void)setUpUI{
    
    UILabel *titleLabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:titleLabel];
    
    self.titleLabel = titleLabel;
    
   
    
    UILabel *desLabel = [[UILabel alloc]init];
    
    [self.contentView addSubview:desLabel];
    
    self.desLabel = desLabel;
    
    self.desLabel.textColor = [UIColor grayColor];
    
    self.desLabel.font = [UIFont systemFontOfSize:15];
    
    self.desLabel.numberOfLines = 0;
    
}



-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.contentView.mas_top).mas_equalTo(15);
        
        make.left.equalTo(self.contentView.mas_left).mas_equalTo(8);
        
    }];
    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.titleLabel.mas_bottom).mas_equalTo(10);
        
        make.left.equalTo(self.titleLabel.mas_left).mas_equalTo(8);
        
        make.right.equalTo(self.mas_right).mas_equalTo(-16);
        
    }];
    
}


@end
