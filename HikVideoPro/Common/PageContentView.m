//
//  PageContentView.m
//  GVGTaobaobao
//
//  Created by edianzu on 2018/6/6.
//  Copyright © 2018年 600. All rights reserved.
//


#import "PageContentView.h"

@interface PageContentView()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSArray *childVcs;
    __weak UIViewController *parentViewCtrl;
    UICollectionView *collectionView;
    BOOL isStopScroll;
    CGFloat startOffset;
}
@end


@implementation PageContentView

- (instancetype)initWithFrame:(CGRect)frame childs:(NSArray *)childs parentVC:(UIViewController *)vc
{
    self = [super initWithFrame:frame];
    if (self) {
        childVcs = [[NSArray alloc]initWithArray:childs];
        parentViewCtrl = vc;
        [self setUp];
    }
    return self;
}

- (void)setUp {
    
    for (UIViewController *VC in childVcs) {
        [parentViewCtrl addChildViewController:VC];
    }
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    collectionView = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:layout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.showsHorizontalScrollIndicator = NO;
    collectionView.bounces = NO;
    collectionView.pagingEnabled = YES;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"myCell"];
    
    [self addSubview:collectionView];
    
}

#pragma mark 定义每个UICollectionViewCell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.width,self.height);
    
}
#pragma mark 定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
    
}

#pragma mark 定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;    
}

#pragma mark 定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return childVcs.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIViewController *vc = childVcs[indexPath.row];
    vc.view.frame = cell.contentView.frame;
    [cell.contentView addSubview:vc.view];
    
    return cell;
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    startOffset =scrollView.contentOffset.x;
    isStopScroll = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    if (isStopScroll) {
        return;
    }
    
    CGFloat progress = 0;
    NSInteger sourceIndex = 0;
    NSInteger targetIndex = 0;
    
    //当前偏移量
    CGFloat currentOffsetX = scrollView.contentOffset.x;
    
    //左滑
    if (currentOffsetX > startOffset) {
        
        progress = currentOffsetX / scrollView.width - floor(currentOffsetX / scrollView.width);
        //计算当前的index
        sourceIndex = floor(currentOffsetX/scrollView.width);
        //计算移动后的index
        targetIndex = sourceIndex + 1;
        
        //当滑动到最右边，targetIndex等于子控制器数量-1
        if (targetIndex >= childVcs.count) {
            
            targetIndex = childVcs.count-1;
        }
        
        //当滑动完毕后，将progress置1
        if (currentOffsetX - startOffset == scrollView.width) {
            progress = 1;
            targetIndex = sourceIndex;
        }
    }else {
        
        progress = 1 - (currentOffsetX / scrollView.width - floor(currentOffsetX / scrollView.width));
        
        targetIndex = floor(currentOffsetX/scrollView.width);
        sourceIndex = targetIndex + 1;
        if (sourceIndex > childVcs.count) {
            sourceIndex = childVcs.count - 1;
        }
    }
    //代理
    if ([self.delegate respondsToSelector:@selector(pageContent:sourceIndex:targetIndex:)]) {
        [self.delegate pageContent:progress sourceIndex:sourceIndex targetIndex:targetIndex];
    }
}

- (void)setPageContent:(NSInteger )index {
    
    [UIView animateWithDuration:0.15 animations:^{
        self->collectionView.contentOffset = CGPointMake(index * self->collectionView.width, 0);
    }];
    
}

@end
