//
//  PhotoCollectionViewFlowLayout.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "CollectionViewWaterLayout.h"

#define DEBUG (0)

@interface CollectionViewWaterLayout ()
@property (strong , nonatomic) NSMutableArray *layoutAttributes;//布局属性列表
@property (strong , nonatomic) NSMutableArray *columnHeights;   //行高列表

@end

@implementation CollectionViewWaterLayout

- (NSMutableArray *)layoutAttributes
{
    if (!_layoutAttributes)
    {
        _layoutAttributes = [[NSMutableArray alloc] init];
    }
    
    return _layoutAttributes;
}

- (NSMutableArray *)columnHeights
{
    if (!_columnHeights)
    {
        _columnHeights = [[NSMutableArray alloc] init];
    }
    
    return _columnHeights;
}

- (void)prepareLayout
{
    [super prepareLayout];
    //准备布局 prepare
    
    //清除以前的高度列表
    [self.columnHeights removeAllObjects];
    //创建高度数组
    NSUInteger numberOfColumns = self.numberOfColumns;
    if (!numberOfColumns && [self.layoutDelegate respondsToSelector:@selector(layout:numberOfColumnsAtIndexPath:)])
    {
        numberOfColumns = [self.layoutDelegate layout:self numberOfColumnsAtIndexPath:nil];
        self.numberOfColumns = numberOfColumns;
    }
    for (NSUInteger count = 0; count < numberOfColumns; count++)    //保存numberOfColumns个高度
    {
        //其实高度，行间距 + item的顶部内边距
        CGFloat originY = self.minimumLineSpacing + self.edgeInsets.top;
        [self.columnHeights addObject:@(originY)];
    }
    
    //清除以前的布局属性
    [self.layoutAttributes removeAllObjects];
    //获取所有的Cell的布局属性: UICollectionViewFlowLayoutAttributes 对象
    //读取行
    NSInteger numberOfRows = [self.collectionView numberOfItemsInSection:0];
    for (NSInteger row = 0; row < numberOfRows; row++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:0];
        UICollectionViewLayoutAttributes *attribute = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.layoutAttributes addObject:attribute];
    }
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //返回 rect 区域的所有布局属性
    return [self.layoutAttributes copy];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //根据indexPath获取当前Cell的LayoutAttributes
    UICollectionViewLayoutAttributes *attribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    //获取列数
    NSUInteger numberOfColumns = self.numberOfColumns;
    if (!numberOfColumns && [self.layoutDelegate respondsToSelector:@selector(layout:numberOfColumnsAtIndexPath:)])
    {
        numberOfColumns = [self.layoutDelegate layout:self numberOfColumnsAtIndexPath:indexPath];
        self.numberOfColumns = numberOfColumns;
    }
    
    //获取宽度
    CGFloat width = self.collectionView.bounds.size.width;
    //item 尺寸
    CGSize itemSize = CGSizeZero;
    if ([self.layoutDelegate respondsToSelector:@selector(layout:sizeForItemAtIndexPath:)])
    {
        itemSize = [self.layoutDelegate layout:self sizeForItemAtIndexPath:indexPath];
    }
    
    itemSize.width = ((width - (numberOfColumns + 1) * self.minimumInteritemSpacing) / numberOfColumns) - self.edgeInsets.left - self.edgeInsets.right;

    
    //获取高度最小的列
    //计算frame.origin
    NSUInteger destCount = 0;
    CGFloat x = self.edgeInsets.left + self.minimumInteritemSpacing, y = [self.columnHeights[0] doubleValue];
    for (NSUInteger i = 1; i < numberOfColumns; i++)
    {
        CGFloat height = [self.columnHeights[i] doubleValue];
        if (y > height)
        {
            y = height;
            destCount = i;
        }
    }
    
    //保存最短的那一列
    //还需要加上当前item高度 edgeInsert 行间距
    self.columnHeights[destCount] = @(y + itemSize.height + self.minimumLineSpacing + self.edgeInsets.top + self.edgeInsets.bottom);
    
    //设置frame
    x = (self.minimumInteritemSpacing + self.edgeInsets.left) * (destCount + 1) + (itemSize.width + self.edgeInsets.right) * destCount;
    attribute.frame = CGRectMake(x, y, itemSize.width, itemSize.height);
    
#if DEBUG
    NSLog(@" item frame: %@", [NSValue valueWithCGRect:attribute.frame]);
#endif
    
    return attribute;
}

- (CGSize)collectionViewContentSize
{
    //设置当前CollectionView的contentSize
    //需要得到最长一列的总高度
    CGFloat maxHeight = [self.columnHeights[0] doubleValue];
    for (NSUInteger i = 1; i < self.numberOfColumns; i++)
    {
        CGFloat height = [self.columnHeights[i] doubleValue];
        if (maxHeight < height)
        {
            maxHeight = height;
        }
    }
    
    return CGSizeMake(self.collectionView.bounds.size.width, maxHeight);
}


@end






