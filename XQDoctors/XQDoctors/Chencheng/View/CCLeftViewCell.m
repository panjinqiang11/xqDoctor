//
//  CCLeftViewCell.m
//  XQDoctor
//
//  Created by 陈成 on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCLeftViewCell.h"
@interface CCLeftViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation CCLeftViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
