//
//  feedBackController.m
//  XQDoctor
//
//  Created by 任文迪 on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//

#import "feedBackController.h"
#import "Masonry.h"
#import "TPKeyboardAvoidingScrollView.h"


@interface feedBackController ()<UITextViewDelegate>

@property (strong,nonatomic)TPKeyboardAvoidingScrollView *tpScrollView;

@property (weak,nonatomic)UILabel *placeHolder;

@property (weak,nonatomic)UILabel *numberLabel;

@property (weak,nonatomic)UITextView *feedBack;

@end

@implementation feedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backToRoot)];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //将第三方框架的scrollView添加到view上
    [self.view addSubview:self.tpScrollView];
    
    [self setUpUI];
    // Do any additional setup after loading the view.
}

//返回上级菜单
- (void)backToRoot{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

//懒加载scrollView

-(TPKeyboardAvoidingScrollView *)tpScrollView{
    
    if (!_tpScrollView) {
        
        _tpScrollView = [[TPKeyboardAvoidingScrollView alloc]initWithFrame:self.view.frame];
        
    }
    
    return _tpScrollView;
    
}


- (void)setUpUI{
    /**
     有问题要改! 要用UITextView
     */
    UITextView *feedBack = [[UITextView alloc]init];
    
    [self.tpScrollView addSubview:feedBack];
    
    feedBack.textAlignment = NSTextAlignmentJustified;
    
    self.feedBack = feedBack;
    
    [feedBack mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.tpScrollView);
        
        make.centerY.equalTo(self.tpScrollView).offset(-200);
        
        make.size.mas_equalTo(CGSizeMake(300, 200));
        
    }];
    //设置线宽
    feedBack.layer.borderWidth = 1.5;
    /**
     设置代理监听
     */
    feedBack.delegate = self;
    
    /**
     设置placeholder 用一个label来设置, 用代理方法来监听,如果textView改变了就隐藏
     */
    
    UILabel *placeHolder = [[UILabel alloc]init];
    
    placeHolder.text = @"请填写你们遇到的问题:";
    
    placeHolder.textColor = [UIColor grayColor];
    
    [feedBack addSubview:placeHolder];
    
    placeHolder.font = [UIFont systemFontOfSize:15];
    
    placeHolder.frame = CGRectMake(0, 0, 200, 20);
    //赋值给全局变量placeholder
    self.placeHolder = placeHolder;
    /**
     创建右下角的监视label
     */
    UILabel *countLabel = [[UILabel alloc]init];
    //设置显示的文字
    countLabel.text = @"还可以输入       字";
    
    countLabel.textColor = [UIColor grayColor];
    
    [self.view addSubview:countLabel];
    //设置约束 让它在右下角
    [countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(feedBack.mas_right).mas_equalTo(-15);
        
        make.bottom.equalTo(feedBack.mas_bottom).mas_equalTo(-5);
        
        
    }];
    //创建数字label
    UILabel *numberLabel = [[UILabel alloc]init];
    
    numberLabel.text = @"140";
    
    self.numberLabel = numberLabel;
    
    numberLabel.textColor = [UIColor redColor];
    
    [self.view addSubview:numberLabel];
    
    [numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(feedBack.mas_bottom).mas_equalTo(-5);
        
        make.right.equalTo(feedBack.mas_right).mas_equalTo(-35);
        
    }];
    
    
    UILabel *desLabel = [[UILabel alloc]init];
    //设置显示文字
    desLabel.text = @"欢迎联系我们:";
    //添加到父控件
    [self.tpScrollView addSubview:desLabel];
    //设置约束
    [desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(feedBack.mas_left).offset(140);
        
        make.size.mas_equalTo(CGSizeMake(130, 30));
        
        make.topMargin.equalTo(feedBack.mas_bottom).offset(15);
        
    }];
    //创建一个btn
    UIButton *btn = [[UIButton alloc]init];
    //设置btn的背景图片
    [btn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    //添加到父控件
    [self.tpScrollView addSubview:btn];
    //设置打电话按钮的约束
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.leftMargin.equalTo(desLabel.mas_right).offset(2);
        
        make.topMargin.equalTo(feedBack.mas_bottom).offset(15);
        
        make.size.mas_equalTo(CGSizeMake(30,30));
        
        
    }];
    
    [btn addTarget:self action:@selector(callAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    //添加递交请求按钮
    
    UIButton *upLoadbtn = [[UIButton alloc]init];
    
    [upLoadbtn setTitle:@"递交反馈" forState:UIControlStateNormal];
    
    [self.view addSubview:upLoadbtn];
    
    [upLoadbtn setBackgroundColor:[UIColor grayColor]];
    
    [upLoadbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(self.view.frame.size.width - 130, 30));
        
        make.top.equalTo(feedBack.mas_bottom).mas_equalTo(40);
        
        make.centerX.equalTo(feedBack.mas_centerX);
        
    }];
    
    
}
//代理监听的方法
- (void)textViewDidBeginEditing:(UITextView *)textView{
    //设置隐藏placeholder
    self.placeHolder.hidden = YES;
    
    
    
}


-(void)textViewDidChange:(UITextView *)textView{
    
   NSString *number = [NSString stringWithFormat:@"%ld",140 - self.feedBack.text.length];
    
    
    self.numberLabel.text = number;
    
    
}

- (void)callAction{
    NSString *number = @"110";// 此处读入电话号
    
    NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num]]; //拨号
}

@end
