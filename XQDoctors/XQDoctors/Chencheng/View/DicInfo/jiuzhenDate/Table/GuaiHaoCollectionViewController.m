//
//  GuaiHaoCollectionViewController.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/30.
//  Copyright © 2016年 li. All rights reserved.
//

#import "GuaiHaoCollectionViewController.h"
#import "BiaoGeCollectionCell.h"
#import "DayDateView.h"
#import "AlertConView.h"
#import "WJJRegisteredInformationVC.h"
#import "CCBaseDocInfoViewController.h"
#import "ChangeToolView.h"
#import "CCNavToolView.h"


@interface GuaiHaoCollectionViewController ()
@property (nonatomic,strong)NSArray *weakArr;
@property (nonatomic,strong)UIView *youHaoView;//有号
@property (nonatomic,strong)AlertConView *alertMessView; // 弹框
@property (nonatomic,strong)UIView *zheView;//遮罩
@end

@implementation GuaiHaoCollectionViewController


#pragma mark -- 弹框
- (AlertConView *)alertMessView
{
    if (!_alertMessView) {
        
        _alertMessView = [[AlertConView alloc] init];
        _alertMessView.frame = CGRectMake(60, 200, 250, 150);
        _alertMessView.layer.cornerRadius  = 20;
        _alertMessView.clipsToBounds = YES;
    }
    return _alertMessView;
}

#pragma mark -- 上一周下一周，点击后传递到这
- (void)setNumber:(NSInteger)number
{
    _number = number;
    if (number==0) {
        [self.collectionView setContentOffset:CGPointZero animated:YES]  ;
    }else
    {
        [self.collectionView setContentOffset:CGPointMake(self.collectionView.frame.size.width+5, 0) animated:YES]  ;
    }
    [self.collectionView reloadData];
}

- (UIView *)youHaoView
{
    if (!_youHaoView) {
        self.youHaoView = [UIView new];
        UIImage *img = [UIImage imageNamed:@"lv_start"];
        UIImageView *imgView = [[UIImageView alloc] initWithImage:img];
        imgView.frame = CGRectMake(10, 5, 25, 25);
        UILabel *label = [UILabel new];
        label.text = @"有号";
        label.font = [UIFont systemFontOfSize:13];
        label.frame = CGRectMake(10, 30, 40, 20);
        label.textColor  = [UIColor grayColor];
        [self.youHaoView addSubview:imgView];
        [self.youHaoView addSubview:label];
    }
    return _youHaoView;
}

- (NSArray *)weakArr
{
    if (!_weakArr) {
        _weakArr = @[@"周一",@"周二",@"周三",@"周四",@"周五",@"周六",@"周日"];
    }
    return _weakArr;
}

-(instancetype)init:(CGFloat)wis:(CGFloat)h
{
    //设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个cell的尺寸
    //NSLog(@"%lf",wis);
    NSLog(@"%lf",h);
    layout.itemSize = CGSizeMake((wis+17.)/7., 50.);
    
    //cell之间的水平间距
    layout.minimumInteritemSpacing = 0 ;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //cell之间的垂直间距
    layout.minimumLineSpacing = 1.25;
    
    //设置四周边距
    //    layout.sectionInset = UIEdgeInsetsMake(interval, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [self.collectionView registerClass:[BiaoGeCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    __weak typeof (self)weakSelf = self;
    self.alertMessView.block = ^(){
        
        //移除遮罩和view
        [weakSelf.alertMessView removeFromSuperview];
        [weakSelf.zheView removeFromSuperview];
        
        

        //发送通知的方式
        NSNotificationCenter *center =[NSNotificationCenter defaultCenter];
        
        [center postNotificationName:@"jumpToWJJinfornation" object:nil userInfo:nil];
        
    };
    
    

    
}

- (void)enmu:(NSNotification *)not
{
    ((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews.lastObject).titleBtn.selected = NO;
    [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews.lastObject).titleBtn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal];
    
     ((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[0]).titleBtn.selected = YES;
    [(ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[0]
     changeBottomViewForColor];
 
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 56;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BiaoGeCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
   
    CGPoint p  = [self pointOfIndxPathTheItem:indexPath.item];
    //遍历cell的子控件
    
    
    if ((int)p.x == 0) {//表头  日期
        DayDateView *dV = [DayDateView new];
        dV.weakLabel.text = self.weakArr[((int)p.y)%7];
        dV.riQiLabel.text = [NSString stringWithFormat:@"05 - %02d",5+(int)p.y];
        [cell.contentView  addSubview:dV];
    }
    else
    {
        for (UIView *view in cell.contentView.subviews)
        {
            [view removeFromSuperview];
        }
    }
    //有号
    if ((int)p.x==2&&(int)p.y==4) {
        [cell.contentView addSubview:self.youHaoView];
        return cell;
    }
    
    return cell;
}

#pragma mark -- 根据item返回一个坐标
- (CGPoint)pointOfIndxPathTheItem:(NSInteger)item
{
    //表头
    if (item<4) {
        return  CGPointMake(item,0);
    }
    //上午
    if (item%4==0) {
        return  CGPointMake(0,item/4);
    }
    //下午
    if ((item-1)%4==0) {
        return  CGPointMake(1,(item-1)/4);
    }
    //晚上
    if ((item-2)%4==0) {
        return  CGPointMake(2,(item-2)/4);
    }
    return  CGPointMake(3,(item-3)/4);
}

- (UIColor *)randomColor
{
    return [UIColor colorWithRed:((float)(arc4random()%256)/255.0) green:((float)(arc4random()%256)/255.0) blue:((float)(arc4random()%256)/255.0) alpha:1.0];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //CGPoint p = [self pointOfIndxPathTheItem:indexPath.item];
    
    BiaoGeCollectionCell *cell = (BiaoGeCollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
   
    if (cell.contentView.subviews.count!=0) {
        if (cell.contentView.subviews[0]==self.youHaoView) { // 弹框
            
            UIView *v = [[UIView alloc] init];
            self.zheView = v;
            v.frame = [UIScreen mainScreen].bounds;
            v.backgroundColor = [UIColor blackColor];
            v.alpha = 0.5;
            //添加遮罩
            [[UIApplication sharedApplication].keyWindow addSubview:v];
            
             [[UIApplication sharedApplication].keyWindow addSubview:self.alertMessView];
            
            
        }
        
    }
    
    

}

#pragma mark -- 划动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //右
    if (scrollView.contentOffset.x == self.collectionView.frame.size.width) {
        
        self.weakView.weakLabel.text = @"第二周";
        [self.weakView.leftBtn setImage:[UIImage imageNamed:@"jiantou_left"] forState:UIControlStateNormal];
        [self.weakView.rightBtn setImage:[UIImage imageNamed:@"gray_you"] forState:UIControlStateNormal];

    }
    else if(scrollView.contentOffset.x==0)//右
    {
        self.weakView.weakLabel.text = @"第一周";
        [self.weakView.leftBtn setImage:[UIImage imageNamed:@"gray_zuo"] forState:UIControlStateNormal];
        [self.weakView.rightBtn setImage:[UIImage imageNamed:@"jiantou_right"] forState:UIControlStateNormal];

    }
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
#warning 个人中心返回后
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(enmu:) name:@"menu" object:nil];
}



@end
