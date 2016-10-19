
#import "DJButton.h"

@implementation DJButton

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //设置边框
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor colorWithRed:31.0/255 green:199.0/255 blue:197.0/255 alpha:1.0].CGColor;
        //字体颜色
        [self setTitleColor:[UIColor colorWithRed:31.0/255 green:199.0/255 blue:197.0/255 alpha:1.0] forState:UIControlStateNormal];
        //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

@end
