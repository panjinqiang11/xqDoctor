//
//  CycleCollectionViewController.m
//  XQDoctor
//
//  Created by kassia on 16/6/27.
//  Copyright © 2016年 li. All rights reserved.
//
#define MinNum 3
#import "CycleCollectionViewController.h"
#import "CycleModel.h"
#import "CycleCollectionViewCell.h"
#import "Masonry.h"
#import "TAPageControl.h"

#import "YLInfiniteScrollView.h"

@interface CycleCollectionViewController ()
//流水布局
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowlayout;

//设置数组
@property (strong,nonatomic) NSArray *cycleInfo;

@property (weak,nonatomic) TAPageControl *pageController;

//定时器
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation CycleCollectionViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    // 顶部轮播图
    YLInfiniteScrollView *scrollView = [[YLInfiniteScrollView alloc] init];
    CGFloat scrollViewH = 183;
    CGFloat scrollViewW = [UIScreen mainScreen].bounds.size.width;
    scrollView.frame = CGRectMake(0, 0, scrollViewW, scrollViewH);
    scrollView.images = @[
                          [UIImage imageNamed:@"轮播图1"],
                          [UIImage imageNamed:@"轮播图2"],
                          [UIImage imageNamed:@"轮播图3"]
                          ];
    [self.view addSubview:scrollView];
    
//    //加载数据
//    [self loadData];
//    //设置items的大小
//    [self setLayout];
//    //设置pageController
//    [self setUpPageController];
//    
//    //去掉滚动条
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    
//    //准备Timer
//    [self prepareTimer];
    
}
/**
 设置定时器
 */
- (void)prepareTimer{
    
    self.timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(next) userInfo:nil repeats:YES];
    
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)next{
    
    NSIndexPath *index = self.collectionView.indexPathsForVisibleItems.firstObject;
    
    //当index不为空时才执行轮播;
    if (index){
    
        if (index.item == self.cycleInfo.count - 1)
        {

            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:index.section] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];

            self.pageController.currentPage = 0;
            
        }
        else
        {
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:index.item+1 inSection:index.section] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
            self.pageController.currentPage = index.item +1;
        }
    
    }
    
    
}

//停止定时器
- (void)stopTimer{
    
    [self.timer invalidate];
    
    self.timer = nil;
    
}
//开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self stopTimer];
    
}

//结束拖拽
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    [self prepareTimer];
    
}
//加载数组
- (void)loadData{
    
    //防止循环引用
    __weak typeof (self) weakSelf = self;
//    http://iosapi.itcast.cn/doctor/banners.json.php
    [CycleModel arrayWithURLString:@"http://iosapi.itcast.cn/doctor/banners.json.php" finishBlock:^(NSArray *result) {
        //给数组赋值
        weakSelf.cycleInfo = result;
        //刷新界面
        [weakSelf.collectionView reloadData];
        
        //设置滚到中间组
        NSIndexPath *index = [NSIndexPath indexPathForItem:0 inSection:MinNum/2];
        [weakSelf.collectionView scrollToItemAtIndexPath:index atScrollPosition:UIScrollViewDecelerationRateNormal animated:NO];
        //给pageController赋值
        self.pageController.numberOfPages = result.count;
       
    }];

}

//设置items的大小
- (void)setLayout{

    self.flowlayout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 183);
}

//设置小圆点
- (void)setUpPageController{
    
    //创建pageController
    TAPageControl *pageController = [[TAPageControl alloc]init];
    
    pageController.dotSize = CGSizeMake(4, 4);

    //添加到父控制器
    [self.collectionView addSubview:pageController];

    //设置自动布局
    [pageController mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@100);
        make.height.equalTo(@30);
        make.trailing.equalTo(self.view.mas_trailing);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
    
    self.pageController = pageController;


}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return MinNum;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

  return self.cycleInfo.count;
  
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
   CycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"colletionCell" forIndexPath:indexPath];
    //给模型赋值
    CycleModel *model = self.cycleInfo[indexPath.item];
    
    //给cell的模型赋值
    cell.model = model;
    
    return cell;
}
//轮播
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //1.算出来的
    int currentPage = (int)scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    //2.我需要的
    int needPage = currentPage % 3;
    
    //3.让它滚动到中间那组对应的位置上面去
    NSIndexPath *centerIndexPath = [NSIndexPath indexPathForItem:needPage inSection:MinNum/2];
    
    [self.collectionView scrollToItemAtIndexPath:centerIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    //4.设置对应的页码
    self.pageController.currentPage = needPage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
