//
//  CCToolsCollectionViewController.m
//  XQDoctors
//
//  Created by 陈成 on 16/6/29.
//  Copyright © 2016年 li. All rights reserved.
//

#import "CCToolsCollectionViewController.h"
#import "CCToolCollectionCell.h"
#import "CCTwoCollectionCell.h"
#import "CCThirdCollectionCell.h"
#import "CCNavToolView.h"
#import "ChangeToolView.h"

@interface CCToolsCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CCToolsCollectionViewController

-(instancetype)init:(CGFloat)wis:(CGFloat)h
{
    //设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //设置每个cell的尺寸
    
    layout.itemSize = CGSizeMake(wis, h);
    
    //cell之间的水平间距
    layout.minimumInteritemSpacing = 0 ;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //cell之间的垂直间距
    layout.minimumLineSpacing = 0;
    
    //设置四周边距
    //    layout.sectionInset = UIEdgeInsetsMake(interval, 0, 0, 0);
    
    return [super initWithCollectionViewLayout:layout];
    
}

- (void)setNumber:(NSInteger)number
{
    _number = number;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:number inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionRight animated:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.collectionView registerClass:[CCToolCollectionCell class] forCellWithReuseIdentifier:@"cell"];
    [self.collectionView registerClass:[CCTwoCollectionCell class] forCellWithReuseIdentifier:@"two"];
    [self.collectionView registerClass:[CCThirdCollectionCell class] forCellWithReuseIdentifier:@"third"];
    self.collectionView.pagingEnabled = YES;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:0];
    [self.collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
    
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int a = (int)scrollView.contentOffset.x/scrollView.frame.size.width;
    
    int b =  a%3;
    
    if (self.block) {
        _block(b);
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell;
    NSInteger number =-1;
    switch (indexPath.row) {
        case 0:
             cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
            number=0;
#warning wwwwwww
            break;
        case 1:
            cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"two" forIndexPath:indexPath];
            number=1;
#warning wwwwwww
      
            break;
        case 2:
            cell= [collectionView dequeueReusableCellWithReuseIdentifier:@"third" forIndexPath:indexPath];
            
            break;
            
        default:
            break;
    }
    
    if (number==0||number==1) {
        
        ((twoAndThirdCell *)cell).block = ^(){
            
            [self.collectionView setContentOffset:CGPointMake(self.collectionView.frame.size.width*2, 0) animated:YES];
            
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews.lastObject) changeBottomViewForColor];
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews.lastObject).titleBtn setTitleColor:[UIColor colorWithRed:32/255.0 green:198/255.0 blue:198/255.0 alpha:1.0] forState:UIControlStateSelected];
            ((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews.lastObject).titleBtn.selected = YES;
            
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[0]) noChangeBottomViewForColor];
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[1]) noChangeBottomViewForColor];
            
            //[UIColor colorWithRed:32/255.0 green:198/255.0 blue:198/255.0 alpha:1.0]
#warning 改变按钮1的状态为默认状态
            ((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[0]).titleBtn.selected = NO;
            
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[0]).titleBtn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal];
            [CCNavToolView sharedCCToolView].isOk =YES;
#warning 改变按钮2的状态为默认状态
            ((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[1]).titleBtn.selected = NO;
            [((ChangeToolView *)[CCNavToolView sharedCCToolView].subviews[1]).titleBtn setTitleColor:[UIColor colorWithRed:127/255.0 green:127/255.0 blue:127/255.0 alpha:1.0] forState:UIControlStateNormal];
            
        //};
        };
    }
    
    return cell;
}


@end
