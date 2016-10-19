
#import "DJLabel.h"

@implementation DJLabel

//自定义label
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //字体大小
        self.font = [UIFont systemFontOfSize:17];
        //字体颜色
        self.textColor = [UIColor grayColor];
        //左对齐
        self.textAlignment = NSTextAlignmentLeft;
        
        return self;
    }
    return self;
}

@end
