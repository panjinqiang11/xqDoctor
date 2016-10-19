
#import "DJMainViewController.h"
#import "DJBaseNavigationViewController.h"
#import "SubmitViewController.h"
#import "Masonry.h"
#import "DJLabel.h"
#import "DJButton.h"
#import "ZLPhotoPickerViewController.h"
#import "ZLPhotoAssets.h"
#import "DJScrollView.h"
#import "DJLabelButton.h"
#import "DJAddLabelViewController.h"

#import "WJJFinishSubmitViewController.h"

@interface DJMainViewController ()<UITextViewDelegate,UIScrollViewDelegate>

//全局的scrollVIew
@property (nonatomic,strong) UIScrollView *myScrollView;
//上方的view
@property (nonatomic,strong) UIView *topView;
//个人史view
@property (nonatomic,strong) UIView *historyView;
//图片字典
@property (nonatomic,strong) NSMutableDictionary *imageDict;

@property (nonatomic,strong) UITextView *textView;
//设置图片数组
@property (nonatomic,strong) NSMutableArray *picArr;

@end

@implementation DJMainViewController
//上方view的高度
#define topViewH 180
//个人史view的高度
#define historyViewH 80
//下方view的高度
#define bottomViewH 500

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    //设置导航条
    [self setUpAppearrence];
    
    //创建scrollView
    [self createscrollVIew];
    
    //创建上方view
    [self setTopView];
    
    //创建个人史
    [self setHistory];
    
    //创建下方的view
    [self setBottomView];
}

//懒加载图片数组

-(NSMutableArray *)picArr{
    
    if (!_picArr) {
        
        _picArr = [NSMutableArray array];
        
    }
    
    return _picArr;
    
}



