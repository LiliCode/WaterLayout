//
//  AlertTransitionAnimation.m
//  UICollectionView_Layout
//
//  Created by LiliEhuu on 17/6/30.
//  Copyright © 2017年 LiliEhuu. All rights reserved.
//

#import "AlertTransitionAnimation.h"


@implementation AlertTransitionAnimation

- (void)showTransitionAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *alertView = [toViewController valueForKey:@"_contentView"];
    
    CGPoint center = alertView.center;
    center.y = [UIScreen mainScreen].bounds.size.height + alertView.bounds.size.height / 2.0f;
    alertView.center = center;
    
    toViewController.view.frame = [transitionContext containerView].bounds;
    [[transitionContext containerView] addSubview:toViewController.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:.6 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        CGPoint center = alertView.center;
        center.y = [UIScreen mainScreen].bounds.size.height - alertView.bounds.size.height / 2.0f;
        alertView.center = center;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
}




@end



