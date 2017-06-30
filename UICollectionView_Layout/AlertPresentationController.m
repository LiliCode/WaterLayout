//
//  AlertPresentationController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/30.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertPresentationController.h"

@interface AlertPresentationController ()

@end

@implementation AlertPresentationController

- (void)presentationTransitionWillBegin
{
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.presentedView];
    self.presentedView.alpha = 0;
    //转场协调器: 通过使用「负责呈现」的 controller 的 UIViewControllerTransitionCoordinator，我们可以确保我们的动画与其他动画一道儿播放。
    id<UIViewControllerTransitionCoordinator> coordonator = self.presentedViewController.transitionCoordinator;
    //启动协调
    [coordonator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.presentedView.alpha = 0.6;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed)
    {
        [self.presentedView removeFromSuperview];   //删除呈现视图
    }
}

- (void)dismissalTransitionWillBegin
{
    
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    
}



@end
