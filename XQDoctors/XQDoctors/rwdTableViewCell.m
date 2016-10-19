//
//  rwdTableViewCell.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "rwdTableViewCell.h"
#import "settingModel.h"
#import <Masonry.h>
@interface rwdTableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *settingLabel;

@property (weak, nonatomic) IBOutlet UIImageView *images;

@end
@implementation rwdTableViewCell

-(void)setModel:(settingModel *)model{
    
    _model = model;
    
    _settingLabel.text = model.title;
    
    _images.image = [UIImage imageNamed:model.image];
    
}



- (void)awakeFromNib {
    
    self.settingLabel.textColor = [UIColor grayColor];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.images mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-20);
    }];
}

@end
