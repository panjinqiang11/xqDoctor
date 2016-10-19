

#import "DJLabelButton.h"

@implementation DJLabelButton

//标签选择按钮
- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //设置边框
        self.layer.borderWidth = 2;
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
        
        //字体大小
        self.titleLabel.font = [UIFont systemFontOfSize:13];
        
        //普通状态字体颜色
        [self setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        
        //选中状态字体颜色
        [self setTitleColor:[UIColor colorWithRed:31.0/255 green:199.0/255 blue:197.0/255 alpha:1.0] forState:UIControlStateSelected];
        //选中状态图片
        [self setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateSelected];
        
        [self addTarget:self action:@selector(changeBtn) forControlEvents:UIControlEventTouchDown];
    }
    return self;
}

- (void)changeBtn
{
    self.selected = !self.selected;
    //设置按钮边框颜色
    if(self.selected){
        self.layer.borderColor = [UIColor colorWithRed:31.0/255 green:199.0/255 blue:197.0/255 alpha:1.0].CGColor;
    }else{
        self.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
   
}

@end