//创建下方的view
- (void)setBottomView
{
    //创建下方的view
    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, topViewH + historyViewH, self.myScrollView.frame.size.width, bottomViewH)];
    
    [self.myScrollView addSubview:bottomView];
    
    //创建label---病历图片
    DJLabel *bingLabel = [[DJLabel alloc]init];
    [bottomView addSubview:bingLabel];
    bingLabel.text = @"病例图片 :";
    //设置约束
    [bingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(bottomView).offset(15);
        make.left.equalTo(bottomView).offset(8);
    }];
    
    //警告图片
    UIImageView *warImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"注意"]];
    [bottomView addSubview:warImage];
    //设置约束
    [warImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(14);
        make.left.equalTo(bottomView).offset(25);
        make.top.equalTo(bingLabel.mas_bottom).offset(8);
    }];
    
    ////创建label---申请提示
    UILabel *warLabel = [[UILabel alloc]init];
    warLabel.text= @"上传静息时心电图、心电图负荷试验、发射性核素心腔造影能够提高您申请成功的几率";
    //设置颜色
    warLabel.textColor = [UIColor colorWithRed:31.0/255 green:199.0/255 blue:197.0/255 alpha:1.0];
    [bottomView addSubview:warLabel];
    //设置行数
    [warLabel setNumberOfLines:0];
    
    //设置大小
    warLabel.font = [UIFont systemFontOfSize:13];
    //设置约束
    [warLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(warImage.mas_right).offset(5);
        make.top.equalTo(bingLabel.mas_bottom).offset(8);
        make.right.equalTo(bottomView).offset(-8);
    }];
    
    //创建选择病历和图片的按钮
    //创建选择病历button
    DJButton *selectButton = [DJButton buttonWithType:UIButtonTypeCustom];
    [selectButton setTitle:@"  选择已有病例" forState:UIControlStateNormal];
    [selectButton setImage:[UIImage imageNamed:@"选择"] forState:UIControlStateNormal];
    [bottomView addSubview:selectButton];
    
    [selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
        make.left.equalTo(bottomView).offset(45);
        make.top.equalTo(warLabel.mas_bottom).offset(15);
    }];
    //添加点击事件
    [selectButton addTarget:self action:@selector(selectBingli) forControlEvents:UIControlEventTouchDown];
    
    //创建选择图片button
    DJButton *imageButton = [DJButton buttonWithType:UIButtonTypeCustom];
    [imageButton setTitle:@"上传照片" forState:UIControlStateNormal];
    [imageButton setImage:[UIImage imageNamed:@"上传照片"] forState:UIControlStateNormal];
    [bottomView addSubview:imageButton];
    
    [imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(120);
        make.height.mas_equalTo(40);
        make.right.equalTo(bottomView).offset(-45);
        make.top.equalTo(warLabel.mas_bottom).offset(15);
    }];
    //添加点击事件
    [imageButton addTarget:self action:@selector(selectImage) forControlEvents:UIControlEventTouchDown];
    
    //显示图片
    for (int i = 0; i < 2; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"photo"]];
        [bottomView addSubview:imageView];
        //添加到图片数组
        [self.picArr addObject:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(selectButton.mas_bottom).offset(2);
            make.width.mas_equalTo(160);
            make.height.mas_equalTo(120);
            if(i == 0){
                make.left.equalTo(bottomView).offset(15);
            }
            else{
                make.right.equalTo(bottomView).offset(-15);
            }
        }];
    }
    
    //创建横线
    UIView *lineView = [[UIView alloc]init];
    [bottomView addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    //设置约束
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(bottomView);
        make.right.equalTo(bottomView);
        make.top.equalTo(selectButton.mas_bottom).offset(120);
    }];
    
    //病症描述
    DJLabel *illnessLabel = [[DJLabel alloc]init];
    illnessLabel.text = @"病症描述 :";
    [bottomView addSubview:illnessLabel];
    //设置约束
    [illnessLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(5);
        make.left.equalTo(bottomView).offset(8);
    }];
    
    //创建标签
    DJLabelButton *labelBtn1 = [[DJLabelButton alloc]init];
    [bottomView addSubview:labelBtn1];
    [labelBtn1 setTitle:@" 营养不良" forState:UIControlStateNormal];
    [labelBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(26);
        make.top.equalTo(lineView.mas_bottom).offset(5);
        make.left.equalTo(illnessLabel.mas_right).offset(20);
    }];
    
    //创建标签
    DJLabelButton *labelBtn2 = [[DJLabelButton alloc]init];
    [bottomView addSubview:labelBtn2];
    [labelBtn2 setTitle:@" 贫血" forState:UIControlStateNormal];
    [labelBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(26);
        make.top.equalTo(lineView.mas_bottom).offset(5);
        make.left.equalTo(labelBtn1.mas_right).offset(10);
    }];
    
    DJLabelButton *labelBtn3 = [[DJLabelButton alloc]init];
    [bottomView addSubview:labelBtn3];
    [labelBtn3 setTitle:@" 脸部灼烧感" forState:UIControlStateNormal];
    [labelBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(26);
        make.top.equalTo(lineView).offset(5);
        make.left.equalTo(labelBtn2.mas_right).offset(10);
    }];
    
    
    DJLabelButton *labelBtn4 = [[DJLabelButton alloc]init];
    [bottomView addSubview:labelBtn4];
    [labelBtn4 setTitle:@" 脱水" forState:UIControlStateNormal];
    [labelBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(26);
        make.top.equalTo(labelBtn1.mas_bottom).offset(8);
        make.left.equalTo(bottomView).offset(105);
    }];
    
    DJLabelButton *labelBtn5 = [[DJLabelButton alloc]init];
    [bottomView addSubview:labelBtn5];
    [labelBtn5 setTitle:@" 咽部疼痛" forState:UIControlStateNormal];
    [labelBtn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(26);
        make.top.equalTo(labelBtn1.mas_bottom).offset(8);
        make.left.equalTo(labelBtn4.mas_right).offset(10);
    }];
    
    //创建textView
    UITextView *textView = [[UITextView alloc]init];
    textView.backgroundColor = [UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:0.5];
    textView.font = [UIFont systemFontOfSize:15];
    textView.textColor = [UIColor grayColor];
    textView.text = @"请您选择合适的标签并简要描述症状...";
    
    self.textView = textView;

    textView.delegate = self;
    
    [bottomView addSubview:textView];
    
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(illnessLabel.mas_bottom).offset(50);
        make.bottom.equalTo(bottomView).offset(8);
        make.left.equalTo(bottomView).offset(8);
        make.right.equalTo(bottomView).offset(-8);
    }];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{

    self.textView.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    self.textView.backgroundColor = [UIColor colorWithRed:225.0/255 green:225.0/255 blue:225.0/255 alpha:0.5];
    
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textView endEditing:YES];
}

//选择照片的点击事件
- (void)selectImage
{
    //创建图片选择器
    ZLPhotoPickerViewController *pickerVc = [[ZLPhotoPickerViewController alloc]init];
    //设置最大选择数
    pickerVc.maxCount = 2;
    //默认显示内容
    pickerVc.status = PickerViewShowStatusSavePhotos;
    
    [self presentViewController:pickerVc animated:YES completion:nil];
    
    pickerVc.callBack = ^(NSArray *arr){
        
        NSInteger i = 0;
        
        for (ZLPhotoAssets *photoAssets in arr) {
            
            UIImage *image = photoAssets.originImage;
            
            UIImageView *images = self.picArr[i];
            
            images.image = image;
            
            i++;
            
        }
        
        
    };
    
    
}

