//
//  addRecordController.m
//  XQDoctors
//
//  Created by 任文迪 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "addRecordController.h"
#import <Masonry.h>
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoAssets.h"
#import "myLabelButton.h"

@interface addRecordController ()<UITextViewDelegate>

@property(weak,nonatomic)UILabel *placeholder;
//图片存到字典里面去
@property (nonatomic, strong) NSMutableDictionary *fileDict;

@property (nonatomic,strong)NSMutableArray *imageArr;

@end

@implementation addRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景颜色
    self.view.backgroundColor = [UIColor whiteColor];
    //设置返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(backtoRoot)];
    //手工添加控件
    [self setUpUI];
    
}

-(NSMutableArray *)imageArr{
    
    if (!_imageArr) {
        
        _imageArr = [NSMutableArray array];
        
    }
    return _imageArr;
    
}

//按钮点击返回
-(void)backtoRoot{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)setUpUI{
    //添加姓名标签
    UILabel *nameLabel = [[UILabel alloc]init];
    //设置标签文字
    nameLabel.text = @"用户姓名:";
    //添加到view上
    [self.view addSubview:nameLabel];
    //设置约束
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).mas_equalTo(20);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
    }];
    
    //添加姓名
    UILabel *name = [[UILabel alloc]init];
    
    name.text = @"姓名";
    
    name.textColor = [UIColor grayColor];
    
    [self.view addSubview:name];
    
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(nameLabel.mas_right).mas_equalTo(15);
        
        make.centerY.equalTo(nameLabel.mas_centerY);
        
    }];
    
    //添加疾病类型标签
    UILabel *typeLabel = [[UILabel alloc]init];
    
    typeLabel.text = @"疾病类型:";
    
    [self.view addSubview:typeLabel];
    
    [typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        //居上15
        make.top.equalTo(nameLabel.mas_bottom).mas_equalTo(15);
        
    }];
    //创建疾病类型标签左侧界面的小方框
    UIView *backView = [[UIView alloc]init];
    
    backView.backgroundColor = [UIColor clearColor];
    //用cgcolor
    backView.layer.borderColor = [UIColor blackColor].CGColor;
    
    backView.layer.borderWidth = 1.0;
    
    [self.view addSubview:backView];
    
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        //距左15
        make.left.equalTo(typeLabel.mas_right).mas_equalTo(15);
        //距右10
        make.right.equalTo(self.view.mas_right).mas_equalTo(-10);
        
        make.centerY.equalTo(typeLabel.mas_centerY);
        
        make.height.equalTo(@30);
        
    }];
    
    /**
     *添加病症类型的标签  实际从其他控制器获取
     */
    UILabel *disease = [UILabel new];
    
    disease.text = @"天天吃热干面";
    //添加到父控件上
    [self.view addSubview:disease];
    //设置约束
    [disease mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(name.mas_bottom).mas_equalTo(18);
        
        make.left.equalTo(typeLabel.mas_right).mas_equalTo(16);
        
        make.height.equalTo(@28);
        
    }];
    
    /**
     *添加点击跳转按钮备用
     */
    UIButton *jumpBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.view addSubview:jumpBtn];
    
    [jumpBtn setTitle:@"重新选择" forState:UIControlStateNormal];
    // 47  198  197
    [jumpBtn setTitleColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0] forState:UIControlStateNormal];
    //设置约束在框内
    [jumpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_right).mas_equalTo(-12);
        
        make.top.equalTo(name.mas_bottom).mas_equalTo(15);
    }];
    
    /*
     添加症状描述标签 (选择的)
     */
    UILabel *description = [[UILabel alloc]init];
    
    description.text = @"症状描述:";
    
    [self.view addSubview:description];
    
    [description mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(typeLabel.mas_bottom).mas_equalTo(20);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        
    }];
    //添加第一个选项标签
    
    myLabelButton *choice1 = [[myLabelButton alloc]initwithTitle:@"脱水"];
    
    [self.view addSubview: choice1];
    
    [choice1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(description.mas_right).mas_equalTo(5);
        
        make.height.equalTo(@24);
        
        make.width.equalTo(@60);
        
        make.centerY.equalTo(description.mas_centerY);
        
    }];
    //添加第二个选项标签
    myLabelButton *choice2 = [[myLabelButton alloc]initwithTitle:@"营养不良"];
    
    [self.view addSubview:choice2];
    
    [choice2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(choice1.mas_right).mas_equalTo(10);
        
        make.height.equalTo(choice1.mas_height);
        
        make.width.equalTo(@100);
        
        make.centerY.equalTo(description.mas_centerY);
        
    }];
    //添加第三个标签
    myLabelButton *choice3 = [[myLabelButton alloc]initwithTitle:@"贫血"];
    
    [self.view addSubview:choice3];
    
    [choice3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(choice2.mas_right).mas_equalTo(10);
        
        make.height.equalTo(choice1.mas_height);
        
        make.right.equalTo(self.view.mas_right).mas_equalTo(-10);
        
        make.centerY.equalTo(description.mas_centerY);
        
    }];
    //第四个选择标签
    myLabelButton *choice4 = [[myLabelButton alloc]initwithTitle:@"咽喉疼痛"];
    
    [self.view addSubview:choice4];
    
    [choice4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        
        make.top.equalTo(description.mas_bottom).mas_equalTo(10);
        
        make.height.equalTo(choice1.mas_height);
        
        make.width.equalTo(@120);
        
    }];
    //反馈的textView
    UITextView *feedback = [[UITextView alloc]init];
    
    [self.view addSubview:feedback];
    
    feedback.layer.borderWidth = 1.0;
    //设置代理
    feedback.delegate = self;
    
    [feedback mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(choice4.mas_bottom).mas_equalTo(20);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        
        make.right.equalTo(self.view.mas_right).mas_equalTo(-20);
        
        make.height.mas_equalTo(200);
        
    }];
    
    //placeholder的文字
    UILabel *placeHolder = [[UILabel alloc]init];
    
    placeHolder.text = @"请您选择合适的标签并简要描述症状...";
    
    placeHolder.textColor = [UIColor grayColor];
    
    [self.view addSubview:placeHolder];
    
    self.placeholder = placeHolder;
    
    [placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(choice4.mas_bottom).mas_equalTo(22);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(22);
        
    }];
    
    //病历图片Label
    UILabel *bookLabel = [[UILabel alloc]init];
    
    bookLabel.text = @"上传图片:";
    
    bookLabel.font = [UIFont systemFontOfSize:20];
    
    [self.view addSubview:bookLabel];
    
    [bookLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(feedback.mas_bottom).mas_equalTo(20);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        
    }];
    
    //上传图片的按钮,点击后跳转到相册
    UIButton *btn = [[UIButton alloc]init];
    
    [btn setTitle:@"  上传图片" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [btn setImage:[UIImage imageNamed:@"upload.png"] forState:UIControlStateNormal];
    
    btn.layer.borderWidth = 1.0;
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(bookLabel.mas_right).mas_equalTo(20);
        
        make.centerY.equalTo(bookLabel.mas_centerY);
        
        make.size.mas_equalTo(CGSizeMake(150, 40));
        
    }];
    //给按钮添加点击事件
    
    [btn addTarget:self action:@selector(jumpToPhotoAlbum) forControlEvents:UIControlEventTouchUpInside];
    
    //添加图片选择框
    UIImageView *pic1 = [[UIImageView alloc]init];
    
    [pic1 setBackgroundColor:[UIColor clearColor]];

    
    [self.view addSubview:pic1];
    
    [pic1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(bookLabel.mas_bottom).mas_equalTo(20);
        
        make.left.equalTo(self.view.mas_left).mas_equalTo(20);
        
        make.width.mas_equalTo(100);
        
        make.height.mas_equalTo(80);
        
    }];
    
    UIImageView *pic2 = [[UIImageView alloc]init];
    
    [pic2 setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:pic2];
    
    [pic2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.view.mas_right).mas_equalTo(-20);
        
        make.width.mas_equalTo(100);
        
        make.height.mas_equalTo(80);
        
        make.top.equalTo(bookLabel.mas_bottom).mas_equalTo(20);
    }];
    
    
    
    UIImageView *pic3 = [[UIImageView alloc]init];
    
    [pic3 setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:pic3];
    
    [pic3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.width.mas_equalTo(100);
        
        make.height.mas_equalTo(80);
        
        make.top.equalTo(bookLabel.mas_bottom).mas_equalTo(20);
    }];
    
    //添加确认按钮
    UIButton *comfirm = [[UIButton alloc]init];
    
    [comfirm setTitle:@"确认提交" forState:UIControlStateNormal];
    
    [comfirm setBackgroundColor:[UIColor grayColor]];
    
    comfirm.layer.cornerRadius = 5;
    
    [comfirm setTitleColor:[UIColor colorWithRed:47/255.0 green:198/255.0 blue:197/255.0 alpha:1.0] forState:UIControlStateNormal];
    
    [self.view addSubview:comfirm];
    
    [comfirm mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view.mas_bottom).mas_equalTo(-20);
        
        make.centerX.equalTo(self.view.mas_centerX);
        
        make.width.mas_equalTo(self.view.bounds.size.width - 150);
        
        make.top.equalTo(pic3.mas_bottom).mas_equalTo(20);
        
    }];
    //将按钮绑定点击事件
    [comfirm addTarget:self action:@selector(pushBack) forControlEvents:UIControlEventTouchUpInside];
    //将UIimageView添加到数组
    [self.imageArr addObject:pic1];
    
    [self.imageArr addObject:pic2];
    
    [self.imageArr addObject:pic3];
    
    
}

