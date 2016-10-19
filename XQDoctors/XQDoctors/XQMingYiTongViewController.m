//
//  XQMingYiTongViewController.m
//  XQDoctor
//
//  Created by 张清 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "XQMingYiTongViewController.h"
#import "Masonry.h"
#import "XQBaseButton.h"
#import "UIView+Frame.h"
#import "XQSearchTableViewController.h"
#import "illnessModel.h"
#import "DoctorSelectController.h"


@interface XQMingYiTongViewController ()
//用户名字
@property (weak, nonatomic) IBOutlet UILabel *userName;
//用户ID
@property (weak, nonatomic) IBOutlet UILabel *userID;
//疾病名字
@property (weak, nonatomic) IBOutlet UILabel *illnessName;
//疾病类型
@property (weak, nonatomic) IBOutlet UILabel *illnessType;
//匹配到的医生数量
@property (weak, nonatomic) IBOutlet UILabel *doctorNum;
//就诊申请按钮
@property (weak, nonatomic) IBOutlet UIButton *applicateButton;
//确诊按钮
@property (nonatomic, weak) XQBaseButton *queZhenButton;
//确诊弹框
@property (nonatomic, weak) UIView *queZhenView;
//是否接受过治疗按钮
@property (nonatomic, weak) XQBaseButton *zhiLiaoButton;
//治疗弹框
@property (nonatomic, weak) UIView *zhiLiaoView;
//临时按钮
@property (nonatomic, weak) XQBaseButton *temp;
//选择治疗方式按钮
@property (nonatomic, weak) XQBaseButton *fangshiButton;
//疾病细分按钮
@property (nonatomic, weak) XQBaseButton *jiBingXiFenButton;
//并发症按钮
@property (nonatomic, weak) XQBaseButton *zhengzhuangButton;
//治疗方式弹框
@property (nonatomic, weak) UIView *fangshiView;
//请求参数
@property (nonatomic, strong) NSMutableDictionary *param;
@property (nonatomic, weak) XQSearchTableViewController *searchVC;
@end

@implementation XQMingYiTongViewController

