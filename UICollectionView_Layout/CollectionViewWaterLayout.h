//
//  CollectionViewWaterLayout.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/21.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//
//  参考资料：
//  http://www.jianshu.com/p/45ff718090a8
//  http://www.jianshu.com/p/9414a0d98514
//  https://objccn.io/issue-3-3/
//  https://onevcat.com/2012/06/introducing-collection-views/
//


#import <UIKit/UIKit.h>


@class CollectionViewWaterLayout;

@protocol CollectionViewWaterLayoutDelegate <NSObject>

@required

/**
 设置Cell的大小

 @param collectionViewLayout 布局对象
 @param indexPath 索引
 @return CGSize
 */
- (CGSize)layout:(CollectionViewWaterLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 设置列数

 @param layout 布局对象
 @param indexPath 索引
 @return 返回 Integer
 */
- (NSUInteger)layout:(CollectionViewWaterLayout *)layout numberOfColumnsAtIndexPath:(NSIndexPath *)indexPath;


@end

@interface CollectionViewWaterLayout : UICollectionViewLayout
@property (assign , nonatomic) CGFloat minimumLineSpacing;      //行间距
@property (assign , nonatomic) CGFloat minimumInteritemSpacing; //列间距
@property (assign , nonatomic) CGSize itemSize; //item的尺寸
@property (assign , nonatomic) UICollectionViewScrollDirection scrollDirection; //滚动方向
@property (assign , nonatomic) UIEdgeInsets edgeInsets;     //item的内边距
@property (assign , nonatomic) NSUInteger numberOfColumns;  //多少列

@property (weak , nonatomic) id<CollectionViewWaterLayoutDelegate> layoutDelegate;    //布局代理




@end





