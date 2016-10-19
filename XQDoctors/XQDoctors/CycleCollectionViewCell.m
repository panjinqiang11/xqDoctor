//
//  CycleCollectionViewCell.m
//  XQDoctor
//
//  Created by kassia on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CycleCollectionViewCell.h"
#import "UIImageView+WebCache.h"
@interface CycleCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bannerImage;

@end
@implementation CycleCollectionViewCell

- (void)setModel:(CycleModel *)model{
    
    _model = model;
    self.bannerImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"iconImage%d.jpg",3]];
//    NSURL *url = [NSURL URLWithString:model.banner_img_url];
//    
//    [self.bannerImage sd_setImageWithURL:url];

}
@end