-(NSMutableDictionary *)param
{
    if (_param == nil)
    {
        _param = [NSMutableDictionary dictionary];
        [_param setValue:@1 forKey:@"page"];
        [_param setValue:@15 forKey:@"page_size"];
        [_param setValue:@"" forKey:@"keyword"];
        
        switch (self.illness)
        {
            case 肿瘤:
                [_param setValue:@1 forKey:@"ci1_id"];
                break;
            case 血液病:
                [_param setValue:@2 forKey:@"ci1_id"];
                break;
            case 心血管系统:
                [_param setValue:@3 forKey:@"ci1_id"];
                break;
            case 神经系统:
                [_param setValue:@4 forKey:@"ci1_id"];
                break;
            case 骨科病:
                [_param setValue:@5 forKey:@"ci1_id"];
                break;
        }
    }
    return _param;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    //设置navigationbar的title和返回按钮
    [self setNavBar];
    //布局子控件
    [self setSubviews];
    //设置疾病类型名
    _illnessName.text = _illnessname;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __weak typeof(self) weakSelf = self;
    [self.searchVC retureIllnessNameByIllnessBlock:^(NSString *illnessName) {
        if (illnessName != nil)
        {
            [weakSelf.jiBingXiFenButton setTitle:illnessName forState:UIControlStateNormal];
            [weakSelf.jiBingXiFenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    }];
    
    [self.searchVC retureSyndromeNameBySyndromeBlock:^(NSDictionary *stringDict) {
        if (stringDict != nil)
        {
            __block int i = 0;
            NSMutableString *syndromeString1 = [NSMutableString string];
            [stringDict enumerateKeysAndObjectsUsingBlock:^(NSString *key, id  _Nonnull obj, BOOL * _Nonnull stop) {
                [syndromeString1 appendString:[NSString stringWithFormat:@"%@ ",key]];
                i++;
            }];
            NSMutableString *syndromeString2 = [NSMutableString string];
            [syndromeString2 appendString:[NSString stringWithFormat:@"( 共%d条 ) %@",i,syndromeString1.copy]];
            if (![syndromeString2.copy isEqualToString:@"( 共0条 ) "])
            {
                
                [weakSelf.zhengzhuangButton setTitle:syndromeString2.copy forState:UIControlStateNormal];
                [weakSelf.zhengzhuangButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            }
        }
    }];
    
    [self enabled];
}

-(void)enabled
{
    if ([self.jiBingXiFenButton.titleLabel.text isEqualToString:@"请选择疾病细分"]||[self.queZhenButton.titleLabel.text isEqualToString:@"是否确诊"]||[self.zhiLiaoButton.titleLabel.text isEqualToString:@"请选择是否接受过治疗"]||[self.zhengzhuangButton.titleLabel.text isEqualToString:@"请选择并发症状"])
    {
        self.applicateButton.enabled = NO;
        self.doctorNum.text = @"0";
    }
    else
    {
        self.doctorNum.text = @"24";
        self.applicateButton.enabled = YES;
    }
}

/**
 *  //设置navigationbar的title和返回按钮
 */
-(void)setNavBar
{
    self.navigationItem.title = @"疾病详情选择";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick)];
}
/**
 *  返回按钮的点击事件
 */
-(void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  布局界面的Button
 */
-(void)setSubviews
{
    NSArray *arr = @[@"请选择疾病细分",@"是否确诊",@"请选择是否接受过治疗",@"请选择治疗方式",@"请选择并发症状"];
    //for循环创建button
    for (int i = 0; i < arr.count; i ++)
    {
        //创建按钮
        XQBaseButton *baseButton = [[XQBaseButton alloc ] init];
        //设置按钮的tag值
        baseButton.tag = i;
        //设置文字
        [baseButton setTitle:arr[i] forState:UIControlStateNormal];
        //创建右边的竖线
        UIView *verticalLineview = [UIView new];
        //设置竖线的颜色
        verticalLineview.backgroundColor = UICOLOR_WITH_RGBINT(0xcccccc);
        //添加按钮和竖线
        [self.view addSubview:verticalLineview];
        [self.view addSubview:baseButton];
        
        
        //给按钮设约束
        if (i == 0)
        {
            [baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
                
                make.leading.equalTo(self.illnessType.mas_leading);
                make.trailing.mas_equalTo(-16);
                make.top.equalTo(self.illnessType.mas_bottom).offset = 12;
                make.height.mas_equalTo(36);
            }];
        }
        else
        {
            [baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.leading.equalTo(self.temp);
                make.trailing.mas_equalTo(-16);
                
                if (baseButton.tag == 3)
                {
                    make.top.equalTo(self.temp.mas_bottom).offset = 0;
                    make.height.mas_equalTo(0);
                    baseButton.hidden = YES;
                    
                }
                else
                {
                    make.height.mas_equalTo(36);
                    make.top.equalTo(self.temp.mas_bottom).offset = 8;
                }
                
            }];
            
        }
        self.temp = baseButton;
        
        //给竖线设约束
        [verticalLineview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(baseButton);
            make.trailing.equalTo(baseButton).offset = -37;
            make.width.mas_equalTo(1);
            if (baseButton.tag == 3)
            {
                make.height.mas_equalTo(0);
            }
            else
            {
                make.height.mas_equalTo(26);
                
            }
        }];
        //给按钮添加target
        [baseButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        //保存按钮为属性
        if (baseButton.tag == 0)
        {
            self.jiBingXiFenButton = baseButton;
        }
        if (baseButton.tag == 1)
        {
            self.queZhenButton = baseButton;
        }
        if (baseButton.tag == 2)
        {
            self.zhiLiaoButton = baseButton;
        }
        if (baseButton.tag == 3)
        {
            self.fangshiButton = baseButton;
        }
        if (baseButton.tag == 4)
        {
            self.zhengzhuangButton = baseButton;
        }
    }
    //创建确诊按钮的弹出框
    [self queZhenClick];
    //创建是否接受过治疗按钮的弹出框
    [self zhiLiaoClick];
    //创建选择治疗方式的弹出框
    [self fangshiClick];
    
}
///创建确诊按钮的弹出框
-(void)queZhenClick
{   //创建弹出的VIew
    UIView *queZhenView = [UIView new];
    queZhenView.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
    queZhenView.layer.borderWidth = 1;
    //设置背景色
    queZhenView.backgroundColor = [UIColor whiteColor];
    //设置隐藏
    queZhenView.hidden = YES;
    //添加到控制器的VIew上
    [self.view addSubview:queZhenView];
    //设置约束
    [queZhenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.queZhenButton);
        make.top.equalTo(self.queZhenButton.mas_bottom);
        make.width.equalTo(self.queZhenButton);
        make.height.mas_equalTo(72);
    }];
    //设置给属性
    self.queZhenView = queZhenView;
    NSArray *arr = @[@"已确诊",@"没有确诊"];
    for (int i = 0; i < 2; i++)
    {
        //创建两个选项Label
        UILabel *queZhenLabel = [UILabel new];
        //添加到弹出的View上
        [queZhenView addSubview:queZhenLabel];
        //打开用户交互
        queZhenLabel.userInteractionEnabled = YES;
        //设置文字和居中
        queZhenLabel.text = arr[i];
        queZhenLabel.textAlignment = NSTextAlignmentCenter;
        //设置label的边框
        queZhenLabel.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
        queZhenLabel.layer.borderWidth = 1;
        //设置label的约束
        [queZhenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0)
            {
                make.top.equalTo(queZhenView);
            }else{
                make.bottom.equalTo(queZhenView);
            }
            make.leading.equalTo(queZhenView);
            make.trailing.equalTo(queZhenView);
            make.height.equalTo(@36);
        }];
        //创建手势
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(quZHenLabelClick:)];
        //添加手势到label中
        [queZhenLabel addGestureRecognizer:gesture];
    }
}
/**
 *  点击确诊label调用
 *
 *
 */