//选择病历的点击事件
- (void)selectBingli
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//创建个人史view
- (void)setHistory
{
    //创建个人史view
    UIView *historyView = [[UIView alloc]initWithFrame:CGRectMake(0, topViewH, self.myScrollView.frame.size.width, historyViewH)];
    
    self.historyView = historyView;

    [self.myScrollView addSubview:historyView];
    
    //创建label---个人史
    DJLabel *LPersonLabel = [[DJLabel alloc]init];
    [historyView addSubview:LPersonLabel];
    LPersonLabel.text = @"个人史 :";
    //设置约束
    [LPersonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(75);
        make.height.mas_equalTo(21);
        make.top.equalTo(historyView).offset(15);
        make.left.equalTo(historyView).offset(15);
    }];
    
    //创建标签
    DJLabelButton *labelBtn1 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn1];
    [labelBtn1 setTitle:@" 无不良嗜好" forState:UIControlStateNormal];
    [labelBtn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(26);
        make.top.equalTo(historyView).offset(15);
        make.left.equalTo(LPersonLabel.mas_right).offset(20);
    }];
    
    //创建标签
    DJLabelButton *labelBtn2 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn2];
    [labelBtn2 setTitle:@" 喝酒" forState:UIControlStateNormal];
    [labelBtn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(26);
        make.top.equalTo(historyView).offset(15);
        make.left.equalTo(labelBtn1.mas_right).offset(10);
    }];
    
    DJLabelButton *labelBtn3 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn3];
    [labelBtn3 setTitle:@" 抽烟" forState:UIControlStateNormal];
    [labelBtn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(26);
        make.top.equalTo(historyView).offset(15);
        make.left.equalTo(labelBtn2.mas_right).offset(10);
    }];
    
    
    DJLabelButton *labelBtn4 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn4];
    [labelBtn4 setTitle:@" 烫头" forState:UIControlStateNormal];
    [labelBtn4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(57);
        make.height.mas_equalTo(26);
        make.top.equalTo(labelBtn1.mas_bottom).offset(8);
        make.left.equalTo(historyView).offset(110);
    }];
    
    DJLabelButton *labelBtn5 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn5];
    [labelBtn5 setTitle:@" 接触毒品" forState:UIControlStateNormal];
    [labelBtn5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(26);
        make.top.equalTo(labelBtn1.mas_bottom).offset(8);
        make.left.equalTo(labelBtn4.mas_right).offset(10);
    }];
    
    DJLabelButton *labelBtn6 = [[DJLabelButton alloc]init];
    [historyView addSubview:labelBtn6];
    [labelBtn6 setTitle:@" 添加其它标签" forState:UIControlStateNormal];
    [labelBtn6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(105);
        make.height.mas_equalTo(26);
        make.top.equalTo(labelBtn1.mas_bottom).offset(8);
        make.left.equalTo(labelBtn5.mas_right).offset(10);
    }];
    //添加点击事件
    [labelBtn6 addTarget:self action:@selector(addMore) forControlEvents:UIControlEventTouchDown];
    
    //创建横线
    [self createLineView:historyView];
}

//添加标签
- (void)addMore
{
    DJAddLabelViewController *addVc = [[DJAddLabelViewController alloc]init];
    
    [self.navigationController pushViewController:addVc animated:NO];
}

