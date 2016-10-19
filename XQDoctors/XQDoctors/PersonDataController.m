//
//  PersonDataController.m
//  XQDoctors
//
//  Created by kassia on 16/6/28.
//  Copyright © 2016年 li. All rights reserved.
//

#import "PersonDataController.h"
#import "PersonIconController.h"
#import "XQBaseButton.h"
#import <Masonry.h>
#import "CityViewController.h"
#import "personModel.h"
#import "personDataModel.h"
@interface PersonDataController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong,nonatomic) PersonIconController *iconController;
@property (weak,nonatomic) CityViewController *cityController;//城市控制器
@property (weak,nonatomic) UIButton *liveBtn;//居住按钮
@property (weak, nonatomic) IBOutlet UILabel *liveAdress;
@property (weak, nonatomic) IBOutlet UILabel *personName;//姓名
@property (weak, nonatomic) IBOutlet UILabel *personID;//身份证号
@property (weak, nonatomic) IBOutlet UILabel *personNum;//电话号码
@property (weak, nonatomic) IBOutlet UITextField *personAge;
@property (weak, nonatomic) IBOutlet UITextField *personHeight;
@property (weak, nonatomic) IBOutlet UITextField *personWeight;
@property (strong,nonatomic) NSMutableDictionary *iconDict;//图片字典
@end

@implementation PersonDataController

/**
 *  viewDidLoad只会调用一次,但会调用viewWillAppear因此在这个方法里面调用
 *
 *
 */

+ (instancetype)sharedPersonDataController{

    static dispatch_once_t onceToken;
    static PersonDataController *_person;
    dispatch_once(&onceToken, ^{
        _person = [[PersonDataController alloc]init];
    });

    return _person;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //设置头像
    [self.iconController sendImage:^(UIImage *image) {
        
        //判断image是否为空
        if (image == nil) {
            
            self.iconImage.image = [UIImage imageNamed:@"icon.png"];
            
        }else{
            
            self.iconImage.image = image;
            //裁剪图片
            self.iconImage.layer.cornerRadius = 5;
            self.iconImage.layer.masksToBounds = YES;
        }
    }];
    
    //设置居住地址
    [self.cityController returnTitleByTitleBlock:^(NSString *title) {
        
        [self.liveBtn setTitle:title forState:UIControlStateNormal];
    }];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     //设置导航栏
     [self setNavgationItem];
    
    //创建居住按钮
    [self creatLiveBtn];
    
    //根据返回来的数据初始化界面
    [self setPersonData];
    
    //第二次进入时从沙盒取值
    [self getData];
   
}
- (void)setPersonData{

    /**
     *  通过返回来的数据进行赋值
     */
    personDataModel *model = [personDataModel sharedPersonDataModel];
    
    self.personName.text = model.true_name;
    self.personAge.text = [NSString stringWithFormat:@"%d",model.age];
    self.personNum.text = model.mobile_number;
    self.personHeight.text = [NSString stringWithFormat:@"%f",model.height];
    self.personWeight.text = [NSString stringWithFormat:@"%f",model.weight];
    [self.liveBtn setTitle:model.address forState:UIControlStateNormal];
    self.personID.text = model.card_number;

}
/**
 *  数据存储在沙盒后,,通过沙盒取出
 */
- (void)getData{

    /**
     *  判断沙盒中有没有图片
     */
    NSString *path = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"icon.png"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    UIImage *img = [UIImage imageWithData:data];
    
    if (img) {
        NSLog(@"从沙盒中获取图片....");
        self.iconImage.image = img;
    }
    
    /**
     *  从偏好设置读取数据
     */
    //1.获取到偏好设置的路径
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //2.读取数据
    
    self.personAge.text =  [NSString stringWithFormat:@"%@",[defaults objectForKey:@"age"]];
    self.personHeight.text = [NSString stringWithFormat:@"%@cm",[defaults objectForKey:@"height"]];
    self.personWeight.text= [NSString stringWithFormat:@"%@kg",[defaults objectForKey:@"weight"]];
    [self.liveBtn setTitle:[defaults objectForKey:@"adress"] forState:UIControlStateNormal];

}
/**
 *  设置NavgationItem
 */
- (void)setNavgationItem{
    //设置title
    self.navigationItem.title = @"个人信息修改";
    //设置确认按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(clickBtn)];
    //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backBtn)];
    
    self.view.backgroundColor = [UIColor whiteColor];

}
/**
 *  确认
 */
- (void)clickBtn{
 
    /**
     *  获取用户输入的数据
     */
    NSString *age = self.personAge.text;
    NSString *height = self.personHeight.text;
    NSString *weight = self.personWeight.text;
    NSString *adress = self.liveBtn.titleLabel.text;
    
    /**
     存到模型
     */
    personModel *model = [[personModel alloc]init];
    model.age = [age intValue];
    model.height = [height doubleValue];
    model.weight = [weight doubleValue];
    model.adress = adress;
    
    
    /**
     *  更改数据格式
     */
    self.personHeight.text = [NSString stringWithFormat:@"%.1fcm",model.height];
    self.personWeight.text = [NSString stringWithFormat:@"%.1fkg",model.weight];
    
    //1. 获取系统的偏好设置对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //2. 存储数据
    
    [defaults setInteger:model.age forKey:@"age"];
    [defaults setInteger:model.height forKey:@"height"];
    [defaults setInteger:model.weight forKey:@"weight"];
    [defaults setObject:model.adress forKey:@"adress"];
    
    /**
     *  存储图片到沙盒
     */
    model.iconImage = self.iconImage.image;
    
    NSData *data1 = UIImagePNGRepresentation(model.iconImage);
    [data1 writeToFile:[[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"icon.png"] atomically:YES];
    
    
    //3.立即同步:  强制写入
    [defaults synchronize];
    [self.navigationController popViewControllerAnimated:YES];

}
/**
 *  返回
 */
- (void)backBtn{
    
    [self.navigationController popViewControllerAnimated:YES];

}
/**
 *  修改图片
 */
- (IBAction)modifyPicture:(UIButton *)sender {
    
    self.iconController = [PersonIconController new];
    
    [self.navigationController pushViewController:self.iconController animated:YES];
    
}
/**
 *  创建居住地址
 */
- (void)creatLiveBtn{
    
    XQBaseButton *liveBtn = [[XQBaseButton alloc]init];
    
    
    [self.view addSubview:liveBtn];
    
    [liveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.liveAdress);
        make.leading.equalTo(self.liveAdress.mas_trailing).offset = 3;
        make.trailing.equalTo(@-20);
        make.height.equalTo(@30);
        
    }];
    
    liveBtn.layer.cornerRadius = 5;
    liveBtn.layer.masksToBounds = YES;
    
    [liveBtn setTitle:@"请选择" forState:UIControlStateNormal];
    
    [liveBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [liveBtn addTarget:self action:@selector(liveAction) forControlEvents:UIControlEventTouchDown];
    
    self.liveBtn = liveBtn;
    
}
- (void)liveAction{
    
    CityViewController *cityController = [[CityViewController alloc]init];
    
    [self.navigationController pushViewController:cityController animated:YES];
    
    self.cityController = cityController;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