-(void)quZHenLabelClick:(UITapGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
    [self.queZhenButton setTitle:label.text forState:UIControlStateNormal];
    [self.queZhenButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
}
//创建是否接受过治疗按钮的弹出框
-(void)zhiLiaoClick
{
    //创建弹出的VIew
    UIView *zhiLiaoView = [UIView new];
    zhiLiaoView.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
    zhiLiaoView.layer.borderWidth = 1;
    //设置背景色
    zhiLiaoView.backgroundColor = [UIColor whiteColor];
    //设置隐藏
    zhiLiaoView.hidden = YES;
    //添加到控制器的VIew上
    [self.view addSubview:zhiLiaoView];
    //设置约束
    [zhiLiaoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.zhiLiaoButton);
        make.top.equalTo(self.zhiLiaoButton.mas_bottom);
        make.width.equalTo(self.zhiLiaoButton);
        make.height.mas_equalTo(72);
    }];
    //设置给属性
    self.zhiLiaoView = zhiLiaoView;
    
    NSArray *arr = @[@"接受过治疗",@"没有接受过治疗"];
    //循环创建Label
    for (int i = 0; i < 2; i++)
    {
        //创建两个选项Label
        UILabel *zhiLiaoLabel = [UILabel new];
        //添加到弹出的View上
        [zhiLiaoView addSubview:zhiLiaoLabel];
        //打开用户交互
        zhiLiaoLabel.userInteractionEnabled = YES;
        //设置文字和居中
        zhiLiaoLabel.text = arr[i];
        zhiLiaoLabel.textAlignment = NSTextAlignmentCenter;
        //设置label的边框
        zhiLiaoLabel.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
        zhiLiaoLabel.layer.borderWidth = 1;
        //设置label的约束
        [zhiLiaoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0)
            {
                make.top.equalTo(zhiLiaoView);
                
            }else{
                make.bottom.equalTo(zhiLiaoView);
                
            }
            make.leading.equalTo(zhiLiaoView);
            make.trailing.equalTo(zhiLiaoView);
            make.height.equalTo(@36);
        }];
        //创建手势
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(zhiLiaoLabelClick:)];
        //添加手势到label中
        [zhiLiaoLabel addGestureRecognizer:gesture];
    }
    
}

/**
 *  点击治疗Label调用
 */
-(void)zhiLiaoLabelClick:(UITapGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
    //将用户选择的赋值给按钮的label
    [self.zhiLiaoButton setTitle:label.text forState:UIControlStateNormal];
    [self.zhiLiaoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    if ([label.text isEqualToString:@"接受过治疗"])
    {
        self.fangshiButton.hidden = NO;
        [self.fangshiButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.zhiLiaoButton.mas_leading);
            make.trailing.mas_equalTo(-16);
            make.top.equalTo(self.zhiLiaoButton.mas_bottom).offset = 8;
            make.height.mas_equalTo(36);
        }];
    }
    else if ([label.text isEqualToString:@"没有接受过治疗"])
    {
        self.fangshiButton.hidden = YES;
        [self.fangshiButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.zhiLiaoButton.mas_leading);
            make.trailing.mas_equalTo(-16);
            make.top.equalTo(self.zhiLiaoButton.mas_bottom).offset = 0;
            make.height.mas_equalTo(0);
        }];
    }
    [self enabled];
}
/**
 *  创建选择治疗方式的弹出框
 */