- (void)pushBack{

    //设置属性为yes
    self.isClicked = YES;
    
    if (self.bacBlock) {
        
        self.bacBlock(self.isClicked,1);

        
    }
    
    //返回上一级控制器
    [self.navigationController popViewControllerAnimated:YES];
    
}


//textView的代理方法
- (void)textViewDidBeginEditing:(UITextView *)textView{
    //设置隐藏placeholder
    self.placeholder.hidden = YES;
    
}
//按钮点击的跳转到相册的事件
- (void)jumpToPhotoAlbum{
    // 创建图片多选控制器
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc]init];
    // 默认显示相册里面的内容SavePhotos
    pickerVc.status = PickerViewShowStatusSavePhotos;
    //选择最大图片数
    pickerVc.maxCount = 3;
    //设置跳转
    [self presentViewController:pickerVc animated:YES completion:nil];
    
    pickerVc.callBack = ^(NSArray *assets){
        
        NSInteger i = 0;
        
        for (ZLPhotoAssets *photoAsset in assets) {
            
            UIImage *image = photoAsset.originImage;
            
            UIImageView *images = self.imageArr[i];
            
            images.image = image;
            
            i++;
        }
    };
    
    
}

//懒加载相片字典
- (NSMutableDictionary *)fileDict{
    if (_fileDict==nil) {
        _fileDict = [NSMutableDictionary dictionary];
    }
    
    return _fileDict;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
