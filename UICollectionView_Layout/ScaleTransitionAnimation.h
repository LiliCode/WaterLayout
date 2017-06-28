//
//  ScaleTransitionAnimation.h
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/28.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "TransitionAnimation.h"

@interface ScaleTransitionAnimation : TransitionAnimation

/**
 创建一个逐渐放大的过渡动画对象

 @param originRect 其实位置和尺寸
 @return 返回动画类对象
 */
+ (instancetype)transitionWithOriginRect:(CGRect)originRect;



@end