-(void)fangshiClick
{
    //创建弹出的VIew
    UIView *fangshiView = [UIView new];
    fangshiView.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
    fangshiView.layer.borderWidth = 1;
    //设置背景色
    fangshiView.backgroundColor = [UIColor whiteColor];
    //设置隐藏
    fangshiView.hidden = YES;
    //添加到控制器的VIew上
    [self.view addSubview:fangshiView];
    //设置约束
    [fangshiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.fangshiButton);
        make.top.equalTo(self.fangshiButton.mas_bottom);
        make.width.equalTo(self.fangshiButton);
        make.height.mas_equalTo(108);
    }];
    //设置给属性
    self.fangshiView = fangshiView;
    NSArray *arr = @[@"手术治疗",@"保守治疗",@"药物治疗"];
    for (int i = 0; i < 3; i++)
    {
        //创建两个选项Label
        UILabel *fangshiLabel = [UILabel new];
        //添加到弹出的View上
        [fangshiView addSubview:fangshiLabel];
        //打开用户交互
        fangshiLabel.userInteractionEnabled = YES;
        //设置文字和居中
        fangshiLabel.text = arr[i];
        fangshiLabel.textAlignment = NSTextAlignmentCenter;
        //设置label的边框
        fangshiLabel.layer.borderColor = UICOLOR_WITH_RGBINT(0xcccccc).CGColor;
        fangshiLabel.layer.borderWidth = 1;
        //设置label的约束
        [fangshiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            if (i == 0)
            {
                make.top.equalTo(fangshiView);
            }else if (i == 1){
                make.top.equalTo(fangshiView).offset = 36;
            }else{
                make.bottom.equalTo(fangshiView);
                
            }
            make.leading.equalTo(fangshiView);
            make.trailing.equalTo(fangshiView);
            make.height.equalTo(@36);
        }];
        //创建手势
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fangshiLabelClick:)];
        //添加手势到label中
        [fangshiLabel addGestureRecognizer:gesture];
    }
}
/**
 *  点击选择治疗方式Label调用
 */
-(void)fangshiLabelClick:(UITapGestureRecognizer *)gesture
{
    UILabel *label = (UILabel *)gesture.view;
    [self.fangshiButton setTitle:label.text forState:UIControlStateNormal];
    [self.fangshiButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self enabled];
}


//按钮的点击事件
-(void)buttonClick:(XQBaseButton *)sender
{   //判断点击的是哪个按钮,做相应的事情
    if (sender.tag == 0 || sender.tag == 4)
    {
        XQSearchTableViewController *searchVC = [XQSearchTableViewController new];
        self.searchVC = searchVC;
        //判断应该传哪个模型给搜索控制器
        if (sender.tag == 0)
        {
            searchVC.isJiBingXiFen = YES;
            searchVC.param = self.param;
        }
        else
        {
            searchVC.isJiBingXiFen = NO;
        }
        [self.navigationController pushViewController:searchVC animated:YES];
    }
    else if (sender.tag == 1)
    {
        self.queZhenView.hidden = !self.queZhenView.hidden;
        if (self.zhiLiaoView.hidden == NO)
        {
            self.zhiLiaoView.hidden = !self.zhiLiaoView.hidden;
        }
        if (self.fangshiView.hidden == NO)
        {
            self.fangshiView.hidden = !self.fangshiView.hidden;
        }
    }
    else if (sender.tag == 2)
    {
        self.zhiLiaoView.hidden = !self.zhiLiaoView.hidden;
        if (self.fangshiView.hidden == NO)
        {
            self.fangshiView.hidden = !self.fangshiView.hidden;
        }
    }
    else if (sender.tag == 3)
    {
        self.fangshiView.hidden = !self.fangshiView.hidden;
        if (self.queZhenView.hidden == NO)
        {
            self.queZhenView.hidden = !self.queZhenView.hidden;
        }
    }
    
}
//开始点击调用的方法
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.queZhenView.hidden == NO)
    {
        self.queZhenView.hidden = !self.queZhenView.hidden;
    }
    if (self.zhiLiaoView.hidden == NO)
    {
        self.zhiLiaoView.hidden = !self.zhiLiaoView.hidden;
    }
    if (self.fangshiView.hidden == NO)
    {
        self.fangshiView.hidden = !self.fangshiView.hidden;
    }
}
- (IBAction)forDoctor:(UIButton *)sender {
    
    DoctorSelectController *docVc = [DoctorSelectController new];
    
    [self.navigationController pushViewController:docVc animated:YES];
    
}

@end
