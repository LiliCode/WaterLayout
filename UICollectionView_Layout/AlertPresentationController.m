//
//  AlertPresentationController.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/30.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertPresentationController.h"

@interface AlertPresentationController ()
@property (strong , nonatomic) UIView *dimmingView; //调光视图、遮罩

@end

@implementation AlertPresentationController

- (void)presentationTransitionWillBegin
{
    self.dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    self.dimmingView.backgroundColor = [UIColor grayColor];
    self.dimmingView.alpha = 0;
    
    self.presentedView.frame = self.containerView.bounds;
    [self.containerView addSubview:self.dimmingView];
    [self.containerView addSubview:self.presentedView];
    
    //转场协调器: 通过使用「负责呈现」的 controller 的 UIViewControllerTransitionCoordinator，我们可以确保我们的动画与其他动画一道儿播放。
    id<UIViewControllerTransitionCoordinator> coordonator = self.presentedViewController.transitionCoordinator;
    //启动协调
    [coordonator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        self.dimmingView.alpha = 0.6;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed)
    {
        [self.dimmingView removeFromSuperview];   //删除呈现视图
    }
}

- (void)dismissalTransitionWillBegin
{
    
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed)
    {
        [self.dimmingView removeFromSuperview];
    }
}

- (CGRect)frameOfPresentedViewInContainerView
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    CGFloat height = 250.0f;
    return CGRectMake(0, size.height - height, size.width, height);
}



@end