//创建上方view
- (void)setTopView
{
    //创建topView
    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.myScrollView.frame.size.width, topViewH)];
    
    self.topView = topView;
    
    [self.myScrollView addSubview:topView];
    
    //创建label---1用户名
    DJLabel *LNameLabel = [[DJLabel alloc]init];
    [topView addSubview:LNameLabel];
    LNameLabel.text = @"用户姓名 :";
    //设置约束
    [LNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(topView).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RNameLabel = [[DJLabel alloc]init];
    [topView addSubview:RNameLabel];
    RNameLabel.text = @"王大锤";
    //设置约束
    [RNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(topView).offset(8);
        make.left.equalTo(LNameLabel.mas_right).offset(20);
    }];
    
    //创建label---2疾病类型
    DJLabel *LKindLabel = [[DJLabel alloc]init];
    [topView addSubview:LKindLabel];
    LKindLabel.text = @"疾病类型 :";
    //设置约束
    [LKindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(LNameLabel.mas_bottom).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RKindLabel = [[DJLabel alloc]init];
    [topView addSubview:RKindLabel];
    RKindLabel.text = @"肿瘤";
    //设置约束
    [RKindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(RNameLabel.mas_bottom).offset(8);
        make.left.equalTo(LNameLabel.mas_right).offset(20);
    }];
    
    //创建label---3就诊日期
    DJLabel *LDAteLabel = [[DJLabel alloc]init];
    [topView addSubview:LDAteLabel];
    LDAteLabel.text = @"就诊日期 :";
    //设置约束
    [LDAteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(LKindLabel.mas_bottom).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RDateLabel = [[DJLabel alloc]init];
    [topView addSubview:RDateLabel];
    RDateLabel.text = @"2015-06-02 上午";
    //设置约束
    [RDateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(RKindLabel.mas_bottom).offset(8);
        make.left.equalTo(LDAteLabel.mas_right).offset(20);
    }];
    
    //创建label---4是否确诊
    DJLabel *LQueLabel = [[DJLabel alloc]init];
    [topView addSubview:LQueLabel];
    LQueLabel.text = @"是否确诊 :";
    //设置约束
    [LQueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(LDAteLabel.mas_bottom).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RQueLabel = [[DJLabel alloc]init];
    [topView addSubview:RQueLabel];
    RQueLabel.text = @"疑似";
    //设置约束
    [RQueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(RDateLabel.mas_bottom).offset(8);
        make.left.equalTo(LQueLabel.mas_right).offset(20);
    }];

    //创建label---5是否就诊
    DJLabel *LJiuLabel = [[DJLabel alloc]init];
    [topView addSubview:LJiuLabel];
    LJiuLabel.text = @"是否就诊 :";
    //设置约束
    [LJiuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(LQueLabel.mas_bottom).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RJiuLabel = [[DJLabel alloc]init];
    [topView addSubview:RJiuLabel];
    RJiuLabel.text = @"已就诊,药物治疗";
    //设置约束
    [RJiuLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(RQueLabel.mas_bottom).offset(8);
        make.left.equalTo(LJiuLabel.mas_right).offset(20);
    }];
    
    //创建label---6并发症
    DJLabel *LBingLabel = [[DJLabel alloc]init];
    [topView addSubview:LBingLabel];
    LBingLabel.text = @"并发症 :";
    //设置约束
    [LBingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(78);
        make.height.mas_equalTo(21);
        make.top.equalTo(LJiuLabel.mas_bottom).offset(8);
        make.left.equalTo(topView).offset(8);
    }];
    
    //创建label
    DJLabel *RBingLabel = [[DJLabel alloc]init];
    [topView addSubview:RBingLabel];
    RBingLabel.text = @"胃癌转移,高血压";
    //设置约束
    [RBingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(21);
        make.top.equalTo(RJiuLabel.mas_bottom).offset(8);
        make.left.equalTo(LBingLabel.mas_right).offset(20);
    }];
    
    //创建横线
    [self createLineView:topView];
}

//创建scrollView
- (void)createscrollVIew
{
    //创建scrollView
    DJScrollView *myScrollView = [[DJScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    myScrollView.delegate = self;
    myScrollView.userInteractionEnabled = YES;
    
    //设置滚动范围
    myScrollView.contentSize = CGSizeMake(self.view.frame.size.width, topViewH + historyViewH + bottomViewH + 100);
    
    //关闭竖直滚动条
    myScrollView.showsVerticalScrollIndicator = NO;
    
    self.myScrollView = myScrollView;
    
    [self.view addSubview:myScrollView];
}

//设置导航条
- (void)setUpAppearrence
{
    //设置title
    self.navigationItem.title = @"递交资料";
    
    //左侧按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"返回小"] style:UIBarButtonItemStylePlain target:self action:@selector(cancle)];
    
    //右侧按钮
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(certain)];
}

//确定并提交
- (void)certain
{
    //创建提交审核界面
    WJJFinishSubmitViewController *Vc = [[WJJFinishSubmitViewController alloc]init];
    
    [self.navigationController pushViewController:Vc animated:YES];
}

//返回
- (void)cancle
{
    [self.navigationController popViewControllerAnimated:YES];
}

//创建横线
- (void)createLineView:(UIView *)currenView
{
    //创建横线
    UIView *lineView = [[UIView alloc]init];
    [currenView addSubview:lineView];
    lineView.backgroundColor = [UIColor lightGrayColor];
    //设置约束
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.equalTo(currenView);
        make.right.equalTo(currenView);
        make.bottom.equalTo(currenView).offset(8);
    }];
}

@end


















